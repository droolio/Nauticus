﻿
-- declare colour codes for console messages
local RED     = "|cffff0000"
local GREEN   = "|cff00ff00"
local BLUE    = "|cff0000ff"
local MAGENTA = "|cffff00ff"
local YELLOW  = "|cffffff00"
local CYAN    = "|cff00ffff"
local WHITE   = "|cffffffff"
local ORANGE  = "|cffffba00"

local DEFAULT_CHANNEL = "NauticSync" -- do not change!
local DATA_VERSION = 303 -- route calibration versioning

local Nauticus = Nauticus

local L = LibStub("AceLocale-3.0"):GetLocale("Nauticus")

local rtts, transports = Nauticus.rtts, Nauticus.transports

local GetLag

local request
local requestVersion = false


function Nauticus:CancelRequest()
	if request then self:CancelTimer(request, true); request = nil; end
end

function Nauticus:DoRequest(wait)
	self:CancelRequest()

	if wait then
		request = self:ScheduleTimer("DoRequest", wait)
		return
	end

	if next(self.requestList) ~= nil then
		self:BroadcastTransportData()

		if requestVersion then
			request = self:ScheduleTimer("DoRequest", 5)
			return
		end
	end

	if requestVersion then
		local versionNum = self.versionNum

		requestVersion = false
		self:SendMessage("VER "..versionNum)
	end
end

function Nauticus:BroadcastTransportData()

	local since, boots, swaps
	local lag = GetLag()
	local trans_str = ""
	local requestList = self.requestList

	for transit in pairs(requestList) do
		since, boots, swaps = self:GetKnownCycle(transit)
		trans_str = trans_str..self.lookupIndex[transit]

		if since ~= nil then
			trans_str = trans_str..":"..math.floor((since+lag)*1000.0+.5)

			if swaps ~= 1 then
				trans_str = trans_str..":"..swaps
			end

			if boots ~= 0 then
				if swaps == 1 then
					trans_str = trans_str..":"
				end

				trans_str = trans_str..":"..boots
			end
		end

		trans_str = trans_str..","
		requestList[transit] = nil
	end

	if trans_str ~= "" then
		trans_str = string.sub(trans_str, 1, -2) -- remove the last comma
		self:SendMessage("KWN "..DATA_VERSION.." "..trans_str)
	end

end

function Nauticus:SendMessage(msg)
	if not self.comm_disable and GetChannelName(DEFAULT_CHANNEL) then
		SendChatMessage(msg, "CHANNEL", nil, GetChannelName(DEFAULT_CHANNEL))
	end
end

local joinedChannel

-- if we joined a channel
function Nauticus:CHAT_MSG_CHANNEL_NOTICE(eventName, noticeType, _, _, numAndName, _, _, _, num, channel)
	if noticeType == "YOU_JOINED" then
		if strlower(channel) ~= strlower(DEFAULT_CHANNEL) and
			GetChannelName(DEFAULT_CHANNEL) == 0 then

			if joinedChannel then self:CancelTimer(joinedChannel, true); end
			joinedChannel = self:ScheduleTimer(function()
				if GetChannelName(DEFAULT_CHANNEL) == 0 then
					JoinChannelByName(DEFAULT_CHANNEL)
					self:UpdateChannel()
				end
			end, 5)
		end
	end

	if noticeType == "YOU_JOINED" or noticeType == "YOU_CHANGED" then
		local newZone = select(3, string.find(channel, "^.+ %- (.+)$"))

		if newZone and self.transitZones[newZone] then
			-- special case; don't acknowledge zone change when brushing Durotar zone on Booty Bay <-> Ratchet route
			if not (self.currentZone == L["The Barrens"] and newZone == L["Durotar"]) then
				self.currentZone = newZone
				self.currentZoneTransports = self.transitZones[newZone]
			end
		end
	end
end

function Nauticus:CHAT_MSG_CHANNEL(eventName, msg, sender, _, numAndName, _, _, _, _, channel)
	if sender ~= UnitName("player") and strlower(channel) == strlower(DEFAULT_CHANNEL) then
		local Args = self:GetArgs(msg, " ")

		if Args[1] == "VER" then -- version, num
			self:ReceiveMessage_version(tonumber(Args[2]))
		elseif Args[1] == "KWN" then -- known, { transports }
			self:ReceiveMessage_known(tonumber(Args[2]), self:StringToKnown(Args[3]))
		end
	end
end

function Nauticus:ReceiveMessage_version(clientversion)
	if clientversion > self.versionNum then
		if not self.db.global.newerVersion then
			self.db.global.newerVersion = clientversion
			self.db.global.newerVerAge = time()
		elseif clientversion > self.db.global.newerVersion then
			self.db.global.newerVersion = clientversion
		end

	elseif clientversion < self.versionNum then
		requestVersion = true
		self:DoRequest(5 + math.random() * 15)
		return
	end

	requestVersion = false

	-- if we don't need to send back any data, cancel our scheduler immediately
	if not next(self.requestList) then
		self:CancelRequest()
	end
end

function Nauticus:ReceiveMessage_known(version, transports)

	if version ~= DATA_VERSION then return; end

	local lag = GetLag()
	local set, respond, since, boots, swaps
	local requestList = self.requestList

	for transit, values in pairs(transports) do
		since, boots, swaps = values.since, values.boots, values.swaps

		if since ~= nil then
			since = since/1000.0 + lag
			boots = tonumber(boots)
			swaps = swaps + 1 --imagine data is being transmitted (+1)
		end

		set, respond = self:IsBetter(transit, since, boots, swaps)

		if set ~= nil then
			if set then
				self:SetKnownCycle(transit, since, boots, swaps)
			end

			requestList[transit] = respond
		end
	end

	-- if we don't need to send back any data, cancel our scheduler immediately
	if next(requestList) then
		self:DoRequest(5 + math.random() * 15)
	elseif not requestVersion then
		self:CancelRequest()
	end

end

-- returns a, b
-- where a is if we should set our data to theirs (true or false) and b is how we should respond with ours (true or nil)
function Nauticus:IsBetter(transit, since, boots, swaps)

	local ourSince, ourBoots, ourSwaps = self:GetKnownCycle(transit)

	if since == nil then
		if ourSince == nil then
			return false -- no set, no response
		else
			return false, true -- no set, respond
		end

	else
		if ourSince == nil then
			return true -- set, no response

		elseif 0 <= since then
			if boots < ourBoots then
				return true -- set, no response
			elseif boots > ourBoots then
				return false, true -- no set, respond
			else
				-- swap difference; positive = better, less than -2 = worse, 0, -1, -2 = depends!
				local swapDiff = ourSwaps - swaps

				if 0 < swapDiff then -- (swaps < ourSwaps)
					return true -- set, no response
				elseif -2 > swapDiff then -- (swaps > ourSwaps+2); imagine data is being transmitted
					return false, true -- no set, respond
				else
					-- age difference; positive = better, negative = worse
					local ageDiff = math.floor((ourSince - since) / rtts[transit] + .5)
					local SET, RESPOND = true, true

					--  0 = maybe better for us but response pointless
					-- -1 = ignore/pointless
					-- -2 = worse for us but respond if better time
					if  0 ~= swapDiff then SET = false; end
					if -2 ~= swapDiff then RESPOND = nil; end

					if 0 < ageDiff then -- (age < ourAge)
						return SET -- set, no response
					elseif 0 > ageDiff then -- (age > ourAge)
						return false, RESPOND -- no set, respond
					else
						return false -- no set, no response
					end
				end
			end
		end
	end

end

function Nauticus:StringToKnown(transports)
	local Args = self:GetArgs(transports, ",")
	local trans_tab = {}

	for t = 1, #(Args), 1 do
		local Args_tmp = self:GetArgs(Args[t], ":")
		local transit, since, swaps, boots = tonumber(Args_tmp[1]), Args_tmp[2], Args_tmp[3], Args_tmp[4]

		if self.transports[transit] then
			transit = self.transports[transit].label

			if since ~= nil then
				trans_tab[transit] = {
					['since'] = tonumber(since),
					['boots'] = boots and tonumber(boots) or 0,
					['swaps'] = swaps and tonumber(swaps) or 1,
				}
			else
				trans_tab[transit] = {}
			end
		end
	end

	return trans_tab
end

local inChannel, updateChannel

function Nauticus:UpdateChannel(wait)
	if updateChannel then self:CancelTimer(updateChannel, true); updateChannel = nil; end

	if wait then
		updateChannel = self:ScheduleTimer("UpdateChannel", wait)
		return
	end

	if not inChannel then
		inChannel = true
		self:CancelRequest()

		for index, data in pairs(transports) do
			if data.label ~= -1 then
				self.requestList[data.label] = true
			end
		end

		requestVersion = true
		self:DoRequest(5 + math.random() * 15)
	end
end

function GetLag()
	local _,_,lag = GetNetStats()
	return lag / 1000.0
end
