
-- don't go any further if Titan isn't loaded
if not IsAddOnLoaded("Titan") then Nauticus:DebugMessage("no titan"); return; end

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

local rtts, platforms, transports, transitData =
	Nauticus.rtts, Nauticus.platforms, Nauticus.transports, Nauticus.transitData

-- constants
local TITAN_NAUT_ID = "Nauticus"
local TITAN_NAUT_ARTWORK = "Interface\\AddOns\\Nauticus\\Artwork\\"

local Naut_TitanPanelButton_OnTooltipUpdate


function TitanPanelNauticusButton_OnLoad()

	this.registry = {
		id = TITAN_NAUT_ID,
		category = "Information",
		version = Nauticus.versionStr,
		menuText = "Nauticus", 
		buttonTextFunction = "TitanPanelNauticusButton_GetButtonText",
		tooltipTitle = "Nauticus",
		tooltipCustomFunction = Naut_TitanPanelButton_OnTooltipUpdate,
		frequency = 1,
		icon = TITAN_NAUT_ARTWORK.."NauticusLogo",
		iconWidth = 16,
		savedVariables = {
			ShowLabelText = 1,
			ShowIcon = 1,
		}
	}

	this:RegisterEvent("ZONE_CHANGED_NEW_AREA")

	Pre_TitanToggleVar = TitanToggleVar
	TitanToggleVar = Naut_TitanToggleVar

end

-- hook toggle button
function Naut_TitanToggleVar(id, var)
	if id == TITAN_NAUT_ID then
		TitanPanelRightClickMenu_Close()
	end

	return Pre_TitanToggleVar(id, var)
end

function TitanPanelNauticusButton_OnEvent()
	if event == "ZONE_CHANGED_NEW_AREA" then
		TitanPanelRightClickMenu_Close()
	end
end

function Naut_TitanPanelButton_OnTooltipUpdate()
	local tablet = Nauticus.tablet

	if not tablet:IsRegistered(this) then
		tablet:Register(this,
			'children', function()
				tablet:SetTitle(Nauticus.title)
				Nauticus:ShowTooltip(Nauticus.activeTransit)
				tablet:SetHint(L["Click to cycle transport.|nAlt-Click to set up alarm"])
			end,
			'point', function(parent)
				local x, y = GetCursorPosition()
				local cx, cy = GetScreenWidth() / 2, GetScreenHeight() / 2
				if x > cx then
					if y < cy then
						return "BOTTOMRIGHT", "TOPRIGHT"
					else
						return "TOPRIGHT", "BOTTOMRIGHT"
					end
				else
					if y < cy then
						return "BOTTOMLEFT", "TOPLEFT"
					else
						return "TOPLEFT", "BOTTOMLEFT"
					end
				end
			end,
			'dontHook', true
		)
	end

	Nauticus.iconTooltip = this
	tablet:Open(this)
end

local function Naut_TitanPanelButton_Close()
	Nauticus.tablet:Close(this)
end

function Naut_TitanPanelRightClickMenu_AddToggleVar(text, var, toggleFunc)
	local info = {}
	info.text = text
	info.func = toggleFunc
	info.checked = var
	info.keepShownOnClick = 1
	UIDropDownMenu_AddButton(info)
end

function TitanPanelRightClickMenu_PrepareNauticusMenu()

	TitanPanelRightClickMenu_AddTitle(TitanPlugins[TITAN_NAUT_ID].menuText)

	Naut_TitanPanelRightClickMenu_AddToggleVar(L["Show only transports for your faction"], Nauticus:IsFactionSpecific(), function() Nauticus:ToggleFaction() end)
	Naut_TitanPanelRightClickMenu_AddToggleVar(L["Show only transports in your current zone"], Nauticus:IsZoneSpecific(), function() Nauticus:ToggleZone() end)
	Naut_TitanPanelRightClickMenu_AddToggleVar(L["Display using city aliases"], Nauticus:IsAlias(), function() Nauticus:ToggleAlias() end)

	TitanPanelRightClickMenu_AddSpacer()
	TitanPanelRightClickMenu_AddCommand(YELLOW.."Select None", 0, "TitanPanelNauticusButton_SetTransport")

	local textdesc

	for i = 1, #(transports), 1 do
		if Nauticus:IsRouteShown(i) then
			if Nauticus:IsAlias() then
				textdesc = transports[i].namealias
			else
				textdesc = transports[i].name
			end

			if Nauticus:HasKnownCycle(transports[i].label) then
				textdesc = GREEN..textdesc
			end

			TitanPanelRightClickMenu_AddCommand(textdesc, i, "TitanPanelNauticusButton_SetTransport")
		end
	end

	TitanPanelRightClickMenu_AddSpacer()
	TitanPanelRightClickMenu_AddCommand(TITAN_PANEL_MENU_HIDE, TITAN_NAUT_ID, TITAN_PANEL_MENU_FUNC_HIDE)

end

function TitanPanelNauticusButton_GetButtonText(id)
	if Nauticus:IsAlarmSet() then
		TitanPanelNauticusButton.registry.icon = "Interface\\Icons\\INV_Misc_PocketWatch_02"
	else
		TitanPanelNauticusButton.registry.icon = TITAN_NAUT_ARTWORK..Nauticus.icon
	end

	if Nauticus.tempTextCount > 0 then
		Nauticus.tempTextCount = Nauticus.tempTextCount - 1
		return Nauticus.tempText
	end

	return Nauticus.lowestNameTime
end

function TitanPanelNauticusButton_OnClick(event)

	Naut_TitanPanelButton_Close()

	if event ~= "LeftButton" then return; end

	if IsAltKeyDown() then
		if Nauticus.activeTransit ~= -1 then
			Nauticus:ToggleAlarm()

			-- set temporary button text so you know which one is currently selected
			if Nauticus:IsAlarmSet() then
				Nauticus.tempText = "Alarm "..RED.."ON"
			else
				Nauticus.tempText = "Alarm OFF"
			end

			Nauticus.tempTextCount = 2
			TitanPanelButton_SetButtonText(TITAN_NAUT_ID)
		end

		return
	end

	Nauticus.activeTransit = Nauticus:GetNextShownRoute()
	Nauticus.db.char.activeTransit = Nauticus.activeTransit

	local colour

	if Nauticus:HasKnownCycle(Nauticus.activeTransit) then
		colour = GREEN
	else
		colour = RED
	end

	-- set temporary button text so you know which one is currently selected
	Nauticus.tempText = colour..Nauticus:GetActiveRouteName()
	Nauticus.tempTextCount = 2
	TitanPanelButton_SetButtonText(TITAN_NAUT_ID)
	Nauticus:TransportSelectSetNone()

end

function TitanPanelNauticusButton_SetTransport()
	Nauticus.activeTransit = transports[this.value].label
	Nauticus.db.char.activeTransit = Nauticus.activeTransit

	if Nauticus.activeTransit ~= -1 then
		Nauticus.tempText = Nauticus:GetActiveRouteName()
		Nauticus.tempTextCount = 2
	end

	Nauticus:TransportSelectSetNone()
end
