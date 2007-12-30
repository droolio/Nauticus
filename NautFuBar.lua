
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

NauticusFu = AceLibrary("AceAddon-2.0"):new("FuBarPlugin-2.0")

local Nauticus, NauticusFu = Nauticus, NauticusFu

local L = AceLibrary("AceLocale-2.2"):new("Nauticus")

local tablet = AceLibrary("Tablet-2.0")
local dewdrop = AceLibrary("Dewdrop-2.0")


function NauticusFu:OnInitialize()
	self.db = Nauticus:AcquireDBNamespace("fubar")
	self.hasIcon = true
	self.title = "Nauticus"
	self:SetIcon(ARTWORK_LOGO)
	self.hideWithoutStandby = true
	self.independentProfile = true
end

function NauticusFu:OnTooltipUpdate()
	Nauticus:ShowTooltip(Nauticus.activeTransit)
    tablet:SetHint(L["Click to cycle transport.|nAlt-Click to set up alarm"])
end

function NauticusFu:OnMenuRequest(level, value, inTooltip)
	if inTooltip then return end
	Nauticus:ShowMenu()
end

function NauticusFu:OnTextUpdate()
	local icon, text = Nauticus:GetButtonIconText()
	self:SetIcon(icon); self:SetText(text)
end

function NauticusFu:OnClick()
	Nauticus:Button_OnClick()
end
