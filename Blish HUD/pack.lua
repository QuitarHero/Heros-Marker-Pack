HSP = {}
HMP = {}

currentMap = Mumble.CurrentMap.Id

--Lion's Arch Aerodome Entrace Fading
if(currentMap == 1155) then
  Pack:Require("scripts/aerodomeFading.lua")
end

--For use with the script-filter attribute
function combatFade(marker)
  return Mumble.PlayerCharacter.IsInCombat
end

--This is for annoying markers that need to disappear when they should
function heightFade(marker)
  if(Mumble.PlayerCharacter.Position.Z > marker.Position.Z+30) then
    return true
  end
end