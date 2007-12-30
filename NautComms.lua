
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

local Nauticus = Nauticus

local L = AceLibrary("AceLocale-2.2"):new("Nauticus")

local rtts, transports = Nauticus.rtts, Nauticus.transports

local GetLag


function Nauticus:DoRequest()
	if next(self.requestList) ~= nil then
		self:BroadcastTransportData()

		if self.requestVersion then
			self:ScheduleEvent("NAUT_REQUEST", self.DoRequest, 5, self)
			return
		end
	end

	if self.requestVersion then
		local versionNum = self.versionNum

		self.requestVersion = false
		self:SendMessage(nil, "VER "..versionNum)
	end
end

function Nauticus:BroadcastTransportData(to, requestList)

	local since, boots, swaps
	local lag = GetLag()
	local trans_str = ""

	if not requestList then requestList = self.requestList; end

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
		self:SendMessage(to, "KNW "..self.dataVersion.." "..trans_str)
		self:DebugMessage("tell our transports")
	else
		self:DebugMessage("nothing to tell")
	end

end

function Nauticus:SendMessage(to, msg)
	if self.comm_disable then return; end

	if to then
		SendAddonMessage("Naut2", msg, "WHISPER", to)
	elseif self.distribution == "CUSTOM" then
		if self.debug and UnitName("player") == "Naute" then
			SendAddonMessage("Naut2", msg, "WHISPER", "Nauticus")
		elseif self.dataChannel and GetChannelName(self.dataChannel) then
			SendChatMessage(msg, "CHANNEL", nil, GetChannelName(self.dataChannel))
		end
	elseif self.distribution then
		SendAddonMessage("Naut2", msg, self.distribution)
	end
end

-- if we joined a channel
function Nauticus:CHAT_MSG_CHANNEL_NOTICE(noticeType, _, _, numAndName, _, _, _, num, channel)

	if noticeType == "YOU_JOINED" then
		self:DebugMessage("joined: "..channel)
		local channel_lower = strlower(channel)

		-- legacy channel
		if channel_lower == "zeppelinmaster" then
			if self.debug then
				ListChannelByName(channel)
				SendChatMessage("VER:1.7:2", "CHANNEL", nil, GetChannelName(channel))

				self:ScheduleEvent(function()
					SendChatMessage("VER:1.7:x", "CHANNEL", nil, GetChannelName(channel))
				end, 5, self)
			else
				LeaveChannelByName(channel)
			end

			return

		elseif self.dataChannel and channel_lower ~= strlower(self.dataChannel) and
			GetChannelName(self.dataChannel) == 0 then

			self:ScheduleEvent("NAUT_CHAN_JOIN", function()
				if self.dataChannel and GetChannelName(self.dataChannel) == 0 then
					self:DebugMessage("joining: "..self.dataChannel)
					JoinChannelByName(self.dataChannel)
					self:UpdateDistribution()
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
		strlower(channel) == strlower(self.dataChannel) and self.distribution == "CUSTOM" then

		local Args = self:GetArgs(msg, " ")
		self:ReceiveMessage("Naut2", sender, "CUSTOM", Args[1], Args[2], Args[3])
	end
end

function Nauticus:CHAT_MSG_ADDON(prefix, msg, distribution, sender)
	if prefix == "Naut2" and sender ~= UnitName("player") then
		local Args = self:GetArgs(msg, " ")
		self:ReceiveMessage(prefix, sender, distribution, Args[1], Args[2], Args[3])
	end
end

function Nauticus:ReceiveMessage(prefix, sender, distribution, command, arg1, arg2)
	if command == nil then self:DebugMessage("nil command!"); return; end

	self:DebugMessage("pre: "..prefix.." ; sender: "..sender.." ; dis: "
		..distribution.." ; cmd: "..command)

	-- version, num
	if command == "VER" then
		self:ReceiveMessage_version(sender, distribution, tonumber(arg1))

	-- known, { transports }
	elseif command == "KNW" then
		self:ReceiveMessage_known(sender, distribution, tonumber(arg1), self:StringToKnown(arg2))

	end
end

function Nauticus:ReceiveMessage_version(sender, distribution, clientversion)

	local isDirect = distribution == "WHISPER"

	self:DebugMessage(sender.." says: version "..clientversion)

	if clientversion > self.versionNum then
		if not self.db.account.newerVersion then
			self.db.account.newerVersion = clientversion
			self.db.account.newerVerAge = time()
		elseif clientversion > self.db.account.newerVersion then
			self.db.account.newerVersion = clientversion
		end

	elseif clientversion < self.versionNum then
		if isDirect then
			self:SendMessage(sender, "version", self.versionNum)
		else
			self.requestVersion = true
			self:ScheduleEvent("NAUT_REQUEST", self.DoRequest, 5+math.floor(math.random()*15), self)
		end

		return
	end

	if not isDirect then
		self.requestVersion = false

		-- if we don't need to send back any data, cancel our scheduler immediately
		if self:IsEventScheduled("NAUT_REQUEST") and next(self.requestList) == nil then
			self:DebugMessage("we should cancel request schedule")
			self:CancelScheduledEvent("NAUT_REQUEST")
		end
	end

end

function Nauticus:ReceiveMessage_known(sender, distribution, version, transports)

	if version < self.dataVersion then return; end

	local lag = GetLag()
	local set, respond, since, boots, swaps, requestList
	local isDirect = distribution == "WHISPER"

	if isDirect then
		requestList = {}
	else
		requestList = self.requestList
	end

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
				--self.tempText = RED.."Receiving Data.."
				--self.tempTextCount = 2
				self:SetKnownCycle(transit, since, boots, swaps)
			end

			requestList[transit] = respond
		end
	end

	if isDirect then
		if next(requestList) then
			self:BroadcastTransportData(sender, requestList)
		end
	else
		-- if we don't need to send back any data, cancel our scheduler immediately
		if next(requestList) then
			self:ScheduleEvent("NAUT_REQUEST", self.DoRequest, 5+math.floor(math.random()*15), self)
		elseif not self.requestVersion and self:IsEventScheduled("NAUT_REQUEST") and
			next(requestList) == nil then

			self:DebugMessage("we should cancel request schedule")
			self:CancelScheduledEvent("NAUT_REQUEST")
		end
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

		elseif since >= 0 then
			if boots < ourBoots then
				return true -- set, no response
			elseif boots > ourBoots then
				return false, true -- no set, respond
			else
				-- age difference; positive = better, negative = worse
				local ageDiff = math.floor((ourSince - since) / rtts[transit] + .5)

				if 0 < ageDiff then -- (age < ourAge)
					return true -- set, no response
				elseif 0 > ageDiff then -- (age > ourAge)
					return false, true -- no set, respond
				else
					if swaps < ourSwaps then
						return true -- set, no response
					elseif swaps > ourSwaps+2 then --imagine data is being transmitted (+1 plus +1 for previous transmit)
						return false, true -- no set, respond
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

function Nauticus:UpdateDistribution(wait)

	if wait then
		self:ScheduleEvent("NAUT_UPD_DISTRO", function()
			self:UpdateDistribution()
		end, wait, self)

		return
	end

	local distribution = self.distribution
	local newDistrib

	if GetNumPartyMembers() > 0 then
		newDistrib = "RAID"
	elseif IsInGuild() and self.db.profile.dataChannel == "guild" then
		newDistrib = "GUILD"
	elseif self.dataChannel then
		newDistrib = "CUSTOM"
	else
		newDistrib = nil
	end

	if newDistrib ~= distribution then
		if self:IsEventScheduled("NAUT_REQUEST") then
			self:DebugMessage("distribution change - cancel request schedule")
			self:CancelScheduledEvent("NAUT_REQUEST")
		end

		if newDistrib == "CUSTOM" then
			if distribution == "RAID" or distribution == "GUILD" then
				self:UnregisterEvent("CHAT_MSG_ADDON")
			end
		elseif newDistrib == "RAID" or newDistrib == "GUILD" then
			self:RegisterEvent("CHAT_MSG_ADDON")
		end

		self.distribution = newDistrib

		if newDistrib then
			for index, data in pairs(transports) do
				if data.label ~= -1 then
					self.requestList[data.label] = true
				end
			end

			self.requestVersion = true
			self:ScheduleEvent("NAUT_REQUEST", self.DoRequest, 5+math.floor(math.random()*15), self)
		end

		if self.debug then
			if not newDistrib then newDistrib = "NONE" end
			self:DebugMessage("distrib: "..newDistrib)
		end
	end

end

function Nauticus:GetChannel(dataChannel)
	if not dataChannel then dataChannel = self.db.profile.dataChannel; end
	if dataChannel == "none" then return nil
	elseif dataChannel == "guild" then
		if IsInGuild() then return nil
		else return DEFAULT_CHANNEL; end
	end

	return dataChannel
end

function GetLag()
	local _,_,lag = GetNetStats()
	return lag / 1000.0
end
