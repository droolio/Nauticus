
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

local tablet = AceLibrary("Tablet-2.0")

local dewdrop = AceLibrary("Dewdrop-2.0")

local rtts, platforms, transports, transitData =
	Nauticus.rtts, Nauticus.platforms, Nauticus.transports, Nauticus.transitData

-- constants
local TITAN_NAUT_ID = "Nauticus"
local TITAN_NAUT_ARTWORK = "Interface\\AddOns\\Nauticus\\Artwork\\"

local Naut_TitanPanelButton_OnTooltipUpdate, Naut_TitanPanelButton_SetTransport

local Pre_TitanUtils_CloseRightClickMenu, Naut_TitanUtils_CloseRightClickMenu


function Naut_TitanPanelButton_OnLoad()

	this.registry = {
		id = TITAN_NAUT_ID,
		category = "Information",
		version = Nauticus.versionStr,
		menuText = "Nauticus", 
		buttonTextFunction = "Naut_TitanPanelButton_GetButtonText",
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

	Pre_TitanUtils_CloseRightClickMenu = TitanUtils_CloseRightClickMenu
	TitanUtils_CloseRightClickMenu = Naut_TitanUtils_CloseRightClickMenu

end

-- hook menu close
function Naut_TitanUtils_CloseRightClickMenu()
	Pre_TitanUtils_CloseRightClickMenu()

	if dewdrop:GetOpenedParent() then
		dewdrop:Close()
	end
end

function Naut_TitanPanelButton_OnEvent()
	if event == "ZONE_CHANGED_NEW_AREA" then
		TitanPanelRightClickMenu_Close()
	end
end

function Naut_TitanPanelButton_OnTooltipUpdate()
	if dewdrop:IsOpen(this) then return; end

	if not tablet:IsRegistered(this) then
		tablet:Register(this,
			'children', function()
				tablet:SetTitle(Nauticus.title)
				Nauticus:ShowTooltip(Nauticus.activeTransit)
				tablet:SetHint(L["Click to cycle transport.|nAlt-Click to set up alarm"])
			end,
			'point', function(parent)
				local _, y = GetCursorPosition()
				local cy = GetScreenHeight() / 2
				if y < cy then
					return "BOTTOMLEFT", "TOPLEFT"
				else
					return "TOPLEFT", "BOTTOMLEFT"
				end
			end,
			'dontHook', true
		)
	end

	Nauticus.iconTooltip = this
	tablet:Open(this)
end

function TitanPanelRightClickMenu_PrepareNauticusMenu()

	if not dewdrop:IsRegistered(this) then
		dewdrop:Register(this,
			'children', function()
				dewdrop:AddLine(
					'text', TitanPlugins[TITAN_NAUT_ID].menuText,
					'isTitle', true
				)

				dewdrop:AddLine(
					'text', L["Show only transports for your faction"],
					'arg1', Nauticus,
					'func', "ToggleFaction",
					'checked', Nauticus:IsFactionSpecific(),
					'tooltipTitle', L["Show only transports for your faction"],
					'tooltipText', L["Shows only neutral and transports specific to your faction."]
				)

				dewdrop:AddLine(
					'text', L["Show only transports in your current zone"],
					'arg1', Nauticus,
					'func', "ToggleZone",
					'checked', Nauticus:IsZoneSpecific(),
					'tooltipTitle', L["Show only transports in your current zone"],
					'tooltipText', L["Shows only transports in your current zone."]
				)

				dewdrop:AddSeparator()

				dewdrop:AddLine(
					'text', YELLOW..L["Select None"],
					'checked', (Nauticus.activeTransit == -1),
					'func', Naut_TitanPanelButton_SetTransport,
					'arg1', 0
				)

				local textdesc

				for i = 1, #(transports), 1 do
					if Nauticus:IsRouteShown(i) then
						textdesc = transports[i].name

						if Nauticus:HasKnownCycle(transports[i].label) then
							textdesc = GREEN..textdesc
						end

						dewdrop:AddLine(
							'text', textdesc,
							'checked', (transports[i].label == Nauticus.activeTransit),
							'func', Naut_TitanPanelButton_SetTransport,
							'arg1', i
						)
					end
				end

				dewdrop:AddSeparator()

				dewdrop:AddLine(
					'text', TITAN_PANEL_MENU_HIDE,
					'func', function()
						TitanPanel_RemoveButton(TITAN_NAUT_ID)
						dewdrop:Close()
					end
				)
			end,
			'point', function(parent)
				local _, y = GetCursorPosition()
				local cy = GetScreenHeight() / 2
				if y < cy then
					return "BOTTOMLEFT", "TOPLEFT"
				else
					return "TOPLEFT", "BOTTOMLEFT"
				end
			end,
			'dontHook', true
		)
	end

	if dewdrop:IsOpen(this) then
		dewdrop:Close()
	elseif this:IsShown() then
		dewdrop:Open(this)
	end

end

function Naut_TitanPanelButton_GetButtonText(id)
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

function Naut_TitanPanelButton_OnClick(event)

	tablet:Close()

	if event ~= "LeftButton" then return; end

	if dewdrop:IsOpen(this) then
		dewdrop:Close()
	end

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
	Nauticus.tempText = colour..transports[Nauticus.lookupIndex[Nauticus.activeTransit]].name
	Nauticus.tempTextCount = 2
	TitanPanelButton_SetButtonText(TITAN_NAUT_ID)
	Nauticus:TransportSelectSetNone()

end

function Naut_TitanPanelButton_SetTransport(id)
	Nauticus.activeTransit = transports[id].label
	Nauticus.db.char.activeTransit = Nauticus.activeTransit

	local colour

	if Nauticus:HasKnownCycle(Nauticus.activeTransit) then
		colour = GREEN
	else
		colour = RED
	end

	if Nauticus.activeTransit ~= -1 then
		Nauticus.tempText = colour..transports[id].name
		Nauticus.tempTextCount = 2
	end

	Nauticus:TransportSelectSetNone()
end
