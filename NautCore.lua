
-- declare colour codes for console messages
local RED     = "|cffff0000"
local GREEN   = "|cff00ff00"
local BLUE    = "|cff0000ff"
local MAGENTA = "|cffff00ff"
local YELLOW  = "|cffffff00"
local CYAN    = "|cff00ffff"
local WHITE   = "|cffffffff"
local ORANGE  = "|cffffba00"

-- constants
local PROX = 0.001
local PROX_HALF = PROX/2

Nauticus = AceLibrary("AceAddon-2.0"):new("AceDB-2.0", "AceConsole-2.0", "AceEvent-2.0")

local L = AceLibrary("AceLocale-2.2"):new("Nauticus")

local NautAstrolabe = DongleStub("Astrolabe-0.4")

local Nauticus = Nauticus
local rtts, platforms, triggers, transports, transitData

-- object variables
Nauticus.nautVersion = "2.2.0"
Nauticus.nautVersionNum = 220

Nauticus.activeTransit = -1
Nauticus.lowestNameTime = "--"
Nauticus.icon = "NauticusLogo"
Nauticus.tempText = ""
Nauticus.tempTextCount = 0

Nauticus.lastcheck_timeout = 10
Nauticus.requestVersion = false
Nauticus.requestList = {}
Nauticus.distribution = "NONE"

Nauticus.debug = false

-- local variables
local oldx, oldy = 0, 0 -- old player coords

local alarmOffset
local alarmSet = false
local alarmDinged = false
local alarmCountdown = 0

-- table of interesting (zone) transports to display or triggers to detect
local currentZoneTransports

Nauticus:RegisterDB("NauticusDB", "NauticusDBPC")
Nauticus:RegisterDefaults("profile", {
	zoneGUI = false,
	factionSpecific = true,
	zoneSpecific = false,
	cityAlias = true,
	filterChat = true,
	alarmOffset = 20,
	dataChannel = "NauticSync",
} )
Nauticus:RegisterDefaults("account", {
	knownCycles = { },
	debug = false,
} )
Nauticus:RegisterDefaults("char", {
	activeTransit = -1,
	showGUI = true,
	showLowerGUI = true,
	showIcons = true,
} )

local options = { type = 'group', args = {
	gui = {
		type = 'group',
		name = "GUI",
		desc = "GUI commands",
		args = {
			show = {
				type = 'execute',
				name = "Show GUI",
				desc = "Show the main GUI window",
				func = function()
					Nauticus.db.char.showGUI = true
					Nauticus.db.char.showLowerGUI = true
					Nauticus:UpdateUI()
				end
			},
			reset = {
				type = 'execute',
				name = "Reset GUI",
				desc = "Reset the main GUI window position",
				func = function()
					Nauticus.db.char.showGUI = true
					Nauticus.db.char.showLowerGUI = true
					local top, right = GetScreenHeight()/2 + 68, GetScreenWidth()/2 + 98
					if top ~= nil and right ~= nil then
						NautHeaderFrame:ClearAllPoints()
						NautHeaderFrame:SetPoint("TOPRIGHT", UIParent, "BOTTOMLEFT", right, top)
					end
					Nauticus:UpdateUI()
				end
			},
			icons = {
				type = 'toggle',
				name = "Show icons",
				desc = "Toggle on/off map icons",
				get = function()
					return Nauticus.db.char.showIcons
				end,
				set = function(v)
					Nauticus.db.char.showIcons = v
					Nauticus.showIcons = v
					if not v then
						NautAstrolabe:RemoveAllMinimapIcons()
					end
				end,
			},
		}
	},
	filter = {
		type = 'toggle',
		name = "Goblin chat filter",
		desc = "Toggle on/off chat filter for yelling goblin spam",
		get = function()
			return Nauticus.db.profile.filterChat
		end,
		set = function(v)
			Nauticus.db.profile.filterChat = v
			Nauticus.filterChat = v
		end,
	},
	alarm = {
		type = 'range',
		name = "Alarm delay",
		desc = "Change the alarm delay (in seconds)",
		get = function()
			return Nauticus.db.profile.alarmOffset
		end,
		set = function(v)
			alarmOffset = v
			Nauticus.db.profile.alarmOffset = v
		end,
		min = 0,
		max = 80,
		step = 5,
	},
	channel = {
		type = 'text',
		name = "Sync channel",
		desc = "Sets a custom name for the sync channel",
		hidden = true,
		usage = "<name>",
		get = function()
			return Nauticus.db.profile.dataChannel
		end,
		set = function(name)
			if Nauticus.distribution == "CUSTOM" and Nauticus.dataChannel ~= "none" and
				GetChannelName(Nauticus.dataChannel) ~= 0
			then
				LeaveChannelByName(Nauticus.dataChannel)
			end
			Nauticus.db.profile.dataChannel = name
			Nauticus.dataChannel = name
			if Nauticus.distribution == "CUSTOM" and Nauticus.dataChannel ~= "none" and
				GetChannelName(Nauticus.dataChannel) == 0
			then
				JoinChannelByName(Nauticus.dataChannel)
			end
		end,
	},
	reset = {
		type = 'execute',
		name = "Reset",
		desc = "Reset all known cycles",
		confirm = true,
		func = function()
			NautAstrolabe:RemoveAllMinimapIcons()
			Nauticus.db.account.knownCycles = {}
			Nauticus:TransportSelectSetNone()
		end
	},
} }
Nauticus:RegisterChatCommand( { "/nauticus", "/naut" }, options)


local Pre_ChatFrame_OnEvent, Naut_ChatFrame_OnEvent

function Nauticus:OnInitialize()
	rtts, platforms, triggers, transports =
		self.rtts, self.platforms, self.triggers, self.transports

	self:InitialiseConfig()
	self:InitialiseUI()

	this:RegisterEvent("CHAT_MSG_MONSTER_YELL")
	this:RegisterEvent("CHAT_MSG_MONSTER_SAY")

	Pre_ChatFrame_OnEvent = ChatFrame_OnEvent
	ChatFrame_OnEvent = Naut_ChatFrame_OnEvent
end

local function GetPattern(text)
	return '^'..gsub(text, "%%s", ".+")..'$'
end

local FILTER_ARRIVED1 = GetPattern(L["The zeppelin to %s has just arrived! All aboard for %s!"])
local FILTER_ARRIVED2 = GetPattern(L["Don't be late, the next ship to %s departs in only a minute!"])
local FILTER_ARRIVED_AT = GetPattern(L["The zeppelin should have just arrived at %s..."])
local FILTER_LEFT_AT = GetPattern(L["The zeppelin should have just left from %s..."])
local FILTER_ARRIVING_SOON = GetPattern(L["The zeppelin to %s should be arriving here any time now."])
local FILTER_THERE_GOES = GetPattern(L["There goes the zeppelin to %s. I hope there's no explosions this time."])

function Naut_ChatFrame_OnEvent(event)

	if event == "CHAT_MSG_CHANNEL" and Nauticus.dataChannel ~= "none" and
		string.lower(arg9) == string.lower(Nauticus.dataChannel) then

		-- silence
		if Nauticus.debug then
			return Pre_ChatFrame_OnEvent(event)
		end

	elseif Nauticus.filterChat and event == "CHAT_MSG_MONSTER_YELL" and
		(string.find(arg1, FILTER_ARRIVED1) or string.find(arg1, FILTER_ARRIVED2)) then

		Nauticus:DebugMessage(arg2.." yells: "..arg1)

	elseif Nauticus.filterChat and event == "CHAT_MSG_MONSTER_SAY" and
		(string.find(arg1, FILTER_ARRIVED_AT) or string.find(arg1, FILTER_LEFT_AT) or
		string.find(arg1, FILTER_ARRIVING_SOON) or string.find(arg1, FILTER_THERE_GOES)) then

		Nauticus:DebugMessage(arg2.." says: "..arg1)
	else
		return Pre_ChatFrame_OnEvent(event)
	end

end

function Nauticus:OnEnable()
	self:RegisterEvent("CHAT_MSG_CHANNEL")
	self:RegisterEvent("ZONE_CHANGED_NEW_AREA")
	self:RegisterEvent("CHAT_MSG_CHANNEL_NOTICE")

	self:RegisterEvent("PLAYER_ENTERING_WORLD")
	self:RegisterBucketEvent("PARTY_MEMBERS_CHANGED", 2)
	self:RegisterBucketEvent("PLAYER_GUILD_UPDATE", 2)

	self:ScheduleRepeatingEvent(self.DrawMapIcons, 0.2, self) -- every 1/5th of a second
	self:ScheduleRepeatingEvent(self.Clock_OnUpdate, 1, self, 1) -- every second (clock tick)
	self:ScheduleRepeatingEvent(self.CheckTriggers_OnUpdate, 0.8, self, 0.8) -- every 4/5th of a second

	self:RegisterEvent("WORLD_MAP_UPDATE")

	-- wait 5 seconds before joining any comms channels
	self:ScheduleEvent(function() self:UpdateDistribution(); end, 5, self)

	currentZone = GetRealZoneText()
	currentZoneTransports = self.transitZones[currentZone]
	self:DebugMessage("enabled: "..currentZone)

	self:TransportSelectSetNone()

	local top, right = self.db.char.top, self.db.char.right

	if not top then
		top, right = GetScreenHeight()/2 + 68, GetScreenWidth()/2 + 98
		self:DebugMessage("no ui!")
	end

	NautHeaderFrame:ClearAllPoints()
	NautHeaderFrame:SetPoint("TOPRIGHT", UIParent, "BOTTOMLEFT", right, top)

	self:UpdateUI()
end

function Nauticus:OnDisable()
	self.distribution = nil
	NautAstrolabe:RemoveAllMinimapIcons()
	NautHeaderFrame:Hide()
end

function Nauticus:DrawMapIcons()

	local transit, liveData, cycle, platform, offsets, currentX, currentY, isZoneInteresting

	if NautHeaderFrame.isMoving then self:UpdateUI() end

	for t = 1, #(transports), 1 do
		transit = transports[t].label

		if self:HasKnownCycle(transit) then
			liveData = self.liveData[transit]
			cycle = math.fmod(self:GetKnownCycle(transit), rtts[transit])

			offsets = transitData[transit].offset
			platform = liveData.index

			if platform > #(offsets) or
				(platform > 1 and offsets[platform-1] > cycle) then
					platform = 1; end

			for i = platform, #(offsets) do
				if offsets[i] > cycle then
					platform = i
					break
				end
			end

			liveData.cycle, liveData.index = cycle, platform

			if self.showIcons then
				isZoneInteresting = currentZoneTransports ~= nil and currentZoneTransports[transit]

				if isZoneInteresting or NautAstrolabe.WorldMapVisible then
					currentX, currentY = self:CalcTripPosition(transit, cycle, platform)

					if currentX and currentY then
						local buttonMini, buttonWorld =
							getglobal("Naut_MiniMapIconButton"..t),
							getglobal("Naut_WorldMapIconButton"..t)

						if NautAstrolabe.WorldMapVisible then
							NautAstrolabe:PlaceIconOnWorldMap(WorldMapDetailFrame, buttonWorld,
								0, 0, currentX, currentY)

						elseif buttonWorld:IsVisible() then
							NautAstrolabe:RemoveIconFromMinimap(buttonWorld)
						end

						if isZoneInteresting then
							NautAstrolabe.UpdateTimer = NautAstrolabe.MinimapUpdateTime
							NautAstrolabe:PlaceIconOnMinimap(buttonMini, 0, 0, currentX, currentY)

							if NautAstrolabe:IsIconOnEdge(buttonMini) then
								buttonMini:SetAlpha(.66)
							else
								buttonMini:SetAlpha(.9)
							end

							NautAstrolabe:UpdateMinimapIconPositions()
						elseif buttonMini:IsVisible() then
							NautAstrolabe:RemoveIconFromMinimap(buttonMini)
						end
					end
				else
					getglobal("Naut_MiniMapIconButton"..t):Hide()
				end
			end
		end
	end

end

function Nauticus:Clock_OnUpdate(elapse)

	local transit, liveData, cycle, platform

	if alarmDinged then
		alarmCountdown = alarmCountdown - elapse

		if 0 > alarmCountdown then
			alarmSet, alarmDinged = false, false
			PlaySound("AuctionWindowClose")
		end
	end

	if self:HasKnownCycle(self.activeTransit) then
		transit = self.activeTransit
		liveData = self.liveData[transit]
		cycle, platform = liveData.cycle, liveData.index

		local lowestTime = 500
		local plat_name, plat_time, formatted_time, colour

		for index, data in pairs(platforms[transit]) do
			if self:IsAlias() then
				plat_name = data.alias
			else
				plat_name = data.name
			end

			if NautFrame:IsVisible() then
				getglobal("NautFramePlat"..(index+1).."Name"):SetText(plat_name)
			end

			if data.index == platform then
				-- we're at a platform and waiting to depart
				plat_time = self:CalcTripCycleTimeByIndex(transit, platform) - cycle

				if alarmSet and not alarmDinged and plat_time < alarmOffset then
					alarmDinged = true
					alarmCountdown = plat_time
					PlaySoundFile("Sound\\Spells\\PVPFlagTakenHorde.wav")
				end

				if plat_time >= 60 then
					formatted_time = format("%dm %02ds", plat_time/60,
						math.fmod(plat_time, 60) )
				else
					formatted_time = format("%ds", plat_time)
				end

				if plat_time > 30 then
					colour = YELLOW
				else
					colour = RED
				end

				if NautFrame:IsVisible() then
					getglobal("NautFramePlat"..(index+1).."ArrivalDepature"):SetText(YELLOW..L["Departure"]..":")
					getglobal("NautFramePlat"..(index+1).."Time"):SetText(colour..formatted_time)
				end

				lowestTime = -500
				self.lowestNameTime = data.ebv.." "..colour..formatted_time
				self.icon = "Departing"

			else
				plat_time = self:CalcTripCycleTimeByIndex(transit, data.index-1) - cycle

				if plat_time < 0 then
					plat_time = plat_time + rtts[transit]
				end

				if plat_time >= 60 then
					formatted_time = format("%dm %02ds", plat_time/60,
						math.fmod(plat_time, 60) )
				else
					formatted_time = format("%ds", plat_time)
				end

				if NautFrame:IsVisible() then
					getglobal("NautFramePlat"..(index+1).."ArrivalDepature"):SetText(YELLOW..L["Arrival"]..":")
					getglobal("NautFramePlat"..(index+1).."Time"):SetText(GREEN..formatted_time)
				end

				if plat_time < lowestTime then
					lowestTime = plat_time
					self.lowestNameTime = data.ebv.." "..GREEN..formatted_time
					self.icon = "Transit"
				end
			end
		end

		if NauticusFu then
			NauticusFu:UpdateDisplay()
		end
	end

	if self.iconTooltip then
		self.iconTablet:Refresh(self.iconTooltip)
	end

end

function Nauticus:CheckTriggers_OnUpdate(elapse)

	if currentZoneTransports == nil then return; end

	self.lastcheck_timeout = self.lastcheck_timeout + elapse
	if 10.0 > self.lastcheck_timeout then return; end

	local c, z, x, y = NautAstrolabe:GetCurrentPlayerPosition()
	if not x then return; end
	x, y = NautAstrolabe:TranslateWorldMapPosition(c, z, x, y, 0, 0)
	if not x then return; end

	-- have we moved by at least half the proximity range?
	if abs(x - oldx) > PROX_HALF or abs(y - oldy) > PROX_HALF then
		oldx, oldy = x, y

		--check X/Y coords against all triggers for all transports
		for transit, i in pairs(currentZoneTransports) do
			for i, index in pairs(triggers[transit]) do
				if abs(x - transitData[transit].x[index]) <= PROX and
					abs(y - transitData[transit].y[index]) <= PROX and
					not IsFlying() and not IsSwimming() then

					self:SetKnownTime(transit, index, x, y)
					return
				end
			end
		end
	end

end

function Nauticus:SetKnownTime(transit, index, x, y)

	self.lastcheck_timeout = 0

	local transitData = transitData[transit]
	local ix, iy = transitData.x[index-1], transitData.y[index-1]
	local extrapolate = -transitData.dt[index] + transitData.dt[index] *
		(self:CalcDistance(x, y, ix, iy) /
		self:CalcDistance(transitData.x[index], transitData.y[index], ix, iy) )

	self:DebugMessage("extrapolate: "..extrapolate)

	local sum_time = self:CalcTripCycleTimeByIndex(transit, index) + extrapolate

	if self.debug then
		if self:HasKnownCycle(transit) then
			local oldCycle = math.fmod(self:GetKnownCycle(transit), rtts[transit])
			self:DebugMessage(transit..", cycle time: "..sum_time.." ; old: "
				..format("%0.3f", oldCycle).." ; diff: "..format("%0.3f", oldCycle-sum_time)
				.." ; drift: "..format("%0.6f",
					(oldCycle-sum_time)/((self:GetKnownCycle(transit)-sum_time)/rtts[transit]) )
				)
		else
			self:DebugMessage(transit..", cycle time: "..sum_time)
		end
	end

	self:SetKnownCycle(transit, sum_time, 0, 0)
	self.db.account.uptime = GetTime()
	self.db.account.timestamp = time()

	self.requestList[transit] = true
	self:ScheduleEvent("NAUT_REQUEST", self.DoRequest, 10+math.floor(math.random()*10), self)

end

function Nauticus:CalcTripCycleTimeByIndex(transit, index)
	if index == 0 then return 0 end
	return transitData[transit].offset[index]
end

function Nauticus:CalcTripPosition(transit, cycle, index)
	local transitData = transitData[transit]

	if index == 1 then
		return transitData.x[index], transitData.y[index]
	else
		local fraction = (cycle - transitData.offset[index-1]) / transitData.dt[index]

		return transitData.x[index-1] + transitData.dx[index] * fraction,
			transitData.y[index-1] + transitData.dy[index] * fraction
	end
end

function Nauticus:CalcDistance(x1, y1, x2, y2)
	local dx = x1 - x2
	local dy = y1 - y2
	return math.sqrt(dx * dx + dy * dy)
end

-- initialise saved variables and data
function Nauticus:InitialiseConfig()

	self:DebugMessage("init config...")

	-- convert legacy timers
	if nautSavedVars then
		if nautSavedVars.knownCycleData then
			self:DebugMessage("convert beta timers")
			self.db.account.knownCycles = nautSavedVars.knownCycleData
		elseif nautSavedVars.knownTimes then
			local knownCycles = self.db.account.knownCycles

			self:DebugMessage("convert old timers")

			for transport, since in pairs(nautSavedVars.knownTimes) do
				knownCycles[transport] = { ['since'] = since, ['boots'] = 9, ['swaps'] = 9, }
			end
		end

		self.db.account.uptime = nautSavedVars.uptime
		self.db.account.timestamp = nautSavedVars.timestamp
		nautSavedVars = nil
	end

	self.dataChannel = self.db.profile.dataChannel
	self.debug = self.db.account.debug

	if self.db.account.newerVersion then
		self:DebugMessage("new version: "..self.db.account.newerVersion.." vs our "..self.nautVersionNum)

		if self.db.account.newerVersion > self.nautVersionNum then
			DEFAULT_CHAT_FRAME:AddMessage(YELLOW.."Nauticus|r - "..WHITE..
				L["There is a new version of Nauticus available! Please visit http://drool.me.uk/naut."])

			-- major update released and running old version longer than 10 days?
			if math.floor(self.db.account.newerVersion/10) > math.floor(self.nautVersionNum/10) and
				864000.0 < (time() - self.db.account.newerVerAge) then

				self.comm_disable = true
				DEFAULT_CHAT_FRAME:AddMessage(YELLOW.."Nauticus|r - "..RED..
					L["You have been using an old version of Nauticus for more than 10 days, outbound communications will now be disabled."])
			end

		else
			self.db.account.newerVersion = nil
			self.db.account.newerVerAge = nil
			DEFAULT_CHAT_FRAME:AddMessage(YELLOW.."Nauticus|r - "..L["Thank you for upgrading."])
		end
	end

	alarmOffset = self.db.profile.alarmOffset

	self.activeTransit = self.db.char.activeTransit
	self.showIcons = self.db.char.showIcons
	self.filterChat = self.db.profile.filterChat

	local now = GetTime()
	local the_time = time()

	if self.db.account.uptime ~= nil then
		-- calculate potential drift time in ms between sessions
		local drift = (the_time-now)-(self.db.account.timestamp-self.db.account.uptime)

		self:DebugMessage("boot drift: "..drift)

		-- if more than 3 mins drift, that means reboot occured. we need to adjust ms timers
		if math.abs(drift) > 180 then
			local since
			local knownCycles = self.db.account.knownCycles

			-- adjust all available transport times by drift
			for transport, times in pairs(self.db.account.knownCycles) do
				since = knownCycles[transport].since

				if since ~= nil then
					since = since - drift
					if now-since < 0 then since = nil; end
				end

				knownCycles[transport].since = since
				knownCycles[transport].boots = knownCycles[transport].boots + 1
			end

			self:DebugMessage("reboot must have occured")
		end
	end

	-- record uptime and 'when' (relative to local system clock) this was made
	self.db.account.uptime = now
	self.db.account.timestamp = the_time

	-- unpack transport data
	local packedData = self.packedData
	local args = {}
	local j, oldX, oldY, oldOffset, transit, transit_data, liveData

	self.transitData = {}
	self.liveData = {}
	transitData = self.transitData
	liveData = self.liveData

	for t = 1, #(transports), 1 do
		oldX, oldY, oldOffset = 0, 0, 0

		transit = transports[t].label
		transitData[transit] = { ['x'] = {}, ['y'] = {}, ['offset'] = {},
			['dx'] = {}, ['dy'] = {}, ['dt'] = {}, }

		transit_data = transitData[transit]

		for i = 1, #(packedData[transit]) do
			j = 0
			-- search for seperators in the string and return the separated data
			for value in string.gmatch(packedData[transit][i], "[^:]+") do
				j = j + 1; args[j] = value
			end

			transit_data.x[i] = args[1]+oldX
			transit_data.y[i] = args[2]+oldY
			transit_data.offset[i] = args[3]+60+oldOffset
			transit_data.dx[i] = tonumber(args[1])
			transit_data.dy[i] = tonumber(args[2])
			transit_data.dt[i] = tonumber(args[3])

			oldX, oldY, oldOffset =
				transit_data.x[i],
				transit_data.y[i],
				transit_data.offset[i]-60
		end

		transit_data.offset[#(packedData[transit])] = rtts[transit]

		liveData[transit] = { cycle = 0, index = 1, }
	end

	self.packedData = nil -- free some memory (too many indexes to recycle)

end

function Nauticus:PLAYER_ENTERING_WORLD()
	if GetRealZoneText() ~= "" then
		self:UnregisterEvent("PLAYER_ENTERING_WORLD")
		currentZoneTransports = self.transitZones[GetRealZoneText()]
		self:DebugMessage("enter: "..GetRealZoneText())
	end
end

local currentZone

-- if we joined a channel
function Nauticus:CHAT_MSG_CHANNEL_NOTICE(noticeType, _, _, numAndName, _, _, _, num, channel)

	if noticeType == "YOU_JOINED" then
		if self.debug then
			if channel == "NauticSync" then
				ListChannelByName("NauticSync")
				return

			elseif channel == "ZeppelinMaster" then
				ListChannelByName("ZeppelinMaster")
				SendChatMessage("VER:1.7:2", "CHANNEL", nil, GetChannelName("ZeppelinMaster"))
				SendChatMessage("VER:1.7:x", "CHANNEL", nil, GetChannelName("ZeppelinMaster"))
				return
			end

		-- /leave legacy channel(s)
		elseif channel == "ZeppelinMaster" then
			LeaveChannelByName(channel)
			return

		end
	end

	if noticeType == "YOU_JOINED" or noticeType == "YOU_CHANGED" then
		local newZone = select(3, string.find(channel, "^.+ %- (.+)$"))

		if newZone then
			if not (currentZone == L["The Barrens"] and newZone == L["Durotar"]) then
				currentZone = newZone
				currentZoneTransports = self.transitZones[currentZone]
			end

			self:DebugMessage("channel: "..currentZone)
		end
	end

end

function Nauticus:ZONE_CHANGED_NEW_AREA(loopback)
	if not loopback and currentZone == GetRealZoneText() then
		self:ScheduleEvent(self.ZONE_CHANGED_NEW_AREA, 1, self, true)
	else
		currentZone = GetRealZoneText()
		currentZoneTransports = self.transitZones[currentZone]
		self:DebugMessage("zoned: "..currentZone)

		-- show GUI when zone change contains a transport
		if currentZoneTransports and self:IsZoneGUI() then
			self.db.char.showLowerGUI = true
			self.db.char.showGUI = true
			self:UpdateUI()
		end
	end
end
	
function Nauticus:PARTY_MEMBERS_CHANGED()
	self:DebugMessage("update distro: party")
	self:UpdateDistribution()
end

function Nauticus:PLAYER_GUILD_UPDATE()
	self:DebugMessage("update distro: guild")
	self:UpdateDistribution()
end

local last_map_update = 0
function Nauticus:WORLD_MAP_UPDATE()
	if 0.2 > GetTime()-last_map_update then return; end
	last_map_update = GetTime()
	self:DrawMapIcons()
end

function Nauticus:ToggleAlarm()
	alarmSet = not alarmSet
	if not alarmSet then alarmDinged = false end
	local is; if alarmSet then is = RED.."ON|r" else is = GREEN.."OFF|r" end
	DEFAULT_CHAT_FRAME:AddMessage(YELLOW.."Nauticus|r - "..WHITE.."Alarm is now: "..is)
	PlaySound("AuctionWindowOpen")
end

function Nauticus:IsAlarmSet()
	return alarmSet or alarmDinged
end

function Nauticus:GetKnownCycle(transport)
	local knownCycle = self.db.account.knownCycles[transport]
	if knownCycle == nil then return nil; end
	local since = knownCycle.since
	if since ~= nil then since = GetTime()-since; end
	return since, knownCycle.boots, knownCycle.swaps
end

function Nauticus:SetKnownCycle(transport, since, boots, swaps)
	if self.db.account.knownCycles[transport] == nil then
		self.db.account.knownCycles[transport] = {}
	end

	local knownCycle = self.db.account.knownCycles[transport]

	knownCycle.since, knownCycle.boots, knownCycle.swaps =
		GetTime()-since, boots, swaps
end

function Nauticus:HasKnownCycle(transport)
	if transport == -1 then return nil; end
	return self.db.account.knownCycles[transport] ~= nil
end

-- extract key/value from message
function Nauticus:GetArgs(message, separator)
	local args = {}
	local i = 0

	-- search for seperators in the string and return the separated data
	for value in string.gmatch(message, "[^"..separator.."]+") do
		i = i + 1
		args[i] = value
	end

	return args
end

function Nauticus:DebugMessage(msg)
	if self.debug then
		ChatFrame4:AddMessage("[Naut]: "..msg)
	end
end
