HSP = {}
HSP = {}

--Harvest Temple Scripts
if(Mumble.CurrentMap.Id == 1437) then
    Pack:Require("scripts/revHammer.lua")
end

--Arborstone Scripts
if(Mumble.CurrentMap.Id == 1428) then
    Pack:Require("scripts/strikeSchedule.lua")
end

--For use with the script-filter attribute
function markerCombatFade(marker)
    return Mumble.PlayerCharacter.IsInCombat
end
function trailCombatFade(trail)
    return Mumble.PlayerCharacter.IsInCombat
end



