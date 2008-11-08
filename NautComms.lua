
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
local DATA_VERSION = 243 -- route calibration versioning

local Nauticus = Nauticus

local L = AceLibrary("AceLocale-2.2"):new("Nauticus")

local rtts, transports = Nauticus.rtts, Nauticus.transports

local GetLag

local requestVersion = false


function Nauticus:CancelRequest()
	if self:IsEventScheduled("NAUT_REQUEST") then
		self:DebugMessage("cancel request schedule")
		self:CancelScheduledEvent("NAUT_REQUEST")
	end
end

function Nauticus:DoRequest(wait)
	if wait then
		self:ScheduleEvent("NAUT_REQUEST", self.DoRequest, wait, self)
		return
	end

	if next(self.requestList) ~= nil then
		self:BroadcastTransportData()

		if requestVersion then
			self:ScheduleEvent("NAUT_REQUEST", self.DoRequest, 5, self)
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
		self:SendMessage("KNW "..DATA_VERSION.." "..trans_str)
		self:DebugMessage("tell our transports")
	else
		self:DebugMessage("nothing to tell")
	end

end

function Nauticus:SendMessage(msg)
	if not self.comm_disable and self.dataChannel and GetChannelName(self.dataChannel) then
		SendChatMessage(msg, "CHANNEL", nil, GetChannelName(self.dataChannel))
	end
end

-- if we joined a channel
function Nauticus:CHAT_MSG_CHANNEL_NOTICE(noticeType, _, _, numAndName, _, _, _, num, channel)

	if noticeType == "YOU_JOINED" then
		self:DebugMessage("joined: "..channel)
		local channel_lower = strlower(channel)

		if self.dataChannel and channel_lower ~= strlower(self.dataChannel) and
			GetChannelName(self.dataChannel) == 0 then

			self:ScheduleEvent("NAUT_CHAN_JOIN", function()
				if self.dataChannel and GetChannelName(self.dataChannel) == 0 then
					self:DebugMessage("joining: "..self.dataChannel)
					JoinChannelByName(self.dataChannel)
					self:UpdateChannel()
					if self.debug then ListChannelByName(self.dataChannel); end
				end
			end, 5, self)

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

			self:DebugMessage("channel: "..self.currentZone)
		end
	end

end

function Nauticus:CHAT_MSG_CHANNEL(msg, sender, _, numAndName, _, _, _, _, channel)
	if sender ~= UnitName("player") and self.dataChannel and
		strlower(channel) == strlower(self.dataChannel) then

		local Args = self:GetArgs(msg, " ")
		self:ReceiveMessage("Naut2", sender, Args[1], Args[2], Args[3])
	end
end

function Nauticus:ReceiveMessage(prefix, sender, command, arg1, arg2)
	if command == nil then self:DebugMessage("nil command!"); return; end

	self:DebugMessage("pre: "..prefix.." ; sender: "..sender.." ; cmd: "..command)

	-- version, num
	if command == "VER" then
		self:ReceiveMessage_version(sender, tonumber(arg1))

	-- known, { transports }
	elseif command == "KNW" then
		self:ReceiveMessage_known(sender, tonumber(arg1), self:StringToKnown(arg2))

	end
end

function Nauticus:ReceiveMessage_version(sender, clientversion)

	self:DebugMessage(sender.." says: version "..clientversion)

	if clientversion > self.versionNum then
		if not self.db.account.newerVersion then
			self.db.account.newerVersion = clientversion
			self.db.account.newerVerAge = time()
		elseif clientversion > self.db.account.newerVersion then
			self.db.account.newerVersion = clientversion
		end

	elseif clientversion < self.versionNum then
		requestVersion = true
		self:DoRequest(5 + math.random() * 15)
		return
	end

	requestVersion = false

	-- if we don't need to send back any data, cancel our scheduler immediately
	if not next(self.requestList) then
		self:DebugMessage("received: version; no more to send")
		self:CancelRequest()
	end

end

function Nauticus:ReceiveMessage_known(sender, version, transports)

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

		if self.debug then
			local debugColour
			local ourSince, ourBoots, ourSwaps = self:GetKnownCycle(transit)

			if set ~= nil then
				if set then
					debugColour = GREEN
				elseif respond then
					debugColour = YELLOW
				else
					debugColour = WHITE
				end
			else
				debugColour = RED
			end

			if ourSince ~= nil then
				ourSince = math.floor(ourSince*1000.0)/1000.0

				if since ~= nil then
					self:DebugMessage(sender.." knows "..transit.." "..debugColour..
						since.."|r (boots: "..boots..", swaps: "..swaps..") vs our "..
						ourSince.." (boots: "..ourBoots..", swaps: "..ourSwaps..") ; diff: "..
						math.floor((ourSince-since)*1000.0)/1000.0)
				else
					self:DebugMessage(sender.." knows "..transit.." "..debugColour..
						"nil|r vs our "..ourSince.." (boots: "..ourBoots..", swaps: "..ourSwaps..")")
				end
			else
				if since ~= nil then
					self:DebugMessage(sender.." knows "..transit.." "..debugColour..
						since.."|r (boots: "..boots..", swaps: "..swaps..") vs our nil")
				else
					self:DebugMessage(sender.." knows "..transit.." "..debugColour..
						"nil|r vs our nil")
				end
			end
		end

		if set ~= nil then
			if set and not self.db.account.freeze then
				self:SetKnownCycle(transit, since, boots, swaps)
			end

			requestList[transit] = respond
		end
	end

	-- if we don't need to send back any data, cancel our scheduler immediately
	if next(requestList) then
		self:DoRequest(5 + math.random() * 15)
	elseif not requestVersion then
		self:DebugMessage("received: known; no more to send")
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
		local transit, since, swaps, boots =
			self.transports[tonumber(Args_tmp[1])].label, Args_tmp[2], Args_tmp[3], Args_tmp[4]

		if since ~= nil then
			if boots == nil then
				boots = 0
			else
				boots = tonumber(boots)
			end

			if swaps == nil then
				swaps = 1
			else
				swaps = tonumber(swaps)
			end

			trans_tab[transit] = {
				['since'] = tonumber(since),
				['boots'] = boots,
				['swaps'] = swaps
			}
		else
			trans_tab[transit] = {}
		end
	end

	return trans_tab
end

local inChannel

function Nauticus:UpdateChannel(wait)

	if wait then
		self:ScheduleEvent("NAUT_UPD_DISTRO", function()
			self:UpdateChannel()
		end, wait, self)

		return
	end

	if self.dataChannel ~= inChannel then
		self:DebugMessage("distribution change")
		self:CancelRequest()

		inChannel = self.dataChannel

		if self.dataChannel then
			for index, data in pairs(transports) do
				if data.label ~= -1 then
					self.requestList[data.label] = true
				end
			end

			requestVersion = true
			self:DoRequest(5 + math.random() * 15)
		end

		self:DebugMessage("distrib: "..(self.dataChannel and self.dataChannel or "NONE"))
	end

end

function Nauticus:GetChannel(dataChannel)
	if not dataChannel then dataChannel = self.db.profile.dataChannel; end
	if dataChannel == "none" then return nil
	elseif dataChannel == "guild" then return DEFAULT_CHANNEL; end
	return dataChannel
end

function GetLag()
	local _,_,lag = GetNetStats()
	return lag / 1000.0
end
