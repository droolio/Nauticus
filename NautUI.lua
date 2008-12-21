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
local GREY    = "|cffbababa"

-- constants
local ARTWORK_PATH = "Interface\\AddOns\\Nauticus\\Artwork\\"
local ARTWORK_LOGO = ARTWORK_PATH.."NauticusLogo"
local ARTWORK_ALARM = "Interface\\Icons\\INV_Misc_PocketWatch_02"
local NUMBER_FONT = "Fonts\\ARIALN.TTF"

local Nauticus = Nauticus
local L = LibStub("AceLocale-3.0"):GetLocale("Nauticus")
local ldb = LibStub:GetLibrary("LibDataBroker-1.1")
local dataobj = ldb:NewDataObject("Nauticus", { type = "data source", text = "Nauticus", icon = ARTWORK_LOGO } )
Nauticus.dataobj = dataobj

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

local transports = Nauticus.transports
local iconTooltip, barTooltipFrame


function Nauticus:IsTransportListed(transport)
	local addtrans = false
	transport = self:GetTransport(transport)

	if self.db.profile.factionSpecific then
		if transport.faction == UnitFactionGroup("player") or
			transport.faction == "Neutral" then

			addtrans = true
		end
	else
		addtrans = true
	end

	if addtrans and self.db.profile.zoneSpecific then
		if not string.find(string.lower(transport.name),
			string.lower(GetRealZoneText())) then

			addtrans = false
		end
	end

	return addtrans
end

function Nauticus:NextTransportInList()
	local isNotEmpty, isFound, addtrans, first

	for i = 1, #(transports), 1 do
		addtrans = self:IsTransportListed(i)
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

	return addtrans
end

local function AddLine(text, func, checked, value, tooltipTitle, tooltipText)
	local info = UIDropDownMenu_CreateInfo()
	info.text = text; info.func = func
	if value then info.value = value; end
	if checked then info.checked = true; end
	if tooltipTitle == true then
		info.tooltipTitle = text
	elseif tooltipTitle then
		info.tooltipTitle = tooltipTitle
	end
	if tooltipText then info.tooltipText = tooltipText; end
	UIDropDownMenu_AddButton(info)
end

local function AddSeparator()
	local info = UIDropDownMenu_CreateInfo()
	info.notClickable = 1
	UIDropDownMenu_AddButton(info)
end

function Nauticus:TransportSelectInitialise(frame, level)

	if level == 1 then
		local info = UIDropDownMenu_CreateInfo()
		info.text = "Nauticus"; info.isTitle = 1
		UIDropDownMenu_AddButton(info)

		AddLine(
			L["List friendly faction only"], -- text
			function() -- func
				Nauticus.db.profile.factionSpecific = not Nauticus.db.profile.factionSpecific
				ToggleDropDownMenu(1, nil, Naut_TransportSelectFrame)
			end,
			self.db.profile.factionSpecific, -- checked?
			nil, -- value
			true, -- tooltipTitle
			L["Shows only neutral transports and those of your faction."] -- tooltipText
		)

		AddLine(
			L["List relevant to current zone only"], -- text
			function() -- func
				Nauticus.db.profile.zoneSpecific = not Nauticus.db.profile.zoneSpecific
				ToggleDropDownMenu(1, nil, Naut_TransportSelectFrame)
			end,
			self.db.profile.zoneSpecific, -- checked?
			nil, -- value
			true, -- tooltipTitle
			L["Shows only transports relevant to your current zone."] -- tooltipText
		)

		AddSeparator()

		AddLine(
			GREY..L["Select None"], -- text
			function() -- func
				Nauticus:SetTransport(this.value)
				ToggleDropDownMenu(1, nil, Naut_TransportSelectFrame)
			end,
			self.activeTransit == -1, -- checked?
			0, -- value
			true -- tooltipTitle
		)

		local textdesc

		for i = 1, #(transports), 1 do
			if self:IsTransportListed(i) then
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

				AddLine(
					textdesc, -- text
					function() -- func
						Nauticus:SetTransport(this.value)
						ToggleDropDownMenu(1, nil, Naut_TransportSelectFrame)
					end,
					transports[i].label == self.activeTransit, -- checked?
					i, -- value
					true -- tooltipTitle
				)
			end
		end

		AddSeparator()

		AddLine(
			L["Options"], -- text
			function() InterfaceOptionsFrame_OpenToCategory(self.optionsFrame); end -- func
		)
	end

end

function Nauticus:SetTransport(transport)
	if transport then
		self.activeTransit = self:GetTransportName(transport)
		self.db.char.activeTransit = self.activeTransit
	end

	local has = self:HasKnownCycle(self.activeTransit)

	if has then
		self.tempText = GREEN..self:GetTransport(self.activeTransit).short_name
		self.tempTextCount = 3
	else
		self.lowestNameTime = (has == false) and L["N/A"] or "--"
		self.tempTextCount = 0
		self.icon = nil
	end

	self:UpdateDisplay()
end

function Nauticus:ShowTooltip(transit)

	local has = self:HasKnownCycle(transit)

	if has then
		local plat_time, formatted_time, depOrArr, r,g,b
		local liveData = self.liveData[transit]
		local cycle, platform = liveData.cycle, liveData.index

		tablet:AddLine(self:GetTransport(transit).vessel_name)
			:Color(0.25, 0.75, 1, 1)
			:Font(GameFontHighlightLarge:GetFont())
			.left:SetJustifyH('CENTER')

		for index, data in pairs(self.platforms[transit]) do
			tablet:AddLine(data.name)
				:Color(1, 1, 1, 1)

			if data.index == platform then
				-- we're at a platform and waiting to depart
				plat_time = self:GetCycleByIndex(transit, platform) - cycle

				if plat_time > 30 then
					r,g,b = 1,1,0
				else
					r,g,b = 1,0,0
				end

				depOrArr = L["Departure"]
			else
				plat_time = self:GetCycleByIndex(transit, data.index-1) - cycle

				if plat_time < 0 then
					plat_time = plat_time + self.rtts[transit]
				end

				r,g,b = 0,1,0
				depOrArr = L["Arrival"]
			end

			formatted_time = self.formattedTimeCache[floor(plat_time)]

			tablet:AddLine(depOrArr..":", formatted_time, false, 10)
				:Color(1, 0.82, 0, 1, r, g, b, 1)
				:Font(nil, nil, nil, NUMBER_FONT, 14, nil)

		end

		if (self.debug and not IsShiftKeyDown()) or (not self.debug and IsShiftKeyDown()) then
			tablet:AddLine("Metadata")
				:Color(0.75, 0.75, 0.75, 1)

			local since, boots, swaps = self:GetKnownCycle(transit)

			tablet:AddLine("Age:", SecondsToTime(since), false, 10)
				:Font(nil, nil, nil, NUMBER_FONT, 14, nil)

			tablet:AddLine("Boots, Swaps:", boots..", "..swaps, false, 10)
				:Font(nil, nil, nil, NUMBER_FONT, 14, nil)
		end

	elseif has == false then
		tablet:AddLine(self:GetTransport(transit).vessel_name)
			:Color(0.25, 0.75, 1, 1)
			:Font(GameFontHighlightLarge:GetFont())
			.left:SetJustifyH('CENTER')

		for index, data in pairs(self.platforms[transit]) do
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
	dataobj.icon = self:IsAlarmSet() and ARTWORK_ALARM or self.icon or ARTWORK_LOGO
	dataobj.text = self.tempTextCount > 0 and self.tempText or self.lowestNameTime

	if not iconTooltip then return; end

	if iconTooltip == barTooltipFrame then
		dataobj.OnEnter(iconTooltip)
	else
		self:MapIconButtonMouseEnter(iconTooltip)
	end
end

local function IsMenuOpen()
	return DropDownList1:IsShown() and
		UIDROPDOWNMENU_OPEN_MENU == Naut_TransportSelectFrame:GetName()
end

function Nauticus:RefreshMenu()
	if IsMenuOpen() then
		CloseDropDownMenus()
		ToggleDropDownMenu(1, nil, Naut_TransportSelectFrame)
	end
end

-- LDB stuff...
function dataobj:OnEnter()
	if IsMenuOpen() then return; end

	iconTooltip = self
	barTooltipFrame = self

	local point, rel = GetBarAnchor(self)

	tablet:Attach(point, self, rel, 0, 0)
	tablet.db.scale = 1
	tablet:Clear():SetParent(GetParentFrame())
	tablet:SetFrameLevel(tablet:GetParent():GetFrameLevel() + 1)

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
		if IsMenuOpen() then CloseDropDownMenus(); end

		if IsAltKeyDown() then
			if Nauticus:HasKnownCycle(Nauticus.activeTransit) then
				Nauticus:ToggleAlarm()
				Nauticus.tempText = "Alarm "..(Nauticus:IsAlarmSet() and RED..L["ON"] or GREEN..L["OFF"])
				Nauticus.tempTextCount = 3
				Nauticus:UpdateDisplay()
			end
		else
			Nauticus:SetTransport(Nauticus:NextTransportInList())
		end
	elseif button == "RightButton" then
		iconTooltip = nil
		tablet:Hide()
		local point, rel = GetBarAnchor(self)
		UIDropDownMenu_SetAnchor(Naut_TransportSelectFrame, 0, 0, point, self, rel)
		ToggleDropDownMenu(1, nil, Naut_TransportSelectFrame)
	end
end

-- Titan stuff...
-- don't go any further if Titan isn't loaded
if not IsAddOnLoaded("Titan") then Nauticus:DebugMessage("no titan"); return; end

-- hook menu close
local orig_TitanUtils_CloseRightClickMenu = TitanUtils_CloseRightClickMenu
function TitanUtils_CloseRightClickMenu(...)
	if IsMenuOpen() then CloseDropDownMenus(); end
	return orig_TitanUtils_CloseRightClickMenu(...)
end
