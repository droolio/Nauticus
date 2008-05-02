
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
local ARTWORK_PATH = "Interface\\AddOns\\Nauticus\\Artwork\\"
local ARTWORK_LOGO = ARTWORK_PATH.."NauticusLogo"
local ARTWORK_ALARM = "Interface\\Icons\\INV_Misc_PocketWatch_02"

local Nauticus = Nauticus

local L = AceLibrary("AceLocale-2.2"):new("Nauticus")

local tablet = AceLibrary("Tablet-2.0")
local dewdrop = AceLibrary("Dewdrop-2.0")

local NautAstrolabe = DongleStub("Astrolabe-0.4-NC")

local rtts, platforms, transports =
	Nauticus.rtts, Nauticus.platforms, Nauticus.transports


function Nauticus:IsZoneGUI()
    return self.db.profile.zoneGUI
end

function Nauticus:IsFactionSpecific()
    return self.db.profile.factionSpecific
end

function Nauticus:ToggleFaction()
    self.db.profile.factionSpecific = not self.db.profile.factionSpecific
	NautOptionsFrameOptFactionSpecific:SetChecked(self.db.profile.factionSpecific)
end

function Nauticus:IsZoneSpecific()
    return self.db.profile.zoneSpecific
end

function Nauticus:ToggleZone()
    self.db.profile.zoneSpecific = not self.db.profile.zoneSpecific
	NautOptionsFrameOptZoneSpecific:SetChecked(self.db.profile.zoneSpecific)
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
			self:SetText(self.tempText)
			if self.TitanPanelButton_SetText then self:TitanPanelButton_SetText(); end
		end

	else
		local isNotEmpty, isFound, addtrans, first

		for i = 1, #(transports), 1 do
			addtrans = self:IsRouteShown(i)
			isNotEmpty = isNotEmpty or addtrans
			if not first and addtrans then first = i; end

			if not isFound then
				if transports[i].label == Nauticus.activeTransit then
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

function Nauticus:TransportSelectInitialise(level)

	if level == 1 then
		local info, textdesc

		info = UIDropDownMenu_CreateInfo()
		info.text = YELLOW..L["Select None"]
		info.value = 0
		if self.activeTransit == -1 then info.checked = true; end
		info.func = function() Nauticus:TransportSelect_OnClick() end

		UIDropDownMenu_AddButton(info)

		for i = 1, #(transports), 1 do
			if self:IsRouteShown(i) then
				textdesc = transports[i].name

				if self:HasKnownCycle(transports[i].label) then
					textdesc = GREEN..textdesc
				end

				info = UIDropDownMenu_CreateInfo()
				info.text = textdesc
				info.value = i
				if transports[i].label == self.activeTransit then info.checked = true; end
				info.func = function() Nauticus:TransportSelect_OnClick() end

				UIDropDownMenu_AddButton(info)
			end
		end
	end

end

function Nauticus:ShowMenu()

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
				textdesc = GREEN..textdesc
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

end

function Nauticus:TransportSelect_OnClick()
	self:SetTransport(this.value)
end

function Nauticus:SetTransport(id)
	self.activeTransit = transports[id].label
	self.db.char.activeTransit = self.activeTransit

	if self:HasKnownCycle(self.activeTransit) then
		self.tempText = GREEN..transports[id].short_name
		self.tempTextCount = 2
		self:SetText(self.tempText)
		if self.TitanPanelButton_SetText then self:TitanPanelButton_SetText(); end
	else
		self.tempTextCount = 0
	end

	self:TransportSelectSetNone()
end

function Nauticus:TransportSelectSetNone()

	local has = self:HasKnownCycle(self.activeTransit)

	if has == nil then
		for index = 1, 2 do
			getglobal("NautFramePlat"..index.."Name"):SetText(L["No Transport Selected"])
			getglobal("NautFramePlat"..index.."ArrivalDepature"):SetText(L["Not Available"])
			getglobal("NautFramePlat"..index.."Time"):SetText(L["N/A"])
		end

		self.lowestNameTime = "--"
		self.icon = ARTWORK_LOGO

	elseif has == false then
		local transit = self.activeTransit

		for index, data in pairs(platforms[transit]) do
			getglobal("NautFramePlat"..index.."Name"):SetText(data.name)
			getglobal("NautFramePlat"..index.."ArrivalDepature"):SetText(L["Not Available"])
			getglobal("NautFramePlat"..index.."Time"):SetText(L["N/A"])
		end

		self.lowestNameTime = L["N/A"]
		self.icon = ARTWORK_LOGO
	end

	self:UpdateDisplay()
	if self.TitanPanelButton_UpdateButton then self:TitanPanelButton_UpdateButton(); end

end

function Nauticus:Minimise_OnClick()
	self.db.char.showLowerGUI = not self.db.char.showLowerGUI
	self:UpdateUI()
end

function Nauticus:UpdateUI()

	if self.db.char.showGUI then
		NautHeaderFrame:Show()
	else
		NautHeaderFrame:Hide()
		return
	end

	if self.db.char.showLowerGUI then
		NautHeaderFrame:SetWidth(195)
		NautHeaderFrameAddonName:Show()
		NautHeaderFrameOptionsButton:Show()
		self:CancelScheduledEvent("NAUT_HIDE_NautFrame")
		NautFrame:SetAlpha(1)
		NautFrame:Show()
		self:Clock_OnUpdate(0)
		NautHeaderFrameMinimiseButton:SetNormalTexture("Interface\\Buttons\\UI-MinusButton-UP")
		NautHeaderFrameMinimiseButton:SetPushedTexture("Interface\\Buttons\\UI-MinusButton-DOWN")

		local _, centre = NautHeaderFrame:GetCenter()
		NautFrame:ClearAllPoints()

		if centre < (GetScreenHeight()/2) then
			NautFrame:SetPoint("BOTTOM", NautHeaderFrame, "TOP", 0, -5)
		else
			NautFrame:SetPoint("TOP", NautHeaderFrame, "BOTTOM", 0, 5)
		end

	else
		if NautFrame:IsVisible() then
			self:TransportSelectButton_Fade("NautFrame", 0.85, function() self:UpdateUI() end)
			return
		end

		NautHeaderFrameMinimiseButton:SetNormalTexture("Interface\\Buttons\\UI-PlusButton-UP")
		NautHeaderFrameMinimiseButton:SetPushedTexture("Interface\\Buttons\\UI-PlusButton-DOWN")
		NautHeaderFrameOptionsButton:Hide()
		NautHeaderFrameAddonName:Hide()

		-- initialise anchor
		local top, right = NautHeaderFrame:GetTop(), NautHeaderFrame:GetRight()

		if top ~= nil and right ~= nil then
			NautHeaderFrame:ClearAllPoints()
			NautHeaderFrame:SetPoint("TOPRIGHT", UIParent, "BOTTOMLEFT", right, top)
		end

		NautHeaderFrame:SetWidth(64)
	end

	self.db.char.top, self.db.char.right = NautHeaderFrame:GetTop(), NautHeaderFrame:GetRight()

end

function Nauticus:Close_OnClick()
	self.db.char.showGUI = false
	self:UpdateUI()
end

function Nauticus:Options_OnClick()
	if not NautOptionsFrame:IsVisible() then
		NautOptionsFrame:Show()
	else
		NautOptionsFrame:Hide()
	end
end

function Nauticus:OptionsSave_OnClick()
	self.db.profile.zoneGUI = NautOptionsFrameOptZoneGUI:GetChecked() ~= nil
	self.db.profile.factionSpecific = NautOptionsFrameOptFactionSpecific:GetChecked() ~= nil
	self.db.profile.zoneSpecific = NautOptionsFrameOptZoneSpecific:GetChecked() ~= nil

	NautOptionsFrame:Hide()
end

function Nauticus:OptionsClose_OnClick()
	NautOptionsFrameOptZoneGUI:SetChecked(self:IsZoneGUI())
	NautOptionsFrameOptFactionSpecific:SetChecked(self:IsFactionSpecific())
	NautOptionsFrameOptZoneSpecific:SetChecked(self:IsZoneSpecific())

	NautOptionsFrame:Hide()
end

function Nauticus:InitialiseUI()

	-- set GUI options
	NautOptionsFrameOptZoneGUI:SetChecked(self:IsZoneGUI())
	NautOptionsFrameOptFactionSpecific:SetChecked(self:IsFactionSpecific())
	NautOptionsFrameOptZoneSpecific:SetChecked(self:IsZoneSpecific())

	NautHeaderFrameAddonName:SetText("Nauticus v"..self.versionStr)

	if (GetLocale() == "deDE") then
		NautOptionsFrame:SetWidth(365)
		NautOptionsFrameCloseOptionsButton:SetWidth(75)
		NautOptionsFrameSaveOptionsButton:SetWidth(75)
	end

	NautOptionsFrameOptionsTitle:SetText(L["Nauticus Options"])
	NautOptionsFrameOptZoneGUIText:SetText(L["Show GUI when zone change contains a transport"])
	NautOptionsFrameOptFactionSpecificText:SetText(L["Show only transports for your faction"])
	NautOptionsFrameOptZoneSpecificText:SetText(L["Show only transports in your current zone"])

	NautOptionsFrameCloseOptionsButtonText:SetText(L["Close"])
	NautOptionsFrameSaveOptionsButtonText:SetText(L["Save"])

end

function Nauticus:ShowTooltip(transit)

	local cat

	local has = self:HasKnownCycle(transit)

	if has then
		local plat_time, formatted_time, depOrArr, r,g,b

		local liveData = self.liveData[transit]
		local cycle, platform = liveData.cycle, liveData.index

		cat = tablet:AddCategory(
			'text', transports[self.lookupIndex[transit]].vessel_name,
			'columns', 1,
			'font', GameFontHighlightLarge,
			'textR', 0.25, 'textG', 0.75, 'textB', 1,
			'justify', "CENTER"
		)

		cat:AddLine('text', "")

		for index, data in pairs(platforms[transit]) do
			cat = tablet:AddCategory(
				'text', data.name,
				'columns', 2,
				'hideBlankLine', true
			)

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

			cat:AddLine(
				'text', depOrArr..":",
				'indentation', 10,
				'text2', formatted_time,
				'font2', Naut_NumberFont,
				'text2R', r, 'text2G', g, 'text2B', b
			)
		end

		if (self.debug and not IsShiftKeyDown()) or (not self.debug and IsShiftKeyDown()) then
			cat = tablet:AddCategory(
				'text', "Debug",
				'columns', 2,
				'textR', 0.75, 'textG', 0.75, 'textB', 0.75,
				'hideBlankLine', true
			)

			local since, boots, swaps = self:GetKnownCycle(transit)

			cat:AddLine(
				'text', "Age:",
				'indentation', 10,
				'text2', SecondsToTime(since),
				'font2', Naut_NumberFont
			)

			cat:AddLine(
				'text', "Boots, Swaps:",
				'indentation', 10,
				'text2', boots..", "..swaps,
				'font2', Naut_NumberFont
			)
		end

	elseif has == false then
		cat = tablet:AddCategory(
			'text', transports[self.lookupIndex[transit]].vessel_name,
			'columns', 1,
			'font', GameFontHighlightLarge,
			'textR', 0.25, 'textG', 0.75, 'textB', 1,
			'justify', "CENTER"
		)

		cat:AddLine('text', "")

		for index, data in pairs(platforms[transit]) do
			cat = tablet:AddCategory(
				'text', data.name,
				'columns', 1,
				'hideBlankLine', true
			)

			cat:AddLine(
				'text', L["Not Available"],
				'justify', "CENTER"
			)
		end

	elseif has == nil then
		cat = tablet:AddCategory(
			'text', L["No Transport Selected"],
			'columns', 1,
			'font', GameFontHighlightLarge,
			'textR', 1, 'textG', 0.25, 'textB', 0,
			'showWithoutChildren', true,
			'justify', "CENTER"
		)

	end

end

-- recursively fade the frame
-- if fade is nil, first pause 1.5sec then fade over 0.5sec @ ~13.33fps
-- callback is function to call when frame eventually hidden (optional)
function Nauticus:TransportSelectButton_Fade(frame_name, fade, callback)
	frame = getglobal(frame_name)

	if not fade then
		self:ScheduleEvent("NAUT_HIDE_"..frame_name,
			self.TransportSelectButton_Fade, 1.5, self, frame_name, 0.85, callback)
	else
		if fade < 0 then
			frame:Hide()
			if callback then callback(); end
		else
			frame:SetAlpha(fade)

			self:ScheduleEvent("NAUT_HIDE_"..frame_name,
				self.TransportSelectButton_Fade, 0.075, self, frame_name, fade-0.15, callback)
		end
	end
end

function Nauticus:WidgetTooltip_Show(text, desc)
	self:ScheduleEvent("NAUT_SHOW_TOOLTIP", function(frame, text, desc)
		GameTooltip:SetOwner(frame, "ANCHOR_RIGHT")
		GameTooltip:SetText(L[text])
		if desc then
			GameTooltip:AddLine(L[desc], 1, 1, 1, 1)
			GameTooltip:Show()
		end
	end, 1, this, text, desc)
end

function Nauticus:WidgetTooltip_Hide()
	self:CancelScheduledEvent("NAUT_SHOW_TOOLTIP")
	GameTooltip:Hide()
end

local function GetMapIconAnchor()
	local x, y = GetCursorPosition()
	local cx, cy = GetScreenWidth() / 2, GetScreenHeight() / 2

	if x > cx then
		if y < cy then
			return "BOTTOMRIGHT", "TOPLEFT"
		else
			return "TOPRIGHT", "BOTTOMLEFT"
		end
	else
		if y < cy then
			return "BOTTOMLEFT", "TOPRIGHT"
		else
			return "TOPLEFT", "BOTTOMRIGHT"
		end
	end
end

function Nauticus:MapIconButtonMouseEnter()

	local id = this:GetID()
	local transit = self.transports[id].label

	if not tablet:IsRegistered(this) then
		tablet:Register(this,
		    'children', function()
				self:ShowTooltip(transit)
			end,
			'point', GetMapIconAnchor,
			'dontHook', true
		)
		tablet:SetFontSizePercent(this, tablet:GetFontSizePercent(this) * 0.85)
	end

	self.iconTooltip = this
	tablet:Open(this)

end

function Nauticus:MapIconButtonMouseExit()
	tablet:Close(this)
	self.iconTooltip = nil
end

function Nauticus:RemoveAllIcons()
	for t = 1, #(transports), 1 do
		NautAstrolabe:RemoveIconFromMinimap(getglobal("Naut_MiniMapIconButton"..t))
		getglobal("Naut_WorldMapIconButton"..t):Hide()
	end
end

-- FuBar stuff...
function Nauticus:OnTooltipUpdate()
	self:ShowTooltip(self.activeTransit)
    tablet:SetHint(L["Click to cycle transport.|nAlt-Click to set up alarm"])
end

function Nauticus:OnMenuRequest(level, value, inTooltip)
	if inTooltip then return; end
	self:ShowMenu()
end

function Nauticus:OnTextUpdate()
	local icon, text = self:GetButtonIconText()
	self:SetIcon(icon); self:SetText(text)
end

function Nauticus:OnClick()
	self:Button_OnClick()
end

-- Titan stuff...
-- don't go any further if Titan isn't loaded
if not IsAddOnLoaded("Titan") then Nauticus:DebugMessage("no titan"); return; end

-- constants
local TITAN_ID = "Nauticus"

local Naut_TitanPanelButton_OnTooltipUpdate

local Pre_TitanUtils_CloseRightClickMenu, Naut_TitanUtils_CloseRightClickMenu

function Nauticus:TitanPanelButton_OnLoad()

	this.registry = {
		id = TITAN_ID,
		category = "Information",
		version = self.versionStr,
		menuText = "Nauticus",
		buttonTextFunction = "Naut_TitanPanelButton_GetButtonText",
		tooltipTitle = "Nauticus",
		tooltipCustomFunction = function() Nauticus:TitanPanelButton_OnTooltipUpdate() end,
		icon = self.logo,
		iconWidth = 16,
		savedVariables = {
			ShowLabelText = 1,
			ShowIcon = 1,
		}
	}

	Pre_TitanUtils_CloseRightClickMenu = TitanUtils_CloseRightClickMenu
	TitanUtils_CloseRightClickMenu = Naut_TitanUtils_CloseRightClickMenu

	TitanPanelButton_OnLoad()
end

-- hook menu close
function Naut_TitanUtils_CloseRightClickMenu()
	Pre_TitanUtils_CloseRightClickMenu()

	if dewdrop:GetOpenedParent() then
		dewdrop:Close()
	end
end

local function GetTitanAnchor()
	local _, y = GetCursorPosition()
	local cy = GetScreenHeight() / 2
	if y < cy then
		return "BOTTOMLEFT", "TOPLEFT"
	else
		return "TOPLEFT", "BOTTOMLEFT"
	end
end

function Nauticus:TitanPanelButton_OnTooltipUpdate()
	if dewdrop:IsOpen(this) then return; end

	if not tablet:IsRegistered(this) then
		tablet:Register(this,
			'children', function()
				tablet:SetTitle(self.title)
				self:ShowTooltip(self.activeTransit)
				tablet:SetHint(L["Click to cycle transport.|nAlt-Click to set up alarm"])
			end,
			'point', GetTitanAnchor,
			'dontHook', true
		)
	end

	self.iconTooltip = this
	tablet:Open(this)
end

function TitanPanelRightClickMenu_PrepareNauticusMenu()

	if not dewdrop:IsRegistered(this) then
		dewdrop:Register(this,
			'children', function()
					dewdrop:AddLine(
						'text', TitanPlugins[TITAN_ID].menuText,
						'isTitle', true
					)
				Nauticus:ShowMenu()
					dewdrop:AddLine(
						'text', TITAN_PANEL_MENU_HIDE,
						'func', function()
							TitanPanel_RemoveButton(TITAN_ID)
							dewdrop:Close()
						end
					)
			end,
			'point', GetTitanAnchor,
			'dontHook', true
		)
	end

	if dewdrop:IsOpen(this) then
		dewdrop:Close()
	elseif this:IsShown() then
		dewdrop:Open(this)
	end

end

function Naut_TitanPanelButton_GetButtonText()
	local icon, text = Nauticus:GetButtonIconText()
	TitanPanelNauticusButton.registry.icon = icon
	return text
end

function Nauticus:TitanPanelButton_SetText()
	TitanPanelButton_SetButtonText(TITAN_ID)
end

function Nauticus:TitanPanelButton_UpdateButton()
	TitanPanelButton_UpdateButton(TITAN_ID)
end

function Nauticus:TitanPanelButton_OnClick(event)
	tablet:Close()

	if event == "LeftButton" then
		if dewdrop:IsOpen(this) then dewdrop:Close(); end
		self:Button_OnClick()
	end

	TitanPanelButton_OnClick(event)
end
