HSP = {}
HMP = {}

currentMap = Mumble.CurrentMap.Id

--End of Dragons' Strike Schedule Script
if(currentMap == 1428 or currentMap == 1432 or currentMap == 1450 or currentMap == 1451 or currentMap == 1437 or currentMap == 1485) then
  Pack:Require("scripts/strikeSchedule.lua")
end

--Lion's Arch Aerodome Entrace Fading
if(currentMap == 1155) then
  Pack:Require("scripts/aerodomeFading.lua")
end

--Mythwright Gambit's Weekly Event Script
if(currentMap == 1155 or currentMap == 1303) then
  Pack:Require("scripts/W6weeklySorting.lua")
end

--For use with the script-filter attribute
function combatFade(marker)
  return Mumble.PlayerCharacter.IsInCombat
end

--This is for annoying markers that need to disappear when they should
function heightFade(marker)
  if(Mumble.PlayerCharacter.Position.Z > marker.Position.Z+20) then
    return true
  end
end