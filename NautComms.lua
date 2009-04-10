
-- declare colour codes for console messages
local RED     = "|cffff0000"
local GREEN   = "|cff00ff00"
local YELLOW  = "|cffffff00"
local WHITE   = "|cffffffff"
local GREY    = "|cffbababa"

local DEFAULT_CHANNEL = "NauticSync" -- do not change!
local DATA_VERSION = 5 -- route calibration versioning
local CMD_VERSION = "VER"
local CMD_KNOWN = "KWN3"

local Nauticus = Nauticus
local L = LibStub("AceLocale-3.0"):GetLocale("Nauticus")

local request
local requestList = {}
local requestVersion = false


function Nauticus:CancelRequest()
	if request then
		--self:DebugMessage("cancel request schedule")
		self:CancelTimer(request, true)
		request = nil
	end
end

function Nauticus:DoRequest(wait)
	self:CancelRequest()

	if wait then
		request = self:ScheduleTimer("DoRequest", wait)
		return
	end

	if next(requestList) then
		self:BroadcastTransportData()

		if requestVersion or next(requestList) then
			self:DoRequest(2.5)
			return
		end
	end

	if requestVersion then
		requestVersion = false
		local version = self.versionNum
		if self.version then version = version.." "..self.version; end
		self:SendMessage(CMD_VERSION.." "..version)
	end
end

local function GetLag()
	local _,_,lag = GetNetStats()
	return lag / 1000.0
end

local crunch, uncrunch

do
	local map = -- excludes: space, comma, colon, s, S, %, tab (\009) ; invalid: nul (\000), line feed (\010), bar (\124), >\127
		"0123456789ABCDEFGHIJKLMNOPQRTUVWXYZabcdefghijklmnopqrtuvwxyz!\"#$&'()*+-./;<=>?@[\\]^_`{}~"..
		"\001\002\003\004\005\006\007\008\011\012"..
		"\014\015\016\017\018\019\020\021\022\023\024\025\026\027\028\029\030\031\127"

	local _base = strlen(map)
	local digits = {}

	function crunch(num)
		--if true then return num; end
		if 0 > num then error("negative number"); end -- shouldn't happen, but just in case
		local s = ""
		local remain
		repeat
			remain = num % _base -- faster than fmod
			s = s..digits[remain]
			num = (num-remain) / _base -- faster than floor
		until 0 == num
		return s
	end

	local chrmap = {}

	function uncrunch(s)
		--if true then return tonumber(s); end
		local num = 0
		local base = 1
		for i = 1, strlen(s) do
			num = num + chrmap[strbyte(s, i)] * base
			base = base * _base -- faster than power (^)
		end
		return num
	end

	local c

	for i = 1, _base do
	   c = strbyte(map, i)
	   chrmap[c] = i-1
	   digits[i-1] = strchar(c)
	end
end

function Nauticus:BroadcastTransportData()
	local since, boots, swaps
	local lag = GetLag()
	local trans_str = ""

	for transit in pairs(requestList) do
		since, boots, swaps = self:GetKnownCycle(transit)
		trans_str = trans_str..crunch(transit)

		if since ~= nil then
			trans_str = trans_str..":"..crunch(math.floor((since+lag)*1000.0+.5))

			if swaps ~= 1 then
				trans_str = trans_str..":"..crunch(swaps)
			end

			if boots ~= 0 then
				if swaps == 1 then
					trans_str = trans_str..":"
				end

				trans_str = trans_str..":"..crunch(boots)
			end
		end

		trans_str = trans_str..","
		requestList[transit] = nil
		if 235 < strlen(trans_str) then break; end
	end

	if trans_str ~= "" then
		trans_str = strsub(trans_str, 1, -2) -- remove the last comma
		self:SendMessage(CMD_KNOWN.." "..crunch(DATA_VERSION).." "..trans_str)
		self:DebugMessage("tell our transports ; length: "..strlen(trans_str))
	else
		self:DebugMessage("nothing to tell")
	end
end

function Nauticus:RequestTransport(t)
	requestList[t] = true
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
		--self:DebugMessage("joined: "..channel)

		if strlower(channel) ~= strlower(DEFAULT_CHANNEL) and
			GetChannelName(DEFAULT_CHANNEL) == 0 then

			if joinedChannel then self:CancelTimer(joinedChannel, true); end
			joinedChannel = self:ScheduleTimer(function()
				if GetChannelName(DEFAULT_CHANNEL) == 0 then
					--self:DebugMessage("joining: "..DEFAULT_CHANNEL)
					JoinChannelByName(DEFAULT_CHANNEL)
					self:UpdateChannel()
					if self.debug then ListChannelByName(DEFAULT_CHANNEL); end
				end
			end, 5)
		end
	end

	if noticeType == "YOU_JOINED" or noticeType == "YOU_CHANGED" then
		local newZone = select(3, strfind(channel, "^.+ %- (.+)$"))

		if newZone and self.transitZones[newZone] then
			--self:DebugMessage("channel: "..newZone)
			-- special case; don't acknowledge zone change when brushing Durotar zone on Booty Bay <-> Ratchet route
			if self.currentZone == L["The Barrens"] and newZone == L["Durotar"] then return; end
			self.currentZone = newZone
			self.currentZoneTransports = self.transitZones[newZone]
		end
	end
end

-- extract key/value from message
local function GetArgs(message, separator)
	local args = { strsplit(separator, message) }
	for t = 1, #(args), 1 do
		if args[t] == "" then
			args[t] = nil
		end
	end
	return args
end

function Nauticus:CHAT_MSG_CHANNEL(eventName, msg, sender, _, numAndName, _, _, _, _, channel)
	if sender ~= UnitName("player") and strlower(channel) == strlower(DEFAULT_CHANNEL) then
		--self:DebugMessage("sender: "..sender.." ; length: "..strlen(msg))
		if 254 <= strlen(msg) then return; end -- message too big, probably corrupted

		local args = GetArgs(msg, " ")

		if args[1] == CMD_VERSION then -- version, num
			self:ReceiveMessage_version(tonumber(args[2]), sender)
		elseif args[1] == CMD_KNOWN then -- known, { transports }
			self:ReceiveMessage_known(tonumber(args[2]), self:StringToKnown(args[3]), sender)
		end
	end
end

function Nauticus:ReceiveMessage_version(clientversion, sender)
	--self:DebugMessage(sender.." says: version "..clientversion)

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
	if not next(requestList) then
		self:DebugMessage("received: version; no more to send")
		self:CancelRequest()
	end
end

function Nauticus:ReceiveMessage_known(version, transports, sender)
	if version ~= DATA_VERSION then return; end

	local lag = GetLag()
	local set, respond, since, boots, swaps

	for transit, values in pairs(transports) do
		since, boots, swaps = values.since, values.boots, values.swaps

		if since ~= nil then
			since = since/1000.0 + lag
			boots = tonumber(boots)
			swaps = swaps + 1 --imagine data is being transmitted (+1)
		end

		set, respond = self:IsBetter(transit, since, boots, swaps)

		--@debug@
		if self.debug then
			local ourSince, ourBoots, ourSwaps = self:GetKnownCycle(transit)
			local debugColour
			if set == nil then
				debugColour = RED
			elseif set then
				debugColour = GREEN
			elseif respond then
				debugColour = YELLOW
			else
				debugColour = GREY
			end
			local output = sender.." knows "..transit.." "..debugColour..
				(since and since.."|r (b:"..boots..",s:"..swaps..")" or "nil|r").." vs our "..
				(ourSince and format("%0.3f", ourSince).." (b:"..ourBoots..",s:"..ourSwaps..")" or "nil")
			if ourSince and since then
				output = output.." ; diff: "..format("%0.3f", ourSince-since)..
					" ; cycles: "..format("%0.6f", (ourSince-since) / self.rtts[transit])
			end
			self:DebugMessage(output)
		end
		--@end-debug@

		if set ~= nil then -- true or false...
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
					local ageDiff = math.floor((ourSince - since) / self.rtts[transit] + .5)
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
	local args_tmp, transit, since, swaps, boots
	local args = GetArgs(transports, ",")
	local trans_tab = {}

	for t = 1, #(args), 1 do
		args_tmp = GetArgs(args[t], ":")
		transit = uncrunch(args_tmp[1])

		if self.transports[transit] then
			since = args_tmp[2]
			if since then
				swaps, boots = args_tmp[3], args_tmp[4]
				trans_tab[transit] = {
					['since'] = uncrunch(since),
					['boots'] = boots and uncrunch(boots) or 0,
					['swaps'] = swaps and uncrunch(swaps) or 1,
				}
			else
				trans_tab[transit] = {}
			end
		else
			self:DebugMessage("unknown transit: "..transit)
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
		--self:DebugMessage("distribution change")
		self:CancelRequest()

		for id in pairs(self.transports) do
			requestList[id] = true
		end

		requestVersion = true
		self:DoRequest(5 + math.random() * 15)
		--self:DebugMessage("distrib: "..DEFAULT_CHANNEL)
	end
end

do
	local function ChatFilter_DataChannel(msg)
		if strlower(arg9) == strlower(DEFAULT_CHANNEL) and not Nauticus.debug then
			return true -- silence
		end
	end

	ChatFrame_AddMessageEventFilter("CHAT_MSG_CHANNEL", ChatFilter_DataChannel)
end
