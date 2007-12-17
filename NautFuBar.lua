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

NauticusFu = AceLibrary("AceAddon-2.0"):new("FuBarPlugin-2.0")

local Nauticus, NauticusFu = Nauticus, NauticusFu

local L = AceLibrary("AceLocale-2.2"):new("Nauticus")

local tablet = AceLibrary("Tablet-2.0")

local dewdrop = AceLibrary("Dewdrop-2.0")

local transports, transitData =
	Nauticus.transports, Nauticus.transitData

-- constants
local ARTWORKPATH = "Interface\\AddOns\\Nauticus\\Artwork\\"


function NauticusFu:OnInitialize()
	self.db = Nauticus:AcquireDBNamespace("fubar")
	self.hasIcon = true
	self.title = "Nauticus"
	self:SetIcon(ARTWORKPATH.."NauticusLogo")
	self.hideWithoutStandby = true
	self.independentProfile = true
end

function NauticusFu:IsFactionSpecific()
    return Nauticus:IsFactionSpecific()
end

function NauticusFu:ToggleFaction()
    Nauticus:ToggleFaction()
    self:Update()
end

function NauticusFu:IsZoneSpecific()
    return Nauticus:IsZoneSpecific()
end

function NauticusFu:ToggleZone()
    Nauticus:ToggleZone()
    self:Update()
end

function NauticusFu:OnTooltipUpdate()
	Nauticus:ShowTooltip(Nauticus.activeTransit)
    tablet:SetHint(L["Click to cycle transport.|nAlt-Click to set up alarm"])
end

function NauticusFu:OnMenuRequest(level, value, inTooltip)

	if inTooltip then return end

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
		'checked', (Nauticus.activeTransit == -1),
		'func', function() self:SetTransport(0) end
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
				'func', function(i) self:SetTransport(i) end,
				'arg1', i
			)
		end
	end

	dewdrop:AddSeparator()

end

function NauticusFu:OnTextUpdate()
	if Nauticus:IsAlarmSet() then
		self:SetIcon("Interface\\Icons\\INV_Misc_PocketWatch_02")
	else
		self:SetIcon(ARTWORKPATH..Nauticus.icon)
	end

	if Nauticus.tempTextCount > 0 then
		Nauticus.tempTextCount = Nauticus.tempTextCount - 1
		return
	end

	self:SetText(Nauticus.lowestNameTime)
end

function NauticusFu:OnClick()

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
			self:SetText(Nauticus.tempText)
		end

		return
	end

	Nauticus.activeTransit = Nauticus:GetNextShownRoute()
	Nauticus.db.char.activeTransit = Nauticus.activeTransit

	-- set temporary button text so you know which one is currently selected
	if Nauticus:HasKnownCycle(Nauticus.activeTransit) then
		Nauticus.tempText = GREEN..transports[Nauticus.lookupIndex[Nauticus.activeTransit]].name
		Nauticus.tempTextCount = 2
		self:SetText(Nauticus.tempText)
	end

	Nauticus:TransportSelectSetNone()

end

function NauticusFu:SetTransport(id)
	Nauticus.activeTransit = transports[id].label
	Nauticus.db.char.activeTransit = Nauticus.activeTransit

	if Nauticus:HasKnownCycle(Nauticus.activeTransit) then
		Nauticus.tempText = GREEN..transports[id].name
		Nauticus.tempTextCount = 2
		self:SetText(Nauticus.tempText)
	end

	Nauticus:TransportSelectSetNone()
end
