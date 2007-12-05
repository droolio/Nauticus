
-- declare colour codes for console messages
local RED     = "|cffff0000"
local GREEN   = "|cff00ff00"
local BLUE    = "|cff0000ff"
local MAGENTA = "|cffff00ff"
local YELLOW  = "|cffffff00"
local CYAN    = "|cff00ffff"
local WHITE   = "|cffffffff"
local ORANGE  = "|cffffba00"

local Nauticus = Nauticus

local L = AceLibrary("AceLocale-2.2"):new("Nauticus")

local NautAstrolabe = DongleStub("Astrolabe-0.4")

local rtts, platforms, transports, transitData =
	Nauticus.rtts, Nauticus.platforms, Nauticus.transports, Nauticus.transitData


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

function Nauticus:IsAlias()
    return self.db.profile.cityAlias
end

function Nauticus:ToggleAlias()
    self.db.profile.cityAlias = not self.db.profile.cityAlias
	NautOptionsFrameOptCityAlias:SetChecked(self.db.profile.cityAlias)
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

function Nauticus:GetNextShownRoute()
	local isNotEmpty, isFound, addtrans, first

	for i = 1, #(transports), 1 do
		addtrans = Nauticus:IsRouteShown(i)
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

	return transports[addtrans].label
end

function Nauticus:GetActiveRouteName(transit)
	if not transit then transit = self.activeTransit; end
	if transit == -1 then return L["None Selected"]; end

	if self:IsAlias() then
		return transports[self.lookupIndex[transit]].namealias
	else
		return transports[self.lookupIndex[transit]].name
	end
end

function Nauticus:TransportSelectInitialise(level)

	if level == 1 then
		local info, textdesc

		for i = 0, #(transports), 1 do
			if transports[i].faction == -1 or self:IsRouteShown(i) then
				if self:IsAlias() then
					textdesc = transports[i].namealias
				else
					textdesc = transports[i].name
				end

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

function Nauticus:TransportSelect_OnClick()
	self.activeTransit = transports[this.value].label
	self.db.char.activeTransit = self.activeTransit
	self:TransportSelectSetNone()
end

function Nauticus:TransportSelectSetNone()

	local has = self:HasKnownCycle(self.activeTransit)

	if has == nil then
		for index = 1, 2 do
			getglobal("NautFramePlat"..index.."Name"):SetText(L["None Selected"])
			getglobal("NautFramePlat"..index.."ArrivalDepature"):SetText(L["Not Available"])
			getglobal("NautFramePlat"..index.."Time"):SetText(L["N/A"])
		end

		self.lowestNameTime = "--"
		self.icon = "NauticusLogo"

	elseif has == false then
		local transit = self.activeTransit
		local plat_name

		for index, data in pairs(platforms[transit]) do
			if self:IsAlias() then
				plat_name = data.alias
			else
				plat_name = data.name
			end

			getglobal("NautFramePlat"..index.."Name"):SetText(plat_name)
			getglobal("NautFramePlat"..index.."ArrivalDepature"):SetText(L["Not Available"])
			getglobal("NautFramePlat"..index.."Time"):SetText(L["N/A"])
		end

		self.lowestNameTime = L["N/A"]
		self.icon = "NauticusLogo"
	end

	if NauticusFu then
		NauticusFu:UpdateDisplay()
	end

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
	self.db.profile.cityAlias = NautOptionsFrameOptCityAlias:GetChecked() ~= nil

	NautOptionsFrame:Hide()
end

function Nauticus:OptionsClose_OnClick()
	NautOptionsFrameOptZoneGUI:SetChecked(self:IsZoneGUI())
	NautOptionsFrameOptFactionSpecific:SetChecked(self:IsFactionSpecific())
	NautOptionsFrameOptZoneSpecific:SetChecked(self:IsZoneSpecific())
	NautOptionsFrameOptCityAlias:SetChecked(self:IsAlias())

	NautOptionsFrame:Hide()
end

function Nauticus:InitialiseUI()

	-- set GUI options
	NautOptionsFrameOptZoneGUI:SetChecked(self:IsZoneGUI())
	NautOptionsFrameOptFactionSpecific:SetChecked(self:IsFactionSpecific())
	NautOptionsFrameOptZoneSpecific:SetChecked(self:IsZoneSpecific())
	NautOptionsFrameOptCityAlias:SetChecked(self:IsAlias())

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
	NautOptionsFrameOptCityAliasText:SetText(L["Display using city aliases"])

	NautOptionsFrameCloseOptionsButtonText:SetText(L["Close"])
	NautOptionsFrameSaveOptionsButtonText:SetText(L["Save"])

end

Nauticus.tablet = AceLibrary("Tablet-2.0")
local tablet = Nauticus.tablet
function Nauticus:ShowTooltip(transit)

	local cat = tablet:AddCategory(
		'columns', 1
	)

	local has = self:HasKnownCycle(transit)

	if has then
		local plat_name, plat_time, formatted_time, depOrArr, r,g,b

		local liveData = self.liveData[transit]
		local cycle, platform = liveData.cycle, liveData.index

		cat:AddLine('text', self:GetActiveRouteName(transit),
			'justify', "CENTER")

		for index, data in pairs(platforms[transit]) do
			if self:IsAlias() then
				plat_name = data.alias
			else
				plat_name = data.name
			end

			cat = tablet:AddCategory(
				'text', plat_name,
				'columns', 2,
				'child_textR', 1,
				'child_textG', 1,
				'child_textB', 0
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

			cat:AddLine('text', depOrArr..":",
				'text2', formatted_time,
				'text2R', r, 'text2G', g, 'text2B', b)
		end

		if self.debug or IsShiftKeyDown() then
			local cat = tablet:AddCategory(
				'columns', 2
			)

			local since, boots, swaps = self:GetKnownCycle(transit)

			cat:AddLine('text', "Age:", 'text2', SecondsToTime(since))
			cat:AddLine('text', "Boots:", 'text2', boots)
			cat:AddLine('text', "Swaps:", 'text2', swaps)
		end

	elseif has == false then
		local plat_name

		cat:AddLine('text', self:GetActiveRouteName(transit),
			'justify', "CENTER")

		for index, data in pairs(platforms[transit]) do
			if self:IsAlias() then
				plat_name = data.alias
			else
				plat_name = data.name
			end

			local cat = tablet:AddCategory(
				'text', plat_name,
				'columns', 2,
				'child_textR', 1,
				'child_textG', 1,
				'child_textB', 0
			)

			cat:AddLine('text', L["Not Available"])
		end

	elseif has == nil then
		cat:AddLine('text', L["No Transit Selected"])

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

function Nauticus:MapIconButtonMouseEnter()

	local id = this:GetID()
	local transit = self.transports[id].label

	if not tablet:IsRegistered(this) then
		self.iconTablet = tablet
		tablet:Register(this,
		    'children', function()
				self:ShowTooltip(transit)
			end,
			'point', function(parent)
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
			end,
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

function Nauticus:RemoveAllMinimapIcons()
	local buttonMini

	for t = 1, #(transports), 1 do
		buttonMini = getglobal("Naut_MiniMapIconButton"..t)
		NautAstrolabe:RemoveIconFromMinimap(buttonMini)
	end
end
