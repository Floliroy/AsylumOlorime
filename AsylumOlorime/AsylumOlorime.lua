local LAM2 = LibStub:GetLibrary("LibAddonMenu-2.0")
-----------------
---- Globals ----
-----------------
AsylumOlorime = {}
AsylumOlorime.name = "AsylumOlorime"
AsylumOlorime.version = "1.0"

---------------------------
---- Variables Default ----
---------------------------


AsylumOlorime.Default = {
	OffsetX = 510,
    OffsetY = 240,
	ColorRGB = {0, 1, 0, 1},
	DPS = {	[1] = "@Floliroy",
			[2] = "@everyone",
			[3] = "@everyone",
			[4] = "@everyone",
			[5] = "@everyone",
			[6] = "@everyone",
			[7] = "@everyone",
			[8] = "@everyone",
	},
}

-------------------------
---- Settings Window ----
-------------------------
function AsylumOlorime.CreateSettingsWindow()
	local panelData = {
		type = "panel",
		name = "AsylumOlorime",
		displayName = "Asylum Olorime",
		author = "Floliroy",
		version = AsylumOlorime.version,
		slashCommand = "/asolo",
		registerForRefresh = true,
		registerForDefaults = true,
	}
	
	local cntrlOptionsPanel = LAM2:RegisterAddonPanel("AsylumOlorime_Settings", panelData)
	
	local optionsData = {
		[1] = {
			type = "header",
			name = "Asylum Olorime Settings",
		},
		[2] = {
			type = "description",
			text = "Just set the @name of your 8 DDs.\n\r Position 1 is entrance, position 8 is exit.",
		},
		[3] = {
			type = "editbox",
			name = "DD Position 1",
			tooltip = "The @name of the DD in position 1",
			default = AsylumOlorime.Default.DPS[1],
			getFunc = function() return AsylumOlorime.savedVariables.DPS[1] end,
			setFunc = function(newValue) 
				AsylumOlorime.savedVariables.DPS[1] = newValue
				AsylumOlorime.DPS[1] = newValue
				end,
	   },
	   [4] = {
            type = "editbox",
            name = "DD Position 2",
			tooltip = "The @name of the DD in position 2",
			default = AsylumOlorime.Default.DPS[2],
            getFunc = function() return AsylumOlorime.savedVariables.DPS[2] end,
			setFunc = function(newValue) 
				AsylumOlorime.savedVariables.DPS[2] = newValue
				AsylumOlorime.DPS[2] = newValue
				end,
		},
		[5] = {
			type = "editbox",
			name = "DD Position 3",
			tooltip = "The @name of the DD in position 3",
			default = AsylumOlorime.Default.DPS[3],
			getFunc = function() return AsylumOlorime.savedVariables.DPS[3] end,
			setFunc = function(newValue) 
				AsylumOlorime.savedVariables.DPS[3] = newValue
				AsylumOlorime.DPS[3] = newValue
				end,
		},
	   [6] = {
			type = "editbox",
			name = "DD Position 4",
			tooltip = "The @name of the DD in position 4",
			default = AsylumOlorime.Default.DPS[4],
			getFunc = function() return AsylumOlorime.savedVariables.DPS[4] end,
			setFunc = function(newValue) 
				AsylumOlorime.savedVariables.DPS[4] = newValue
				AsylumOlorime.DPS[4] = newValue
				end,
		},
		[7] = {
			type = "editbox",
			name = "DD Position 5",
			tooltip = "The @name of the DD in position 5",
			default = AsylumOlorime.Default.DPS[5],
			getFunc = function() return AsylumOlorime.savedVariables.DPS[5] end,
			setFunc = function(newValue) 
				AsylumOlorime.savedVariables.DPS[5] = newValue
				AsylumOlorime.DPS[5] = newValue
				end,
	   },
	   [8] = {
            type = "editbox",
            name = "DD Position 6",
			tooltip = "The @name of the DD in position 6",
			default = AsylumOlorime.Default.DPS[6],
            getFunc = function() return AsylumOlorime.savedVariables.DPS[6] end,
			setFunc = function(newValue) 
				AsylumOlorime.savedVariables.DPS[6] = newValue
				AsylumOlorime.DPS[6] = newValue
				end,
		},
		[9] = {
			type = "editbox",
			name = "DD Position 7",
			tooltip = "The @name of the DD in position 7",
			default = AsylumOlorime.Default.DPS[7],
			getFunc = function() return AsylumOlorime.savedVariables.DPS[7] end,
			setFunc = function(newValue) 
				AsylumOlorime.savedVariables.DPS[7] = newValue
				AsylumOlorime.DPS[7] = newValue
				end,
		},
	   [10] = {
			type = "editbox",
			name = "DD Position 8",
			tooltip = "The @name of the DD in position 8",
			default = AsylumOlorime.Default.DPS[8],
			getFunc = function() return AsylumOlorime.savedVariables.DPS[8] end,
			setFunc = function(newValue) 
				AsylumOlorime.savedVariables.DPS[8] = newValue
				AsylumOlorime.DPS[8] = newValue
				end,
		},
		[11] = {
			type = "colorpicker",
			name = "Alert Color",
			getFunc = function() return unpack(AsylumOlorime.savedVariables.ColorRGB) end,
			setFunc = function(r,g,b,a)
				AsylumOlorime.savedVariables.ColorRGB = {r,g,b,a}
				AsylumOlorimeFight:SetColor(unpack(AsylumOlorime.savedVariables.ColorRGB))
			end,
		},
	}
	
	LAM2:RegisterOptionControls("AsylumOlorime_Settings", optionsData)
end

----------------
---- UPDATE ----
----------------

function AsylumOlorime.Update()

	local left = 0;
	local right = 0;

	--d(GetUnitName(AsylumOlorime.DPS[1]))

	for playerID = 1, GetGroupSize() do
		for numDD = 1, 8 do 
			if (GetUnitDisplayName(GetGroupUnitTagByIndex(playerID)) == AsylumOlorime.DPS[numDD]) then
				for i = 1,GetNumBuffs(GetGroupUnitTagByIndex(playerID)) do
					local buffName, timeS	tarted, timeEnding, buffSlot, stackCount, iconFilename, buffType, effectType, abilityType, statusEffectType, abilityId, canClickOff, castByPlayer = GetUnitBuffInfo(GetGroupUnitTagByIndex(playerID),i)
					if ((abilityId == 109994) or (abilityId == 110020)) then
						if numDD == 1 then
							right = right + 1.9
						elseif numDD == 2 then
							right = right + 1.6
						elseif numDD == 3 then
							right = right + 1.3
						elseif numDD == 4 then
							right = right + 1
						elseif numDD == 5 then
							left = left + 1
						elseif numDD == 6 then
							left = left + 1.3
						elseif numDD == 7 then
							left = left + 1.6
						elseif numDD == 8 then
							left = left + 1.9
						end
					end
				end
			end
		end
	end

	local positionAlert = "Set Alert Position"

	if right > left then
		AsylumOlorimeAlert:SetHidden(false)
		positionAlert = "Left"
	elseif right < left then
		AsylumOlorimeAlert:SetHidden(false)
		positionAlert = "Right"
	elseif right == left then 
		AsylumOlorimeAlert:SetHidden(false)
		positionAlert = "Middle"
	end

	AsylumOlorimeFight:SetText(string.format("%s", positionAlert))

end
 
function AsylumOlorime:Initialize()
	--Settings
	AsylumOlorime.CreateSettingsWindow()
	
	--Saved Variables
	AsylumOlorime.savedVariables = ZO_SavedVars:New("AsylumOlorimeVariables", 1, nil, AsylumOlorime.Default)
	EVENT_MANAGER:UnregisterForEvent(AsylumOlorime.name, EVENT_ADD_ON_LOADED)
	
	--UI
	AsylumOlorimeAlert:SetHidden(true)
	AsylumOlorimeAlert:ClearAnchors()
	AsylumOlorimeAlert:SetAnchor(TOPLEFT, GuiRoot, TOPLEFT, AsylumOlorime.savedVariables.OffsetX, AsylumOlorime.savedVariables.OffsetY)
	
	AsylumOlorimeFight:SetColor(unpack(AsylumOlorime.savedVariables.ColorRGB))
	AsylumOlorime.AlwaysShowAlert = AsylumOlorime.savedVariables.AlwaysShowAlert
	EVENT_MANAGER:UnregisterForEvent(AsylumOlorime.name, EVENT_ADD_ON_LOADED)
	
	--Update
	AsylumOlorime.DPS = AsylumOlorime.savedVariables.DPS

	EVENT_MANAGER:RegisterForUpdate(AsylumOlorime.name, 250, AsylumOlorime.Update)
	EVENT_MANAGER:UnregisterForEvent(AsylumOlorime.name, EVENT_ADD_ON_LOADED)
	
end

function AsylumOlorime.SaveLoc()
	AsylumOlorime.savedVariables.OffsetX = AsylumOlorimeAlert:GetLeft()
	AsylumOlorime.savedVariables.OffsetY = AsylumOlorimeAlert:GetTop()
end	
 
function AsylumOlorime.OnAddOnLoaded(event, addonName)
	if addonName ~= AsylumOlorime.name then return end
		AsylumOlorime:Initialize()
end

EVENT_MANAGER:RegisterForEvent(AsylumOlorime.name, EVENT_ADD_ON_LOADED, AsylumOlorime.OnAddOnLoaded)