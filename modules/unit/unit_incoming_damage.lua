--[[
Unit Incoming Damage: Functions which handle incoming damage or healing
]]--
local Unit = kps.Unit.prototype

local incomingTimeRange = 4
local moduleLoaded = false


-- incomingDamage
local incomingDamage = {}
local updateincomingDamage = function(duration)
    for unit,index in pairs(incomingDamage) do
        local data = #index
        local delta = GetTime() - index[1][1]
        if delta > 5 then incomingDamage[unit] = nil end
    end
end

-- Incoming Heal
local incomingHeal = {}
local updateincomingHeal = function()
    for unit,index in pairs(incomingHeal) do
        local data = #index
        local delta = GetTime() - index[1][1]
        if delta > 5 then incomingHeal[unit] = nil end
    end
end




-------------------------------------------------------
-------- COMBAT_LOG_EVENT_UNFILTERED FUNCTIONS --------
-------------------------------------------------------

-- eventtable[1] == timestamp
-- eventtable[2] == combatEvent
-- eventtable[3] == hideCaster
-- eventtable[4] == sourceGUID
-- eventtable[5] == sourceName
-- eventtable[6] == sourceFlags
-- eventtable[7] == sourceFlags2
-- eventtable[8] == destGUID
-- eventtable[9] == destName
-- eventtable[10] == destFlags
-- eventtable[11] == destFlags2
-- eventtable[12] == spellID -- amount if prefix is SWING_DAMAGE
-- eventtable[13] == spellName -- amount if prefix is ENVIRONMENTAL_DAMAGE
-- eventtable[14] == spellSchool -- 1 Physical, 2 Holy, 4 Fire, 8 Nature, 16 Frost, 32 Shadow, 64 Arcane
-- eventtable[15] == amount if suffix is SPELL_DAMAGE or SPELL_HEAL -- spellHealed
-- eventtable[16] == spellCount if suffix is _AURA

-- for the SWING prefix, _DAMAGE starts at the 12th parameter.
-- for ENVIRONMENTAL prefix, _DAMAGE starts at the 13th.

local damageEvents = {
        ["SWING_DAMAGE"] = true,
        ["SPELL_DAMAGE"] = true,
        ["SPELL_PERIODIC_DAMAGE"] = true,
        ["RANGE_DAMAGE"] = true,
        ["ENVIRONMENTAL_DAMAGE"] = true,
}
local healEvents = {
        ["SPELL_HEAL"] = true,
        ["SPELL_PERIODIC_HEAL"] = true,
}

local RAID_AFFILIATION = bit.bor(COMBATLOG_OBJECT_AFFILIATION_PARTY, COMBATLOG_OBJECT_AFFILIATION_RAID, COMBATLOG_OBJECT_AFFILIATION_MINE)
local bitband = bit.band


local combatLogUpdate = function ( ... )
    local _, event, _, sourceGUID, sourceName, sourceFlags, _, destGUID, destName, destFlags, _, arg12, arg13, arg14, arg15 = CombatLogGetCurrentEventInfo()

    local isSourceEnemy = bitband(sourceFlags, COMBATLOG_OBJECT_REACTION_HOSTILE) == COMBATLOG_OBJECT_REACTION_HOSTILE
    local isDestEnemy = bitband(destFlags, COMBATLOG_OBJECT_REACTION_HOSTILE) == COMBATLOG_OBJECT_REACTION_HOSTILE
    local isSourceFriend = bitband(sourceFlags,COMBATLOG_OBJECT_REACTION_FRIENDLY) == COMBATLOG_OBJECT_REACTION_FRIENDLY
    local isDestFriend = bitband(destFlags,COMBATLOG_OBJECT_REACTION_FRIENDLY) == COMBATLOG_OBJECT_REACTION_FRIENDLY

    -- HEAL TABLE -- Incoming Heal on Enemy from Enemy Healers UnitGUID
    if healEvents[event] then
        if isDestEnemy and isSourceEnemy then
            local spellID = arg12
            local addEnemyHealer = false
            local classHealer = kps.spells.healer[spellID]
            if classHealer and UnitCanAttack("player",destName) then
                if EnemyHealer[sourceGUID] == nil then addEnemyHealer = true end
                if addEnemyHealer then EnemyHealer[sourceGUID] = {classHealer,sourceName} end
            end
        end

    -- HEAL TABLE -- Incoming Heal on Friend
        if isDestFriend and UnitCanAssist("player",destName) then
            local heal = arg15
            if incomingHeal[destGUID] == nil then incomingHeal[destGUID] = {} end
            tinsert(incomingHeal[destGUID],1,{GetTime(),heal,destName})
        end
    end

    -- DAMAGE TABLE Note that for the SWING prefix, _DAMAGE starts at the 12th parameter
    if damageEvents[event] then
        if isDestFriend and UnitCanAssist("player",destName) then
            local damage = 0
            local swingdmg = 0
            local spelldmg = 0
            local envdmg = 0
            if event == "SWING_DAMAGE" then
                local dmg = arg12
                if dmg == nil then dmg = 0 end
                swingdmg = dmg
            else
                local dmg = arg15
                if dmg == nil then dmg = 0 end
                spelldmg = dmg
            end
            if event == "ENVIRONMENTAL_DAMAGE" then
                local env = arg13
                if env == nil then env = 0 end
                envdmg = env
            end
            damage = swingdmg + spelldmg + envdmg

            -- Table of Incoming Damage on Friend
            if incomingDamage[destGUID] == nil then incomingDamage[destGUID] = {} end
            table.insert(incomingDamage[destGUID],1,{GetTime(),damage,destName})
        end
    end
end


local function loadOnDemand()
    if not moduleLoaded then
        kps.events.registerOnUpdate(function()
            kps.utils.cachedFunction(updateincomingHeal,1)
            kps.utils.cachedFunction(updateincomingDamage,1)
        end)
        kps.events.register("COMBAT_LOG_EVENT_UNFILTERED", combatLogUpdate)
        moduleLoaded = true
    end
end


--[[[
@function `<UNIT>.incomingDamage` - returns incoming damage of the unit over last 4 seconds
]]--
function Unit.incomingDamage(self)
    loadOnDemand()
    local totalDamage = 0
    if incomingDamage[self.guid] ~= nil then
        local dataset = incomingDamage[self.guid]
        if #dataset > 1 then
            local timeDelta = dataset[1][1] - dataset[#dataset][1] -- (lasttime - firsttime)
            local totalTime = math.max(timeDelta, 1)
            if incomingTimeRange > totalTime then incomingTimeRange = totalTime end
            for i=1,#dataset do
                if dataset[1][1] - dataset[i][1] <= incomingTimeRange then
                    totalDamage = totalDamage + dataset[i][2]
                end
            end
        end
    end
    return totalDamage
end

--[[[
@function `<UNIT>.incomingHeal` - returns incoming heal of the unit over last 4 seconds
]]--
function Unit.incomingHeal(self)
    loadOnDemand()
    local totalHeal = 0
    if incomingHeal[self.guid] ~= nil then
        local dataset = incomingHeal[self.guid]
        if #dataset > 1 then
            local timeDelta = dataset[1][1] - dataset[#dataset][1] -- (lasttime - firsttime)
            local totalTime = math.max(timeDelta, 1)
            if incomingTimeRange > totalTime then incomingTimeRange = totalTime end
                for i=1,#dataset do
                    if dataset[1][1] - dataset[i][1] <= incomingTimeRange then
                    totalHeal = totalHeal + dataset[i][2]
                end
            end
        end
    end
    return totalHeal
end
