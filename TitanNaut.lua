
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

-- constants
local TITAN_ID = "Nauticus"

local Nauticus = Nauticus

local L = AceLibrary("AceLocale-2.2"):new("Nauticus")

local tablet = AceLibrary("Tablet-2.0")
local dewdrop = AceLibrary("Dewdrop-2.0")

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
		frequency = 1,
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

local function GetAnchor()
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
			'point', GetAnchor,
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
			'point', GetAnchor,
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

function Nauticus:TitanPanelButton_OnClick(event)
	tablet:Close()

	if event == "LeftButton" then
		if dewdrop:IsOpen(this) then dewdrop:Close(); end
		self:Button_OnClick()
	end

	TitanPanelButton_OnClick(event)
end
