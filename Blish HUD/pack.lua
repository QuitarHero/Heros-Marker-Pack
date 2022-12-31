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
function combatFade(marker)
    return Mumble.PlayerCharacter.IsInCombat
end

--This is for W5's Statue of Darkness's Light Throwing Spawn Markers
--so they disappear when on Dhuum's arena
function heightFade(marker)
    if(Mumble.PlayerCharacter.Position.Z > marker.Position.Z+30) then
        return true
    end
end