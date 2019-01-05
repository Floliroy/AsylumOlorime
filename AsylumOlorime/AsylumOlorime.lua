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
	DPS1 = "@Floliroy",
	DPS2 = "@everyone",
	DPS3 = "@everyone",
	DPS4 = "@everyone",
	DPS5 = "@everyone",
	DPS6 = "@everyone",
	DPS7 = "@everyone",
	DPS8 = "@everyone",
	ColorRGB = {0.58, 0.52, 0.02, 1}
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
			text = "Just set the @name of your 8 DDs.",
		},
		[3] = {
			type = "editbox",
			name = "DD Position 1",
			tooltip = "The @name of the DD in position 1",
			default = AsylumOlorime.Default.DPS1,
			getFunc = function() return AsylumOlorime.savedVariables.DPS1 end,
			setFunc = function(newValue) 
				AsylumOlorime.savedVariables.DPS1 = newValue
				AsylumOlorime.DPS1 = newValue
				end,
	   },
	   [4] = {
            type = "editbox",
            name = "DD Position 2",
			tooltip = "The @name of the DD in position 2",
			default = AsylumOlorime.Default.DPS2,
            getFunc = function() return AsylumOlorime.savedVariables.DPS2 end,
			setFunc = function(newValue) 
				AsylumOlorime.savedVariables.DPS2 = newValue
				AsylumOlorime.DPS2 = newValue
				end,
		},
		[5] = {
			type = "editbox",
			name = "DD Position 3",
			tooltip = "The @name of the DD in position 3",
			default = AsylumOlorime.Default.DPS3,
			getFunc = function() return AsylumOlorime.savedVariables.DPS3 end,
			setFunc = function(newValue) 
				AsylumOlorime.savedVariables.DPS3 = newValue
				AsylumOlorime.DPS3 = newValue
				end,
		},
	   [6] = {
			type = "editbox",
			name = "DD Position 4",
			tooltip = "The @name of the DD in position 4",
			default = AsylumOlorime.Default.DPS4,
			getFunc = function() return AsylumOlorime.savedVariables.DPS4 end,
			setFunc = function(newValue) 
				AsylumOlorime.savedVariables.DPS4 = newValue
				AsylumOlorime.DPS4 = newValue
				end,
		},
		[7] = {
			type = "editbox",
			name = "DD Position 5",
			tooltip = "The @name of the DD in position 5",
			default = AsylumOlorime.Default.DPS5,
			getFunc = function() return AsylumOlorime.savedVariables.DPS5 end,
			setFunc = function(newValue) 
				AsylumOlorime.savedVariables.DPS5 = newValue
				AsylumOlorime.DPS5 = newValue
				end,
	   },
	   [8] = {
            type = "editbox",
            name = "DD Position 6",
			tooltip = "The @name of the DD in position 6",
			default = AsylumOlorime.Default.DPS6,
            getFunc = function() return AsylumOlorime.savedVariables.DPS6 end,
			setFunc = function(newValue) 
				AsylumOlorime.savedVariables.DPS6 = newValue
				AsylumOlorime.DPS6 = newValue
				end,
		},
		[9] = {
			type = "editbox",
			name = "DD Position 7",
			tooltip = "The @name of the DD in position 7",
			default = AsylumOlorime.Default.DPS7,
			getFunc = function() return AsylumOlorime.savedVariables.DPS7 end,
			setFunc = function(newValue) 
				AsylumOlorime.savedVariables.DPS7 = newValue
				AsylumOlorime.DPS7 = newValue
				end,
		},
	   [10] = {
			type = "editbox",
			name = "DD Position 8",
			tooltip = "The @name of the DD in position 8",
			default = AsylumOlorime.Default.DPS8,
			getFunc = function() return AsylumOlorime.savedVariables.DPS8 end,
			setFunc = function(newValue) 
				AsylumOlorime.savedVariables.DPS8 = newValue
				AsylumOlorime.DPS8 = newValue
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

	for playerID = 1, GetGroupSize() do
		--right DDs
		if (GetUnitDisplayName(GetGroupUnitTagByIndex(playerID)) == AsylumOlorime.DPS1) then
			for i=1,GetNumBuffs(GetGroupUnitTagByIndex(playerID)) do
				local buffName, timeStarted, timeEnding, buffSlot, stackCount, iconFilename, buffType, effectType, abilityType, statusEffectType, abilityId, canClickOff, castByPlayer = GetUnitBuffInfo(GetGroupUnitTagByIndex(playerID),i)
				if ((abilityId == 109994) or (abilityId == 110020)) then
					right = right + 1.9
				end
			end
		end
		if (GetUnitDisplayName(GetGroupUnitTagByIndex(playerID)) == AsylumOlorime.DPS2) then
			for i=1,GetNumBuffs(GetGroupUnitTagByIndex(playerID)) do
				local buffName, timeStarted, timeEnding, buffSlot, stackCount, iconFilename, buffType, effectType, abilityType, statusEffectType, abilityId, canClickOff, castByPlayer = GetUnitBuffInfo(GetGroupUnitTagByIndex(playerID),i)
				if ((abilityId == 109994) or (abilityId == 110020)) then
					right = right + 1.6
				end
			end
		end
		if (GetUnitDisplayName(GetGroupUnitTagByIndex(playerID)) == AsylumOlorime.DPS3) then
			for i=1,GetNumBuffs(GetGroupUnitTagByIndex(playerID)) do
				local buffName, timeStarted, timeEnding, buffSlot, stackCount, iconFilename, buffType, effectType, abilityType, statusEffectType, abilityId, canClickOff, castByPlayer = GetUnitBuffInfo(GetGroupUnitTagByIndex(playerID),i)
				if ((abilityId == 109994) or (abilityId == 110020)) then
					right = right + 1.3
				end
			end
		end
		if (GetUnitDisplayName(GetGroupUnitTagByIndex(playerID)) == AsylumOlorime.DPS4) then
			for i=1,GetNumBuffs(GetGroupUnitTagByIndex(playerID)) do
				local buffName, timeStarted, timeEnding, buffSlot, stackCount, iconFilename, buffType, effectType, abilityType, statusEffectType, abilityId, canClickOff, castByPlayer = GetUnitBuffInfo(GetGroupUnitTagByIndex(playerID),i)
				if ((abilityId == 109994) or (abilityId == 110020)) then
					right = right + 1
				end
			end
		end
		--left DDs
		if (GetUnitDisplayName(GetGroupUnitTagByIndex(playerID)) == AsylumOlorime.DPS5) then
			for i=1,GetNumBuffs(GetGroupUnitTagByIndex(playerID)) do
				local buffName, timeStarted, timeEnding, buffSlot, stackCount, iconFilename, buffType, effectType, abilityType, statusEffectType, abilityId, canClickOff, castByPlayer = GetUnitBuffInfo(GetGroupUnitTagByIndex(playerID),i)
				if ((abilityId == 109994) or (abilityId == 110020)) then
					left = left + 1
				end
			end
		end
		if (GetUnitDisplayName(GetGroupUnitTagByIndex(playerID)) == AsylumOlorime.DPS6) then
			for i=1,GetNumBuffs(GetGroupUnitTagByIndex(playerID)) do
				local buffName, timeStarted, timeEnding, buffSlot, stackCount, iconFilename, buffType, effectType, abilityType, statusEffectType, abilityId, canClickOff, castByPlayer = GetUnitBuffInfo(GetGroupUnitTagByIndex(playerID),i)
				if ((abilityId == 109994) or (abilityId == 110020)) then
					left = left + 1.3
				end
			end
		end
		if (GetUnitDisplayName(GetGroupUnitTagByIndex(playerID)) == AsylumOlorime.DPS7) then
			for i=1,GetNumBuffs(GetGroupUnitTagByIndex(playerID)) do
				local buffName, timeStarted, timeEnding, buffSlot, stackCount, iconFilename, buffType, effectType, abilityType, statusEffectType, abilityId, canClickOff, castByPlayer = GetUnitBuffInfo(GetGroupUnitTagByIndex(playerID),i)
				if ((abilityId == 109994) or (abilityId == 110020)) then
					left = left + 1.6
				end
			end
		end
		if (GetUnitDisplayName(GetGroupUnitTagByIndex(playerID)) == AsylumOlorime.DPS8) then
			for i=1,GetNumBuffs(GetGroupUnitTagByIndex(playerID)) do
				local buffName, timeStarted, timeEnding, buffSlot, stackCount, iconFilename, buffType, effectType, abilityType, statusEffectType, abilityId, canClickOff, castByPlayer = GetUnitBuffInfo(GetGroupUnitTagByIndex(playerID),i)
				if ((abilityId == 109994) or (abilityId == 110020)) then
					left = left + 1.9
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
	AsylumOlorime.DPS1 = AsylumOlorime.savedVariables.DPS1
	AsylumOlorime.DPS2 = AsylumOlorime.savedVariables.DPS2
	AsylumOlorime.DPS3 = AsylumOlorime.savedVariables.DPS3
	AsylumOlorime.DPS4 = AsylumOlorime.savedVariables.DPS4
	AsylumOlorime.DPS5 = AsylumOlorime.savedVariables.DPS5
	AsylumOlorime.DPS6 = AsylumOlorime.savedVariables.DPS6
	AsylumOlorime.DPS7 = AsylumOlorime.savedVariables.DPS7
	AsylumOlorime.DPS8 = AsylumOlorime.savedVariables.DPS8
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