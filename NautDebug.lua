
local NautAstrolabe = DongleStub("Astrolabe-0.4")

-- calibration vars
local isCalib = false
local cal_x, cal_y = 0, 0
local cal_old_x, cal_old_y = 0, 0
local cal_stopped = false

Nauticus.options.args.debug = {
	type = 'group',
	name = "Debug",
	desc = "Debugging commands",
	cmdHidden = true,
	args = {
		toggle = {
			type = 'toggle',
			name = "Debug mode",
			desc = "Toggle on/off debug mode",
			get = function()
				return Nauticus.db.account.debug
			end,
			set = function(v)
				Nauticus.db.account.debug = v
				Nauticus.debug = v
			end,
		},
		calib = {
			type = 'toggle',
			name = "Calibration mode",
			desc = "Toggle on/off calibration mode",
			get = function()
				return isCalib
			end,
			set = function(v)
				if not Naut_DataTrackerFrame then
					local Naut_DataTrackerFrame = CreateFrame("Frame", "Naut_DataTrackerFrame", UIParent)
					Naut_DataTrackerFrame:SetFrameStrata("BACKGROUND")
				end
				if v then
					local c, z; c, z, cal_x, cal_y = NautAstrolabe:GetCurrentPlayerPosition()
					if cal_x then cal_x, cal_y = NautAstrolabe:TranslateWorldMapPosition(c, z, cal_x, cal_y, 0, 0); end
					cal_old_x, cal_old_y = cal_x, cal_y
					cal_stopped = true
					Naut_DataTrackerFrame:SetScript("OnUpdate",
						function (this, elapse) Nauticus:OnFrameUpdate(this, elapse) end)
				else
					Naut_DataTrackerFrame:SetScript("OnUpdate", nil)
				end
				isCalib = v
			end,
		},
		request = {
			type = 'execute',
			name = "Request transports",
			desc = "Request transports now",
			func = function()
				for index, data in pairs(Nauticus.transports) do
					if data.label ~= -1 then
						Nauticus.requestList[data.label] = true
					end
				end
				Nauticus:DoRequest()
			end
		},
		loc = {
			type = 'execute',
			name = "Store player coords",
			desc = "Get player coords and append to saved vars table",
			func = function()
				local c, z, x, y = NautAstrolabe:GetCurrentPlayerPosition()
				if not x then return; end
				x, y = NautAstrolabe:TranslateWorldMapPosition(c, z, x, y, 0, 0)
				if not x then return; end
				Nauticus:DebugMessage("x: "..x.." ; y: "..y)
				if not Nauticus.calibCoordCount then
					Nauticus.calibCoordCount = 0
					Nauticus.db.account.calibCoords = {}
				end
				Nauticus.calibCoordCount = Nauticus.calibCoordCount + 1
				Nauticus.db.account.calibCoords[Nauticus.calibCoordCount] = { ['x'] = x, ['y'] = y }
			end
		},
	}
}

-- calibration code executed each frame
function Nauticus:OnFrameUpdate(elapse)
	local now = GetTime()
	cal_old_x, cal_old_y = cal_x, cal_y

	local c, z; c, z, cal_x, cal_y = NautAstrolabe:GetCurrentPlayerPosition()
	if not cal_x then return; end
	cal_x, cal_y = NautAstrolabe:TranslateWorldMapPosition(c, z, cal_x, cal_y, 0, 0)
	if not cal_x or not cal_old_x then return; end

	-- rtt calib
	if cal_stopped and (cal_x ~= cal_old_x or cal_y ~= cal_old_y) then
		self:DebugMessage("Started @ "..now)
		cal_stopped = false
	end
end
