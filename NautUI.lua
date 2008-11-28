
-- declare colour codes for console messages
local RED     = "|cffff0000"
local GREEN   = "|cff00ff00"
local BLUE    = "|cff0000ff"
local MAGENTA = "|cffff00ff"
local YELLOW  = "|cffffff00"
local CYAN    = "|cff00ffff"
local WHITE   = "|cffffffff"
local ORANGE  = "|cffffba00"
local GREY    = "|cffbababa"

-- constants
local ARTWORK_PATH = "Interface\\AddOns\\Nauticus\\Artwork\\"
local ARTWORK_LOGO = ARTWORK_PATH.."NauticusLogo"
local ARTWORK_ALARM = "Interface\\Icons\\INV_Misc_PocketWatch_02"

local Nauticus = Nauticus

local ldb = LibStub:GetLibrary("LibDataBroker-1.1")
local dataobj = ldb:NewDataObject("Nauticus", { type = "data source", text = "Nauticus", icon = ARTWORK_LOGO } )

local L = AceLibrary("AceLocale-2.2"):new("Nauticus")

local tablet = LibStub("LibSimpleFrame-Mod-1.0"):New("Nauticus", {
	position = { point = "CENTER", x = 0, y = 0 },
	lock = true,
	scale = 1,
	strata = "TOOLTIP",
	fade = 1,
	opacity = 1,
	width = 150,
	border = { 1, 1, 1, 1 },
	background = { 0, 0, 0, 1 },
	min_height = 20,
} )
tablet:SetFrameLevel(10)

local dewdrop = AceLibrary("Dewdrop-2.0")

local NautAstrolabe = DongleStub("Astrolabe-0.4")

local rtts, platforms, transports = Nauticus.rtts, Nauticus.platforms, Nauticus.transports
local iconTooltip, barTooltipFrame


function Nauticus:IsFactionSpecific()
    return self.db.profile.factionSpecific
end

function Nauticus:ToggleFaction()
    self.db.profile.factionSpecific = not self.db.profile.factionSpecific
end

function Nauticus:IsZoneSpecific()
    return self.db.profile.zoneSpecific
end

function Nauticus:ToggleZone()
    self.db.profile.zoneSpecific = not self.db.profile.zoneSpecific
end

function Nauticus:GetButtonIconText()
	return
		self:IsAlarmSet() and ARTWORK_ALARM or self.icon,
		self.tempTextCount > 0 and self.tempText or self.lowestNameTime
end

function Nauticus:IsRouteShown(i)
	local addtrans = false

	if self:IsFactionSpecific() then
		if transports[i].faction == UnitFactionGroup("player") or
			transports[i].faction == "Neutral" then

			addtrans = true
		end
	else
		addtrans = true
	end

	if addtrans and self:IsZoneSpecific() then
		if not string.find(string.lower(transports[i].name),
			string.lower(GetRealZoneText())) then

			addtrans = false
		end
	end

	return addtrans
end

function Nauticus:Button_OnClick()

	if IsAltKeyDown() then
		if self:HasKnownCycle(self.activeTransit) then
			self:ToggleAlarm()

			-- set temporary button text so you know what's happening
			if self:IsAlarmSet() then
				self.tempText = "Alarm "..RED.."ON"
			else
				self.tempText = "Alarm OFF"
			end

			self.tempTextCount = 2
			self:UpdateDisplay()
		end

	else
		local isNotEmpty, isFound, addtrans, first

		for i = 1, #(transports), 1 do
			addtrans = self:IsRouteShown(i)
			isNotEmpty = isNotEmpty or addtrans
			if not first and addtrans then first = i; end

			if not isFound then
				if transports[i].label == self.activeTransit then
					isFound = true
				end
			else
				if addtrans then
					addtrans = i
					break
				end
			end
		end

		if not isNotEmpty then
			addtrans = 0
		elseif type(addtrans) ~= "number" then
			addtrans = first
		end

		self:SetTransport(addtrans)
	end

end

function Nauticus:ShowMenu(level)

	if level == 1 then

		dewdrop:AddLine(
			'text', L["Show only transports for your faction"],
			'arg1', self,
			'func', "ToggleFaction",
			'checked', self:IsFactionSpecific(),
			'tooltipTitle', L["Show only transports for your faction"],
			'tooltipText', L["Shows only neutral and transports specific to your faction."]
		)

		dewdrop:AddLine(
			'text', L["Show only transports in your current zone"],
			'arg1', self,
			'func', "ToggleZone",
			'checked', self:IsZoneSpecific(),
			'tooltipTitle', L["Show only transports in your current zone"],
			'tooltipText', L["Shows only transports in your current zone."]
		)

		dewdrop:AddSeparator()

		dewdrop:AddLine(
			'text', YELLOW..L["Select None"],
			'checked', (self.activeTransit == -1),
			'func', function() self:SetTransport(0) end
		)

		local textdesc

		for i = 1, #(transports), 1 do
			if self:IsRouteShown(i) then
				textdesc = transports[i].name

				if self:HasKnownCycle(transports[i].label) then
					if transports[i].faction == UnitFactionGroup("player") then
						textdesc = GREEN..textdesc
					elseif transports[i].faction == "Neutral" then
						textdesc = YELLOW..textdesc
					else
						textdesc = RED..textdesc
					end
				else
					textdesc = GREY..textdesc
				end

				dewdrop:AddLine(
					'text', textdesc,
					'checked', (transports[i].label == self.activeTransit),
					'func', function(i) self:SetTransport(i) end,
					'arg1', i
				)
			end
		end

		dewdrop:AddSeparator()

		dewdrop:FeedAceOptionsTable(self.optionsFu, level)

		dewdrop:AddSeparator()

	else
		dewdrop:FeedAceOptionsTable(self.optionsFu, level)

	end

end

function Nauticus:SetTransport(id)
	self.activeTransit = transports[id].label
	self.db.char.activeTransit = self.activeTransit

	if self:HasKnownCycle(self.activeTransit) then
		self.tempText = GREEN..transports[id].short_name
		self.tempTextCount = 2
	else
		self.tempTextCount = 0
	end

	self:TransportSelectSetNone()
end

function Nauticus:TransportSelectSetNone()
	local has = self:HasKnownCycle(self.activeTransit)

	if has == nil then
		self.lowestNameTime = "--"
		self.icon = ARTWORK_LOGO
	elseif has == false then
		self.lowestNameTime = L["N/A"]
		self.icon = ARTWORK_LOGO
	end

	self:UpdateDisplay()
end

function Nauticus:ShowTooltip(transit)

	local has = self:HasKnownCycle(transit)

	if has then
		local plat_time, formatted_time, depOrArr, r,g,b

		local liveData = self.liveData[transit]
		local cycle, platform = liveData.cycle, liveData.index

		tablet:AddLine(transports[self.lookupIndex[transit]].vessel_name)
			:Color(0.25, 0.75, 1, 1)
			:Font(GameFontHighlightLarge:GetFont())
			.left:SetJustifyH('CENTER')

		for index, data in pairs(platforms[transit]) do
			tablet:AddLine(data.name)
				:Color(1, 1, 1, 1)

			if data.index == platform then
				-- we're at a platform and waiting to depart
				plat_time = self:CalcTripCycleTimeByIndex(transit, platform) - cycle

				if plat_time > 30 then
					r,g,b = 1,1,0
				else
					r,g,b = 1,0,0
				end

				depOrArr = L["Departure"]
			else
				plat_time = self:CalcTripCycleTimeByIndex(transit, data.index-1) - cycle

				if plat_time < 0 then
					plat_time = plat_time + rtts[transit]
				end

				r,g,b = 0,1,0
				depOrArr = L["Arrival"]
			end

			formatted_time = self.formattedTimeCache[floor(plat_time)]

			tablet:AddLine(depOrArr..":", formatted_time, false, 10)
				:Color(1, 0.82, 0, 1, r, g, b, 1)
				:Font(nil, nil, nil, Naut_NumberFont:GetFont())

		end

		if IsShiftKeyDown() then
			tablet:AddLine("Metadata")
				:Color(0.75, 0.75, 0.75, 1)

			local since, boots, swaps = self:GetKnownCycle(transit)

			tablet:AddLine("Age:", SecondsToTime(since), false, 10)
				:Font(nil, nil, nil, Naut_NumberFont:GetFont())

			tablet:AddLine("Boots, Swaps:", boots..", "..swaps, false, 10)
				:Font(nil, nil, nil, Naut_NumberFont:GetFont())
		end

	elseif has == false then
		tablet:AddLine(transports[self.lookupIndex[transit]].vessel_name)
			:Color(0.25, 0.75, 1, 1)
			:Font(GameFontHighlightLarge:GetFont())
			.left:SetJustifyH('CENTER')

		for index, data in pairs(platforms[transit]) do
			tablet:AddLine(data.name)
				:Color(1, 1, 1, 1)

			tablet:AddLine(L["Not Available"])
				.left:SetJustifyH('CENTER')
		end

	elseif has == nil then
		tablet:AddLine(L["No Transport Selected"])
			:Color(1, 0.25, 0, 1)
			:Font(GameFontHighlightLarge:GetFont())
			.left:SetJustifyH('CENTER')

	end

end

local function GetMapIconAnchor()
	local x, y = GetCursorPosition()
	local cx, cy = GetScreenWidth() / 2, GetScreenHeight() / 2

	if x > cx then
		if y < cy then return "BOTTOMRIGHT", "TOPLEFT"
		else return "TOPRIGHT", "BOTTOMLEFT"; end
	else
		if y < cy then return "BOTTOMLEFT", "TOPRIGHT"
		else return "TOPLEFT", "BOTTOMRIGHT"; end
	end
end

local function GetBarAnchor(frame)
	local x, y = frame:GetCenter()
	if not x or not y then return "TOPLEFT", "BOTTOMLEFT"; end
	local cx, cy = UIParent:GetWidth() / 3, UIParent:GetHeight() / 2

	if x < cx then
		if y < cy then return "BOTTOMLEFT", "TOPLEFT"
		else return "TOPLEFT", "BOTTOMLEFT"; end
	elseif x > 2 * cx then
		if y < cy then return "BOTTOMRIGHT", "TOPRIGHT"
		else return "TOPRIGHT", "BOTTOMRIGHT"; end
	else
		if y < cy then return "BOTTOM", "TOP"
		else return "TOP", "BOTTOM"; end
	end
end

local function GetParentFrame()
	if UIParent:IsShown() then
		return UIParent
	end
	local f = GetUIPanel("fullscreen")
	if f and f:IsShown() then
		return f
	end
	return nil
end

function Nauticus:MapIconButtonMouseEnter(frame)
	local id = frame:GetID()
	local transit = self.transports[id].label
	local point, rel = GetMapIconAnchor()

	tablet:Attach(point, frame, rel, 0, 0)
	tablet.db.scale = 0.85
	tablet:Clear():SetParent(GetParentFrame())

	self:ShowTooltip(transit)

	for t = 1, #(transports), 1 do
		if transit ~= transports[t].label and (MouseIsOver(transports[t].worldmap_icon) or
			(transports[t].minimap_icon:IsVisible() and MouseIsOver(transports[t].minimap_icon)))
		then
			tablet:AddLine("•") -- ascii 149
				:Color(0.5, 0.5, 0, 1)
				.left:SetJustifyH('CENTER')
			self:ShowTooltip(transports[t].label)
		end
	end

	iconTooltip = frame
	tablet:SetPosition():Size():Show()
end

function Nauticus:MapIconButtonMouseExit(frame)
	tablet:Hide()
	iconTooltip = nil
end

function Nauticus:UpdateDisplay()
	dataobj.icon, dataobj.text = self:GetButtonIconText()
	if not iconTooltip then return; end

	if iconTooltip == barTooltipFrame then
		dataobj.OnEnter(iconTooltip)
	else
		self:MapIconButtonMouseEnter(iconTooltip)
	end
end

function Nauticus:RemoveAllIcons()
	for t = 1, #(transports), 1 do
		NautAstrolabe:RemoveIconFromMinimap(getglobal("Naut_MiniMapIconButton"..t))
		getglobal("Naut_WorldMapIconButton"..t):Hide()
	end
end

-- LDB stuff...
function dataobj:OnEnter()
	if dewdrop:IsOpen(self) then return; end

	iconTooltip = self
	barTooltipFrame = self

	local point, rel = GetBarAnchor(self)

	tablet:Attach(point, self, rel, 0, 0)
	tablet.db.scale = 1
	tablet:Clear():SetParent(GetParentFrame())

	tablet:AddLine("Nauticus")
		:Font(GameTooltipHeaderText:GetFont())
		.left:SetJustifyH('CENTER')

	Nauticus:ShowTooltip(Nauticus.activeTransit)

	tablet:AddLine("")
	tablet:AddLine(L["Hint: Click to cycle transport. Alt-Click to set up alarm"], nil, true)
		:Color(0, 1, 0, 1)

	tablet:SetPosition():Size():Show()
end

function dataobj:OnLeave()
	iconTooltip = nil
	tablet:Hide()
end

function dataobj:OnClick(button)
	if button == "LeftButton" then
		if dewdrop:IsOpen(self) then dewdrop:Close(); end
		Nauticus:Button_OnClick()
	elseif button == "RightButton" then
		iconTooltip = nil
		tablet:Hide()

		if not dewdrop:IsRegistered(self) then
			dewdrop:Register(self,
				'children', function(level)
					if level == 1 then
						dewdrop:AddLine(
							'text', "Nauticus",
							'isTitle', true
						)
					end
					Nauticus:ShowMenu(level)
				end,
				'point', GetBarAnchor,
				'dontHook', true
			)
		end

		if dewdrop:IsOpen(self) then
			dewdrop:Close()
		elseif self:IsShown() then
			dewdrop:Open(self)
		end
	end
end

-- Titan stuff...
-- don't go any further if Titan isn't loaded
if not IsAddOnLoaded("Titan") then return; end

-- hook menu close
local orig_TitanUtils_CloseRightClickMenu = TitanUtils_CloseRightClickMenu
function TitanUtils_CloseRightClickMenu(...)
	if dewdrop:GetOpenedParent() then dewdrop:Close(); end
	return orig_TitanUtils_CloseRightClickMenu(...)
end
