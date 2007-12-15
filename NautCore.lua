
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
local DEFAULT_CHANNEL = "NauticSync" -- do not change!
local ARTWORKPATH = "Interface\\AddOns\\Nauticus\\Artwork\\"
local ARTWORK_ZONING = ARTWORKPATH.."MapIcon_Zoning"
local MAX_FORMATTED_TIME = 256 -- the longest route minus 60

Nauticus = AceLibrary("AceAddon-2.0"):new("AceDB-2.0", "AceConsole-2.0", "AceEvent-2.0")

local L = AceLibrary("AceLocale-2.2"):new("Nauticus")

local NautAstrolabe = DongleStub("Astrolabe-0.4")

local Nauticus = Nauticus
local rtts, platforms, triggers, transports, transitData
local zonings

local GetTexCoord, formattedTimeCache

-- object variables
Nauticus.versionStr = "2.3.2" -- for display
Nauticus.versionNum = 232 -- for comparison
Nauticus.dataVersion = 230 -- route calibration versioning

Nauticus.activeTransit = -1
Nauticus.lowestNameTime = "--"
Nauticus.icon = "NauticusLogo"
Nauticus.tempText = ""
Nauticus.tempTextCount = 0

Nauticus.lastcheck_timeout = 30
Nauticus.requestVersion = false
Nauticus.requestList = {}

Nauticus.debug = false

-- local variables
local oldx, oldy = 0, 0 -- old player coords

local alarmOffset
local alarmSet = false
local alarmDinged = false
local alarmCountdown = 0

Nauticus:RegisterDB("NauticusDB", "NauticusDBPC")
Nauticus:RegisterDefaults("profile", {
	zoneGUI = false,
	factionSpecific = true,
	zoneSpecific = false,
	cityAlias = true,
	filterChat = true,
	alarmOffset = 20,
	dataChannel = DEFAULT_CHANNEL,
} )
Nauticus:RegisterDefaults("account", {
	knownCycles = {},
	debug = false,
} )
Nauticus:RegisterDefaults("char", {
	activeTransit = -1,
	showGUI = true,
	showLowerGUI = true,
	showIcons = true,
} )

Nauticus.options = { type = 'group', args = {
	gui = {
		type = 'group',
		name = "GUI",
		desc = "GUI commands",
		args = {
			show = {
				type = 'execute',
				name = "Show GUI",
				desc = "Show the main GUI window.",
				func = function()
					Nauticus.db.char.showGUI = true
					Nauticus.db.char.showLowerGUI = true
					Nauticus:UpdateUI()
				end
			},
			reset = {
				type = 'execute',
				name = "Reset GUI",
				desc = "Reset the main GUI window position.",
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
				desc = "Toggle on/off map icons.",
				get = function()
					return Nauticus.db.char.showIcons
				end,
				set = function(v)
					Nauticus.db.char.showIcons = v
					Nauticus.showIcons = v
					if not v then
						Nauticus:RemoveAllMinimapIcons()
					end
				end,
			},
		}
	},
	filter = {
		type = 'toggle',
		name = "Goblin chat filter",
		desc = "Toggle on/off chat filter for yelling goblin spam.",
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
		desc = "Change the alarm delay (in seconds).",
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
		desc = "Set custom sync channel.",
		--hidden = true,
		usage = "{<name> | default | none | guild}",
		get = function()
			return Nauticus.db.profile.dataChannel
		end,
		set = function(name)
			local name_lower = strlower(name)
			if name_lower == "" or name_lower == "default" or name_lower == strlower(DEFAULT_CHANNEL) then name = DEFAULT_CHANNEL
			elseif name_lower == "none" or name_lower == "guild" then name = name_lower; end
			local dataChannel = Nauticus.dataChannel
			local newChan = Nauticus:GetChannel(name)
			Nauticus.db.profile.dataChannel = name
			if newChan ~= dataChannel then
				if dataChannel and GetChannelName(dataChannel) ~= 0 then
					Nauticus:DebugMessage("leaving: "..dataChannel)
					LeaveChannelByName(dataChannel)
				end
				if newChan and GetChannelName(newChan) == 0 then
					Nauticus:DebugMessage("joining: "..newChan)
					JoinChannelByName(newChan)
					if Nauticus.debug then ListChannelByName(newChan); end
				end
				Nauticus.dataChannel = newChan
			end
			Nauticus:UpdateDistribution()
			if name ~= DEFAULT_CHANNEL then
				DEFAULT_CHAT_FRAME:AddMessage(YELLOW.."Nauticus|r - "..RED..
					format("WARNING: Setting the sync channel to anything other than '%s' will impact the addon's accuracy.", DEFAULT_CHANNEL))
			end
		end,
	},
	reset = {
		type = 'execute',
		name = "Reset",
		desc = "Reset all known cycles.",
		confirm = true,
		func = function()
			Nauticus:RemoveAllMinimapIcons()
			Nauticus.db.account.knownCycles = {}
			Nauticus:TransportSelectSetNone()
		end
	},
} }
Nauticus:RegisterChatCommand( { "/nauticus", "/naut" }, Nauticus.options)


local Pre_ChatFrame_OnEvent, Naut_ChatFrame_OnEvent

function Nauticus:OnInitialize()
	rtts, platforms, transports =
		self.rtts, self.platforms, self.transports

	self:InitialiseConfig()
	self:InitialiseUI()

	this:RegisterEvent("CHAT_MSG_MONSTER_YELL")
	this:RegisterEvent("CHAT_MSG_MONSTER_SAY")

	Pre_ChatFrame_OnEvent = ChatFrame_OnEvent
	ChatFrame_OnEvent = Naut_ChatFrame_OnEvent
end

local FILTER_NPC = {
-- orc2uc:
["Frezza"] = true, -- yells
["Zapetta"] = true, -- yell + says
["Sky-Captain Cloudkicker"] = true,
["Chief Officer Coppernut"] = true,
-- grom2uc:
["Hin Denburg"] = true, -- yells
["Navigator Hatch"] = true,
["Chief Officer Hammerflange"] = true,
-- org2gg:
["Snurk Bucksquick"] = true, -- yells
-- mh2thera:
["Captain \"Stash\" Torgoley"] = true,
["First Mate Kowalski"] = true,
["Navigator Mehran"] = true,
}

function Naut_ChatFrame_OnEvent(event)

	if event == "CHAT_MSG_CHANNEL" and Nauticus.dataChannel and
		strlower(arg9) == strlower(Nauticus.dataChannel) then

		-- silence
		if Nauticus.debug then
			return Pre_ChatFrame_OnEvent(event)
		end

	elseif not Nauticus.filterChat then
		return Pre_ChatFrame_OnEvent(event)

	elseif (event == "CHAT_MSG_MONSTER_SAY" or
		event == "CHAT_MSG_MONSTER_YELL") and FILTER_NPC[arg2] then

		Nauticus:DebugMessage(arg2.." yells: "..arg1)
		return
	end

	return Pre_ChatFrame_OnEvent(event)

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

	-- wait 10 seconds before sending to any comms channels
	self.dataChannel = self:GetChannel()
	self:UpdateDistribution(10)

	self.currentZone = GetRealZoneText()
	self.currentZoneTransports = self.transitZones[self.currentZone]
	self:DebugMessage("enabled: "..self.currentZone)

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
	Nauticus:RemoveAllMinimapIcons()
	NautHeaderFrame:Hide()
end

function Nauticus:DrawMapIcons()

	local transport, transit, liveData, cycle, platform, offsets, currentX, currentY, angle,
		isZoning, isZoneInteresting, buttonMini, buttonWorld

	local isWorldMapVisible = NautAstrolabe.WorldMapVisible

	if NautHeaderFrame.isMoving then self:UpdateUI() end

	for t = 1, #(transports), 1 do
		transport = transports[t]
		transit = transport.label

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
				isZoneInteresting = self.currentZoneTransports ~= nil and self.currentZoneTransports[transit]
				buttonMini, buttonWorld = transport.minimap_icon, transport.worldmap_icon

				if isZoneInteresting or isWorldMapVisible then
					currentX, currentY, angle, isZoning = self:CalcTripPosition(transit, cycle, platform)

					if currentX and currentY then
						if isWorldMapVisible then
							if isZoning ~= transport.status then
								if isZoning then
									transport.worldmap_texture:SetTexture(ARTWORK_ZONING)
								else
									transport.worldmap_texture:SetTexture(transport.texture_name)
								end

								transport.status = isZoning
							end

							NautAstrolabe:PlaceIconOnWorldMap(WorldMapDetailFrame, buttonWorld,
								0, 0, currentX, currentY)

							transport.worldmap_texture:SetTexCoord(GetTexCoord(angle))

						elseif buttonWorld:IsVisible() then
							NautAstrolabe:RemoveIconFromMinimap(buttonWorld)
						end

						if isZoneInteresting then
							NautAstrolabe:PlaceIconOnMinimap(buttonMini, 0, 0, currentX, currentY)
							transport.minimap_texture:SetTexCoord(GetTexCoord(angle-math.deg(MiniMapCompassRing:GetFacing())))

							if NautAstrolabe:IsIconOnEdge(buttonMini) then
								buttonMini:SetAlpha(.6)
							else
								buttonMini:SetAlpha(.9)
							end

							NautAstrolabe.UpdateTimer = NautAstrolabe.MinimapUpdateTime
							NautAstrolabe:UpdateMinimapIconPositions()
						elseif buttonMini:IsVisible() then
							NautAstrolabe:RemoveIconFromMinimap(buttonMini)
						end
					end
				elseif buttonMini:IsVisible() then
					buttonMini:Hide()
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
		local plat_name, plat_time, formatted_time, depOrArr, colour

		for index, data in pairs(platforms[transit]) do
			if self:IsAlias() then
				plat_name = data.alias
			else
				plat_name = data.name
			end

			if data.index == platform then
				-- we're at a platform and waiting to depart
				plat_time = self:CalcTripCycleTimeByIndex(transit, platform) - cycle

				if alarmSet and not alarmDinged and plat_time < alarmOffset then
					alarmDinged = true
					alarmCountdown = plat_time
					PlaySoundFile("Sound\\Spells\\PVPFlagTakenHorde.wav")
				end

				if plat_time > 30 then
					colour = YELLOW
				else
					colour = RED
				end

				depOrArr = L["Departure"]
				formatted_time = self.formattedTimeCache[floor(plat_time)]

				lowestTime = -500
				self.lowestNameTime = data.ebv.." "..colour..formatted_time
				self.icon = "Departing"

			else
				plat_time = self:CalcTripCycleTimeByIndex(transit, data.index-1) - cycle

				if plat_time < 0 then
					plat_time = plat_time + rtts[transit]
				end

				colour = GREEN
				depOrArr = L["Arrival"]
				formatted_time = self.formattedTimeCache[floor(plat_time)]

				if plat_time < lowestTime then
					lowestTime = plat_time
					self.lowestNameTime = data.ebv.." "..GREEN..formatted_time
					self.icon = "Transit"
				end
			end

			if NautFrame:IsVisible() then
				getglobal("NautFramePlat"..index.."Name"):SetText(plat_name)
				getglobal("NautFramePlat"..index.."ArrivalDepature"):SetText(YELLOW..depOrArr..":")
				getglobal("NautFramePlat"..index.."Time"):SetText(colour..formatted_time)
			end
		end

		if NauticusFu then
			NauticusFu:UpdateDisplay()
		end
	end

	if self.iconTooltip then
		self.tablet:Refresh(self.iconTooltip)
	end

end

function Nauticus:CheckTriggers_OnUpdate(elapse)

	if self.currentZoneTransports == nil or self.currentZoneTransports.virtual then return; end

	-- if we've already triggered a set of coords, don't check again for another 30 secs
	self.lastcheck_timeout = self.lastcheck_timeout + elapse
	if 30.0 > self.lastcheck_timeout then return; end

	local c, z, x, y = NautAstrolabe:GetCurrentPlayerPosition()
	if not x then return; end
	x, y = NautAstrolabe:TranslateWorldMapPosition(c, z, x, y, 0, 0)
	if not x then return; end

	-- have we moved by at least 17 game yards since the last check? this equates to >~300% movement speed
	if 17.0 < NautAstrolabe:ComputeDistance(0, 0, x, y, 0, 0, oldx, oldy) and
		not IsFlying() then

		--check X/Y coords against all triggers for all transports in current zone
		for transit, i in pairs(self.currentZoneTransports) do
			for i, index in pairs(triggers[transit]) do
				-- within 20 game yards of trigger coords?
				if 20.0 > NautAstrolabe:ComputeDistance(0, 0, x, y,
					0, 0, transitData[transit].x[index], transitData[transit].y[index]) then

					self:SetKnownTime(transit, index, x, y)
					return
				end
			end
		end
	end

	oldx, oldy = x, y

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
			local old_time = self:GetKnownCycle(transit)
			local oldCycle = math.fmod(old_time, rtts[transit])
			local diff = oldCycle-sum_time
			self:DebugMessage(transit..", cycle time: "..sum_time
				.." ; old: "..format("%0.3f", oldCycle)
				.." ; diff: "..format("%0.3f", diff)
				.." ; drift: "..format("%0.6f", diff / ((old_time-sum_time) / rtts[transit])))
		else
			self:DebugMessage(transit..", cycle time: "..sum_time)
		end
	end

	if self.db.account.freeze then return; end

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
		return transitData.x[index], transitData.y[index], transitData.dir[index], false -- -1
	else
		local fraction = (cycle - transitData.offset[index-1]) / transitData.dt[index]

		return transitData.x[index-1] + transitData.dx[index] * fraction,
			transitData.y[index-1] + transitData.dy[index] * fraction,
			transitData.dir[index-1] + transitData.d_dir[index] * fraction,
			zonings[transit][index] == true
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

	--self.dataChannel = self.db.profile.dataChannel
	self.debug = self.db.account.debug

	if self.db.account.newerVersion then
		self:DebugMessage("new version: "..self.db.account.newerVersion.." vs our "..self.versionNum)

		if self.db.account.newerVersion > self.versionNum then
			DEFAULT_CHAT_FRAME:AddMessage(YELLOW.."Nauticus|r - "..WHITE..
				L["There is a new version of Nauticus available! Please visit http://drool.me.uk/naut."])

			-- major update released and running old version longer than 10 days?
			if math.floor(self.db.account.newerVersion/10) > math.floor(self.versionNum/10) and
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

		self:DebugMessage(format("boot drift: %0.3f", drift))

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
	local j, oldX, oldY, oldOffset, oldDir, transport, transit, transit_data, liveData

	self.transitData = {}
	self.liveData = {}
	self.zonings = {}
	triggers = {}
	transitData = self.transitData
	liveData = self.liveData
	zonings = self.zonings

	for t = 1, #(transports), 1 do
		oldX, oldY, oldOffset, oldDir = 0, 0, 0, 0

		transport = transports[t]
		transit = transport.label
		transitData[transit] = { ['x'] = {}, ['y'] = {}, ['offset'] = {},
			['dx'] = {}, ['dy'] = {}, ['dt'] = {}, ['dir'] = {}, ['d_dir'] = {}, }

		zonings[transit] = {}
		triggers[transit] = {}
		transit_data = transitData[transit]

		for i = 1, #(packedData[transit]) do
			j = 0; args[6] = nil
			-- search for seperators in the string and return the separated data
			for value in string.gmatch(packedData[transit][i], "[^:]+") do
				j = j + 1; args[j] = value
			end

			transit_data.x[i] = args[1]+oldX
			transit_data.y[i] = args[2]+oldY
			transit_data.offset[i] = args[3]+oldOffset
			transit_data.dx[i] = tonumber(args[1])
			transit_data.dy[i] = tonumber(args[2])
			transit_data.dt[i] = tonumber(args[3])
			transit_data.dir[i] = args[5]+oldDir
			transit_data.d_dir[i] = tonumber(args[5])

			if args[6] then
				local comment = strsub(args[6], 1, 4)
				if comment == "plat" then
					local index = tonumber(strsub(args[6], 5))
					platforms[transit][index].index = i
				elseif comment == "trig" then
					local index = tonumber(strsub(args[6], 5))
					triggers[transit][index] = i
				elseif comment == "zone" then
					zonings[transit][i] = true
				end
			end

			oldX, oldY, oldOffset, oldDir =
				transit_data.x[i],
				transit_data.y[i],
				transit_data.offset[i],
				transit_data.dir[i]
		end

		transit_data.offset[#(packedData[transit])] = rtts[transit]

		liveData[transit] = { cycle = 0, index = 1, }

		transport.minimap_icon, transport.worldmap_icon =
			getglobal("Naut_MiniMapIconButton"..t),
			getglobal("Naut_WorldMapIconButton"..t)

		transport.minimap_texture, transport.worldmap_texture =
			getglobal("Naut_MiniMapIconButton"..t.."Texture"),
			getglobal("Naut_WorldMapIconButton"..t.."Texture")

		transport.texture_name = ARTWORKPATH.."MapIcon_"..transport.ship_type
	end

	self.packedData = nil -- free some memory (too many indexes to recycle)

end

function Nauticus:PLAYER_ENTERING_WORLD()
	self:UpdateDistribution(10)

	if GetRealZoneText() ~= "" then
		self:UnregisterEvent("PLAYER_ENTERING_WORLD")
		self.currentZoneTransports = self.transitZones[GetRealZoneText()]
		self:DebugMessage("enter: "..GetRealZoneText())
	end
end

function Nauticus:ZONE_CHANGED_NEW_AREA(loopback)
	if not loopback and self.currentZone == GetRealZoneText() then
		self:ScheduleEvent(self.ZONE_CHANGED_NEW_AREA, 1, self, true)
	else
		self.currentZone = GetRealZoneText()
		self.currentZoneTransports = self.transitZones[self.currentZone]
		self:DebugMessage("zoned: "..self.currentZone)

		-- show GUI when zone change contains a transport
		if self.currentZoneTransports and self:IsZoneGUI() and
			not self.currentZoneTransports.virtual then

			self.db.char.showLowerGUI = true
			self.db.char.showGUI = true
			self:UpdateUI()
		end
	end
end
	
function Nauticus:PARTY_MEMBERS_CHANGED()
	self:DebugMessage("update distro: party")
	self:UpdateDistribution(10)
end

function Nauticus:PLAYER_GUILD_UPDATE()
	self:DebugMessage("update distro: guild")
	self:UpdateDistribution(10)
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

local lastDebug = GetTime()

function Nauticus:DebugMessage(msg)
	if self.debug then
		local now = GetTime()
		ChatFrame4:AddMessage(format("[Naut] ["..YELLOW.."%0.3f|r]: %s", now-lastDebug, msg))
		lastDebug = now
	end
end

local texCoordCache = { LLx = {}, LLy = {}, URx = {}, URy = {}, }

function GetTexCoord(degrees)
	degrees = math.floor(degrees+.5)
	while degrees < 0 do degrees = degrees + 360; end
	while degrees > 360 do degrees = degrees - 360; end

	local LLx, LLy, URx, URy =
		texCoordCache.LLx[degrees], texCoordCache.LLy[degrees],
		texCoordCache.URx[degrees], texCoordCache.URy[degrees]

	return URy, LLx, LLx, LLy, URx, URy, LLy, URx
end

-- build cache of all angles
do
	local cosa, sina, A, B, C, D, E, F, det, BFsubCE, AFaddCD

	for i = 0, 360 do
		cosa, sina = cos(i), sin(i)

		-- translate texture to centre, rotate it, put it back
		-- T(x1,y1).R(angle).T(-x1,-y1)
		A, B, C, D, E, F =
			cosa,	-sina,	0.5*(1-cosa)+0.5*sina,
			sina,	cosa,	0.5*(1-cosa)-0.5*sina

		det = A*E - B*D
		BFsubCE = B*F - C*E
		AFaddCD = -A*F + C*D

		texCoordCache.LLx[i], texCoordCache.LLy[i],
		texCoordCache.URx[i], texCoordCache.URy[i] =
			(-B + BFsubCE) / det, (A + AFaddCD) / det,
			(E + BFsubCE) / det, (-D + AFaddCD) / det
	end
end

-- build cache of formatted times
do
	formattedTimeCache = {}
	Nauticus.formattedTimeCache = formattedTimeCache

	for i = 0, 59 do
		formattedTimeCache[i] = format("%ds", i)
	end

	for i = 60, MAX_FORMATTED_TIME do
		formattedTimeCache[i] = format("%dm %02ds", i/60, math.fmod(i, 60))
	end
end
