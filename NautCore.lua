
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
local ARTWORK_PATH = "Interface\\AddOns\\Nauticus\\Artwork\\"
local ARTWORK_ZONING = ARTWORK_PATH.."MapIcon_Zoning"
local ARTWORK_DEPARTING = ARTWORK_PATH.."Departing"
local ARTWORK_IN_TRANSIT = ARTWORK_PATH.."Transit"
local ARTWORK_DOCKED = ARTWORK_PATH.."Docked"
local MAX_FORMATTED_TIME = 444 -- the longest route minus 60
local ICON_DEFAULT_SIZE = 18

Nauticus = LibStub("AceAddon-3.0"):NewAddon("Nauticus", "AceEvent-3.0", "AceTimer-3.0")
local Nauticus = Nauticus
local L = LibStub("AceLocale-3.0"):GetLocale("Nauticus")
local Astrolabe = DongleStub("Astrolabe-0.4")
local ldbicon = LibStub("LibDBIcon-1.0")

-- object variables
Nauticus.versionNum = 303 -- for comparison
Nauticus.activeTransit = -1
Nauticus.lowestNameTime = "--"
Nauticus.tempText = ""
Nauticus.tempTextCount = 0

Nauticus.requestList = {}

Nauticus.debug = false

-- local variables
local oldx, oldy = 0, 0 -- old player coords
local lastcheck_timeout = 30

local alarmOffset
local alarmSet = false
local alarmDinged = false
local alarmCountdown = 0

local rtts, platforms, triggers, transports, transitData, zonings
local GetTexCoord, formattedTimeCache
local filterChat, autoSelect, showMiniIcons, worldIconSize, factionOnlyIcons

local defaults = {
	profile = {
		factionSpecific = true,
		zoneSpecific = false,
		filterChat = true,
		alarmOffset = 20,
		miniIconSize = 1,
		worldIconSize = 1.25,
		showMiniIcons = true,
		showWorldIcons = true,
		factionOnlyIcons = false,
		minimap = {
			hide = true,
		},
	},
	global = {
		knownCycles = {},
		debug = false,
	},
	char = {
		activeTransit = -1,
		autoSelect = true,
	},
}

local _options = {
	showminimapicon = {
		type = 'toggle',
		name = L["Show on Mini-Map"],
		desc = L["Toggle display of icons on the Mini-Map."],
		order = 600,
		get = function()
			return Nauticus.db.profile.showMiniIcons
		end,
		set = function(info, val)
			Nauticus.db.profile.showMiniIcons = val
			showMiniIcons = val
			if not val then
				for t = 1, #(transports), 1 do
					Astrolabe:RemoveIconFromMinimap(transports[t].minimap_icon)
				end
			end
		end,
	},
	showworldmapicon = {
		type = 'toggle',
		name = L["Show on World Map"],
		desc = L["Toggle display of icons on the World Map."],
		order = 650,
		get = function()
			return Nauticus.db.profile.showWorldIcons
		end,
		set = function(info, val)
			Nauticus.db.profile.showWorldIcons = val
			showWorldIcons = val
			if not val then
				for t = 1, #(transports), 1 do
					transports[t].worldmap_icon:Hide()
				end
			end
		end,
	},
	iconminisize = {
		type = 'range',
		name = L["Mini-Map icon size"],
		desc = L["Change the size of the Mini-Map icons."],
		order = 400,
		get = function()
			return Nauticus.db.profile.miniIconSize
		end,
		set = function(info, val)
			for t = 1, #(transports), 1 do
				transports[t].minimap_icon:SetHeight(val * ICON_DEFAULT_SIZE)
				transports[t].minimap_icon:SetWidth(val * ICON_DEFAULT_SIZE)
			end
			Nauticus.db.profile.miniIconSize = val
		end,
		isPercent = true,
		min = .5, max = 2, step = .01,
	},
	iconworldsize = {
		type = 'range',
		name = L["World Map icon size"],
		desc = L["Change the size of the World Map icons."],
		order = 500,
		get = function()
			return Nauticus.db.profile.worldIconSize
		end,
		set = function(info, val)
			for t = 1, #(transports), 1 do
				transports[t].worldmap_icon:SetHeight(val * ICON_DEFAULT_SIZE)
				transports[t].worldmap_icon:SetWidth(val * ICON_DEFAULT_SIZE)
			end
			Nauticus.db.profile.worldIconSize = val
		end,
		isPercent = true,
		min = .5, max = 2, step = .01,
	},
	factiononly = {
		type = 'toggle',
		name = L["Faction only"],
		desc = L["Hide transports of opposite faction from the map, showing only neutral and those of your faction."],
		order = 675,
		get = function()
			return Nauticus.db.profile.factionOnlyIcons
		end,
		set = function(info, val)
			Nauticus.db.profile.factionOnlyIcons = val
			factionOnlyIcons = val
		end,
	},
	autoselect = {
		type = 'toggle',
		name = L["Auto select transport"],
		desc = L["Automatically select nearest transport when standing at platform."],
		order = 150,
		get = function()
			return Nauticus.db.char.autoSelect
		end,
		set = function(info, val)
			Nauticus.db.char.autoSelect = val
			autoSelect = val
		end,
	},
	filter = {
		type = 'toggle',
		name = L["Crew chat filter"],
		desc = L["Toggle the filter for removing ship crew talk and Zeppelin Master yells from the chat window."],
		order = 200,
		get = function()
			return Nauticus.db.profile.filterChat
		end,
		set = function(info, val)
			Nauticus.db.profile.filterChat = val
			filterChat = val
		end,
	},
	alarm = {
		type = 'range',
		name = L["Alarm delay"],
		desc = L["Change the alarm delay (in seconds)."],
		order = 300,
		get = function()
			return Nauticus.db.profile.alarmOffset
		end,
		set = function(info, val)
			alarmOffset = val
			Nauticus.db.profile.alarmOffset = val
		end,
		min = 0, max = 90, step = 5,
	},
	minibutton = {
		type = 'toggle',
		name = L["Mini-Map button"],
		desc = L["Toggle the Mini-Map button."],
		order = 100,
		get = function()
			return not Nauticus.db.profile.minimap.hide
		end,
		set = function(info, val)
			Nauticus.db.profile.minimap.hide = not val
			if val then
				ldbicon:Show("Nauticus")
			else
				ldbicon:Hide("Nauticus")
			end
		end,
	},
}
local options = { type = "group", args = {
	GUI = {
		type = 'group',
		name = "Nauticus",
		args = {
			nautdesc = {
				type = 'description',
				name = L["Tracks the precise arrival & departure schedules of boats and Zeppelins around Azeroth and displays them on the Mini-Map and World Map in real-time."].."\n",
				order = 1,
			},
			header1 = {
				type = 'header',
				name = L["General Settings"],
				order = 99,
			},
			minibutton = _options.minibutton,
			autoselect = _options.autoselect,
			filter = _options.filter,
			alarm = _options.alarm,
			header2 = {
				type = 'header',
				name = L["Map Icons"],
				order = 398,
			},
			iconsdesc = {
				type = 'description',
				name = L["Options for displaying transports as icons on the Mini-Map and World Map."].."\n",
				order = 399,
			},
			iconminisize = _options.iconminisize,
			iconworldsize = _options.iconworldsize,
			showminimapicon = _options.showminimapicon,
			showworldmapicon = _options.showworldmapicon,
			factiononly = _options.factiononly,
		},
	},
} }
local optionsSlash = { type = 'group', name = "Nauticus", args = {
	[ L["icons"] ] = {
		type = 'group',
		name = L["Map Icons"],
		desc = L["Options for displaying transports as icons on the Mini-Map and World Map."],
		order = 399,
		args = {
			[ L["minishow"] ] = _options.showminimapicon,
			[ L["worldshow"] ] = _options.showworldmapicon,
			[ L["minisize"] ] = _options.iconminisize,
			[ L["worldsize"] ] = _options.iconworldsize,
			[ L["faction"] ] = _options.factiononly,
		},
	},
	[ L["minibutton"] ] = _options.minibutton,
	[ L["autoselect"] ] = _options.autoselect,
	[ L["filter"] ] = _options.filter,
	[ L["alarm"] ] = _options.alarm,
} }
Nauticus.optionsSlash = optionsSlash


local FILTER_NPC = {
-- org2uc:
[ L["Frezza"] ] = true,
[ L["Zapetta"] ] = true,
[ L["Sky-Captain Cloudkicker"] ] = true,
[ L["Chief Officer Coppernut"] ] = true,
[ L["Navigator Fairweather"] ] = true,
-- uc2gg:
[ L["Hin Denburg"] ] = true,
[ L["Navigator Hatch"] ] = true,
[ L["Chief Officer Hammerflange"] ] = true,
[ L["Sky-Captain Cableclamp"] ] = true,
-- org2gg:
[ L["Snurk Bucksquick"] ] = true,
-- mh2ther:
[ L["Captain \"Stash\" Torgoley"] ] = true,
[ L["First Mate Kowalski"] ] = true,
[ L["Navigator Mehran"] ] = true,
-- uc2ven:
[ L["Meefi Farthrottle"] ] = true,
[ L["Drenk Spannerspark"] ] = true,
-- war2org:
[ L["Greeb Ramrocket"] ] = true,
[ L["Nargo Screwbore"] ] = true,
-- wg2wg:
[ L["Harrowmeiser"] ] = true,
}

local function ChatFilter_DataChannel(msg)
	if strlower(arg9) == strlower(DEFAULT_CHANNEL) and not Nauticus.debug then
		return true -- silence
	end
end

ChatFrame_AddMessageEventFilter("CHAT_MSG_CHANNEL", ChatFilter_DataChannel)

local function ChatFilter_CrewChat(msg)
	if not filterChat then
		return false
	elseif FILTER_NPC[arg2] then
		--Nauticus:DebugMessage(arg2.." yells: "..arg1)
		return true -- silence
	end
end

ChatFrame_AddMessageEventFilter("CHAT_MSG_MONSTER_SAY", ChatFilter_CrewChat)
ChatFrame_AddMessageEventFilter("CHAT_MSG_MONSTER_YELL", ChatFilter_CrewChat)
ChatFrame_AddMessageEventFilter("CHAT_MSG_MONSTER_EMOTE", ChatFilter_CrewChat)

function Nauticus:OnInitialize()
	self.db = LibStub("AceDB-3.0"):New("Nauticus3DB", defaults)
	LibStub("AceConfigRegistry-3.0"):RegisterOptionsTable("Nauticus", options)
	LibStub("AceConfig-3.0"):RegisterOptionsTable("NauticusSlashCommand", optionsSlash, { "nauticus", "naut" })
	options.args.NauticusSlashCommand = optionsSlash
	self.optionsFrame = LibStub("AceConfigDialog-3.0"):AddToBlizOptions("Nauticus", nil, nil, "GUI")
	ldbicon:Register("Nauticus", self.dataobj, self.db.profile.minimap)

	rtts, platforms, transports = self.rtts, self.platforms, self.transports

	local frame = CreateFrame("Frame", "Naut_TransportSelectFrame", nil, "UIDropDownMenuTemplate")
	UIDropDownMenu_Initialize(frame, function(frame, level) Nauticus:TransportSelectInitialise(frame, level); end, "MENU")

	self:InitialiseConfig()
end

function Nauticus:OnEnable()
	self:RegisterEvent("CHAT_MSG_CHANNEL")
	self:RegisterEvent("ZONE_CHANGED_NEW_AREA")
	self:RegisterEvent("CHAT_MSG_CHANNEL_NOTICE")
	self:RegisterEvent("PLAYER_ENTERING_WORLD")

	local c, z, x, y = Astrolabe:GetCurrentPlayerPosition()
	if x then oldx, oldy = Astrolabe:TranslateWorldMapPosition(c, z, x, y, 0, 0); end

	self:ScheduleRepeatingTimer("DrawMapIcons", 0.2) -- every 1/5th of a second
	self:ScheduleRepeatingTimer("Clock_OnUpdate", 1) -- every second (clock tick)
	self:ScheduleRepeatingTimer("CheckTriggers_OnUpdate", 0.8) -- every 4/5th of a second

	self:RegisterEvent("WORLD_MAP_UPDATE")

	self:UpdateChannel(10) -- wait 10 seconds before sending to any comms channels
	self.currentZone = GetRealZoneText()
	self.currentZoneTransports = self.transitZones[self.currentZone]
	--self:DebugMessage("enabled: "..self.currentZone)
	self:TransportSelectSetNone()
end

function Nauticus:OnDisable()
	for t = 1, #(transports), 1 do
		Astrolabe:RemoveIconFromMinimap(transports[t].minimap_icon)
		transports[t].worldmap_icon:Hide()
	end
end

local isDrawing

function Nauticus:DrawMapIcons()
	if isDrawing then return; end; isDrawing = true

	local transport, transit, liveData, cycle, platform, offsets, currentX, currentY, angle,
		isZoning, isZoneInteresting, isFactionInteresting, buttonMini, buttonWorld

	local isWorldMapVisible = Astrolabe.WorldMapVisible

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

			if showMiniIcons or showWorldIcons then
				isZoneInteresting = self.currentZoneTransports ~= nil and self.currentZoneTransports[transit]
				isFactionInteresting = not factionOnlyIcons or transport.faction == UnitFactionGroup("player") or transport.faction == "Neutral"
				buttonMini, buttonWorld = transport.minimap_icon, transport.worldmap_icon

				if isZoneInteresting or isWorldMapVisible then
					currentX, currentY, angle, isZoning = self:CalcTripPosition(transit, cycle, platform)

					if currentX and currentY then
						if isWorldMapVisible and showWorldIcons and isFactionInteresting then
							if isZoning ~= transport.status then
								transport.worldmap_texture:SetTexture(isZoning and ARTWORK_ZONING or transport.texture_name)
								transport.status = isZoning
							end
							Astrolabe:PlaceIconOnWorldMap(WorldMapButton, buttonWorld, 0, 0, currentX, currentY)
							transport.worldmap_texture:SetTexCoord(GetTexCoord(angle))
						elseif buttonWorld:IsVisible() then
							Astrolabe:RemoveIconFromMinimap(buttonWorld)
						end

						if isZoneInteresting and showMiniIcons and isFactionInteresting then
							Astrolabe:PlaceIconOnMinimap(buttonMini, 0, 0, currentX, currentY)
							transport.minimap_texture:SetTexCoord(GetTexCoord(angle-math.deg(MiniMapCompassRing:GetFacing())))
							buttonMini:SetAlpha(Astrolabe:IsIconOnEdge(buttonMini) and 0.6 or 0.9)
						elseif buttonMini:IsVisible() then
							Astrolabe:RemoveIconFromMinimap(buttonMini)
						end
					end
				elseif buttonMini:IsVisible() then
					buttonMini:Hide()
				end
			end
		end
	end

	isDrawing = false
end

function Nauticus:Clock_OnUpdate()

	local transit, liveData, cycle, platform

	if alarmDinged then
		alarmCountdown = alarmCountdown - 1

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
		local plat_time, formatted_time, depOrArr, colour

		for index, data in pairs(platforms[transit]) do
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
					self.icon = ARTWORK_DOCKED
				else
					colour = RED
					self.icon = ARTWORK_DEPARTING
				end

				depOrArr = L["Departure"]
				formatted_time = formattedTimeCache[floor(plat_time)]

				lowestTime = -500
				self.lowestNameTime = data.ebv.." "..colour..formatted_time

			else
				plat_time = self:CalcTripCycleTimeByIndex(transit, data.index-1) - cycle

				if plat_time < 0 then
					plat_time = plat_time + rtts[transit]
				end

				colour = GREEN
				depOrArr = L["Arrival"]
				formatted_time = formattedTimeCache[floor(plat_time)]

				if plat_time < lowestTime then
					lowestTime = plat_time
					self.lowestNameTime = data.ebv.." "..GREEN..formatted_time
					self.icon = ARTWORK_IN_TRANSIT
				end
			end
		end
	end

	if self.tempTextCount > 0 then
		self.tempTextCount = self.tempTextCount - 1
	end

	self:UpdateDisplay()

end

local c, z, x, y, dist, post, last_trig, keep_time

function Nauticus:CheckTriggers_OnUpdate()
	-- remember if we've already triggered a set of coords within the last 30 secs
	if last_trig and GetTime() > 30.0 + last_trig then last_trig = nil; end

	if not self.currentZoneTransports or self.currentZoneTransports.virtual then return; end

	c, z, x, y = Astrolabe:GetCurrentPlayerPosition()
	if not x then return; end
	x, y = Astrolabe:TranslateWorldMapPosition(c, z, x, y, 0, 0)
	if not x then return; end

	dist = Astrolabe:ComputeDistance(0, 0, x, y, 0, 0, oldx, oldy)
	oldx, oldy = x, y

	-- have we moved by at least 6.16 game yards since the last check? this equates to >~110% movement speed
	if 6.16 < dist then
		if IsFlying() or IsSwimming() or UnitOnTaxi("player") then return; end

		--check X/Y coords against all triggers for all transports in current zone
		for transit in pairs(self.currentZoneTransports) do
			for i, index in pairs(triggers[transit]) do
				post = 0 > index; if post then index = -index; end

				-- within 20 game yards of trigger coords?
				if 20.0 > Astrolabe:ComputeDistance(0, 0, x, y,
					0, 0, transitData[transit].x[index], transitData[transit].y[index]) then

					if post then
						if last_trig and keep_time then
							self:SetKnownCycle(transit, GetTime() - last_trig + keep_time, 0, 0)
							self.requestList[transit] = true
							self:DoRequest(10 + math.random() * 10)
							keep_time = nil
							last_trig = GetTime()
						end
					else
						if not last_trig then
							self:SetKnownTime(transit, index, x, y, 17.0 < dist)
							last_trig = GetTime()
						end
					end

					return
				end
			end
		end

	elseif autoSelect and 0 == dist and not IsSwimming() then
		--check X/Y coords against all platforms in current zone
		for transit in pairs(self.currentZoneTransports) do
			if transit ~= self.activeTransit then
				for i, data in pairs(platforms[transit]) do
					-- within 25 game yards of platform coords?
					if 25.0 > Astrolabe:ComputeDistance(0, 0, x, y,
						0, 0, transitData[transit].x[data.index], transitData[transit].y[data.index]) then

						self:DebugMessage("near: "..transit)
						self:SetTransport(self.lookupIndex[transit])
						return
					end
				end
			end
		end
	end
end

function Nauticus:SetKnownTime(transit, index, x, y, set)
	local transitData = transitData[transit]
	local ix, iy = transitData.x[index-1], transitData.y[index-1]
	local extrapolate = -transitData.dt[index] + transitData.dt[index] *
		(Astrolabe:ComputeDistance(0, 0, x, y, 0, 0, ix, iy) /
		Astrolabe:ComputeDistance(0, 0, transitData.x[index], transitData.y[index], 0, 0, ix, iy) )

	--self:DebugMessage("extrapolate: "..extrapolate)

	local sum_time = self:CalcTripCycleTimeByIndex(transit, index) + extrapolate

	--@debug@
	if self.debug then
		if self:HasKnownCycle(transit) then
			local old_time = self:GetKnownCycle(transit)
			local oldCycle = math.fmod(old_time, rtts[transit])
			local diff = oldCycle-sum_time
			local drift = format("%0.6f", diff / ((old_time-sum_time) / rtts[transit]))
			self.db.global.knownCycles[transit].drift = drift
			self:DebugMessage(transit..", cycle time: "..sum_time
				.." ; old: "..format("%0.3f", oldCycle)
				.." ; diff: "..format("%0.3f", diff)
				.." ; drift: "..drift)
		else
			self:DebugMessage(transit..", cycle time: "..sum_time)
		end
	end
	--@end-debug@

	if set then
		self:SetKnownCycle(transit, sum_time, 0, 0)
		self.requestList[transit] = true
		self:DoRequest(10 + math.random() * 10)
	else
		keep_time = sum_time
	end
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

-- initialise saved variables and data
function Nauticus:InitialiseConfig()

	--self:DebugMessage("init config...")
	self.debug = self.db.global.debug

	if NauticusDB and NauticusDB.account and not self.db.global.uptime then
		self.db.global.uptime = NauticusDB.account.uptime
		self.db.global.timestamp = NauticusDB.account.timestamp
		self.db.global.knownCycles = NauticusDB.account.knownCycles
		NauticusDB = nil
	end

	if self.db.global.newerVersion then
		--self:DebugMessage("new version: "..self.db.global.newerVersion.." vs our "..self.versionNum)

		if self.db.global.newerVersion > self.versionNum then
			DEFAULT_CHAT_FRAME:AddMessage(YELLOW.."Nauticus|r - "..WHITE..
				L["There is a new version of Nauticus available! Please visit http://drool.me.uk/naut."])

			-- major update released and running old version longer than 10 days?
			if math.floor(self.db.global.newerVersion/10) > math.floor(self.versionNum/10) and
				864000.0 < (time() - self.db.global.newerVerAge) then

				self.comm_disable = true
				DEFAULT_CHAT_FRAME:AddMessage(YELLOW.."Nauticus|r - "..RED..
					L["You have been using an old version of Nauticus for more than 10 days, outbound communications will now be disabled."])
			end

		else
			self.db.global.newerVersion = nil
			self.db.global.newerVerAge = nil
			DEFAULT_CHAT_FRAME:AddMessage(YELLOW.."Nauticus|r - "..L["Thank you for upgrading."])
		end
	end

	alarmOffset = self.db.profile.alarmOffset
	autoSelect = self.db.char.autoSelect
	filterChat = self.db.profile.filterChat

	self.activeTransit = self.db.char.activeTransit
	if self.activeTransit ~= -1 and not self.lookupIndex[self.activeTransit] then
		self.activeTransit = -1
		self.db.char.activeTransit = -1
	end

	showMiniIcons = self.db.profile.showMiniIcons
	showWorldIcons = self.db.profile.showWorldIcons
	factionOnlyIcons = self.db.profile.factionOnlyIcons

	local now = GetTime()
	local the_time = time()

	if self.db.global.uptime then
		-- calculate potential drift time in ms between sessions
		local drift = (the_time - now) - (self.db.global.timestamp - self.db.global.uptime)
		self:DebugMessage(format("boot drift: %0.3f", drift))

		-- if more than 3 mins drift, that means reboot occured. we need to adjust ms timers
		if math.abs(drift) > 180 then
			local since
			-- adjust all available transport times by drift
			for transport, data in pairs(self.db.global.knownCycles) do
				since = data.since
				if since then
					since = since - drift
					if 0 > now-since then
						self.db.global.knownCycles[transport] = nil
					else
						data.since = since
						data.boots = data.boots + 1
					end
				end
			end

			self:DebugMessage("reboot must have occured")
		end
	end

	-- record uptime and 'when' (relative to local system clock) this was made
	self.db.global.uptime = now
	self.db.global.timestamp = the_time

	-- unpack transport data
	local packedData = self.packedData
	local args = {}
	local j, oldX, oldY, oldOffset, oldDir, transport, transit, transit_data, liveData,
		texture_name, frame, texture

	local miniIconSize = self.db.profile.miniIconSize * ICON_DEFAULT_SIZE
	local worldIconSize = self.db.profile.worldIconSize * ICON_DEFAULT_SIZE

	self.transitData = {}
	self.liveData = {}
	self.zonings = {}
	triggers = {}
	transitData = self.transitData
	liveData = self.liveData
	zonings = self.zonings

	CreateFrame("Frame", "NauticusMiniMapOverlay", Minimap)

	local worldMapOverlay = CreateFrame("Frame", "NauticusWorldMapOverlay", WorldMapButton)
	tinsert(WorldMapDisplayFrames, worldMapOverlay)

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
					local index = tonumber(strsub(args[6], 5)) == 0 and -i or i
					tinsert(triggers[transit], index)
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

		texture_name = ARTWORK_PATH.."MapIcon_"..transport.ship_type
		transport.texture_name = texture_name

		frame = CreateFrame("Button", "NauticusMiniIcon"..t, NauticusMiniMapOverlay)
		transport.minimap_icon = frame
		frame:SetHeight(miniIconSize)
		frame:SetWidth(miniIconSize)
		texture = frame:CreateTexture(nil, "ARTWORK")
		frame.texture = texture
		transport.minimap_texture = texture
		texture:SetTexture(texture_name)
		texture:SetAllPoints(frame)
		frame:SetScript("OnEnter", function() Nauticus:MapIconButtonMouseEnter(this) end)
		frame:SetScript("OnLeave", function() Nauticus:MapIconButtonMouseExit(this) end)
		frame:SetID(t)

		frame = CreateFrame("Button", nil, worldMapOverlay)
		transport.worldmap_icon = frame
		frame:SetHeight(worldIconSize)
		frame:SetWidth(worldIconSize)
		texture = frame:CreateTexture(nil, "ARTWORK")
		frame.texture = texture
		transport.worldmap_texture = texture
		texture:SetTexture(texture_name)
		texture:SetAllPoints(frame)
		frame:SetScript("OnEnter", function() Nauticus:MapIconButtonMouseEnter(this) end)
		frame:SetScript("OnLeave", function() Nauticus:MapIconButtonMouseExit(this) end)
		frame:SetID(t)
	end

	self.packedData = nil -- free some memory (too many indexes to recycle)

end

function Nauticus:PLAYER_ENTERING_WORLD()
	self:UpdateChannel(10)

	if GetRealZoneText() ~= "" then
		self:UnregisterEvent("PLAYER_ENTERING_WORLD")
		self.currentZoneTransports = self.transitZones[GetRealZoneText()]
		--self:DebugMessage("enter: "..GetRealZoneText())
	end
end

local zoneChanged

function Nauticus:ZONE_CHANGED_NEW_AREA(loopback)
	if zoneChanged then self:CancelTimer(zoneChanged, true); zoneChanged = nil; end

	if not loopback and self.currentZone == GetRealZoneText() then
		zoneChanged = self:ScheduleTimer("ZONE_CHANGED_NEW_AREA", 1, true)
		return
		--self:DebugMessage("zoned: "..self.currentZone)
	end

	self.currentZone = GetRealZoneText()
	self.currentZoneTransports = self.transitZones[self.currentZone]
	if self.db.profile.zoneSpecific then self:RefreshMenu(); end
end

function Nauticus:WORLD_MAP_UPDATE()
	self:DrawMapIcons()
end

function Nauticus:ToggleAlarm()
	alarmSet = not alarmSet
	if not alarmSet then alarmDinged = false end
	DEFAULT_CHAT_FRAME:AddMessage(YELLOW.."Nauticus|r - "..WHITE..
		L["Alarm is now: "]..(alarmSet and RED..L["ON"] or GREEN..L["OFF"]).."|r")
	PlaySound("AuctionWindowOpen")
end

function Nauticus:IsAlarmSet()
	return alarmSet or alarmDinged
end

function Nauticus:GetKnownCycle(transport)
	local knownCycle = self.db.global.knownCycles[transport]
	if knownCycle and knownCycle.since then
		return GetTime()-knownCycle.since, knownCycle.boots, knownCycle.swaps
	end
end

function Nauticus:SetKnownCycle(transport, since, boots, swaps)
	if self.db.global.freeze then return; end
	local knownCycle = self.db.global.knownCycles[transport]
	if not knownCycle then
		knownCycle = {}
		self.db.global.knownCycles[transport] = knownCycle
	end
	knownCycle.since, knownCycle.boots, knownCycle.swaps = GetTime()-since, boots, swaps
	self.db.global.uptime = GetTime()
	self.db.global.timestamp = time()
end

function Nauticus:HasKnownCycle(transport)
	local knownCycle = self.db.global.knownCycles[transport]
	if transport ~= -1 then
		return knownCycle ~= nil and knownCycle.since ~= nil
	end
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
