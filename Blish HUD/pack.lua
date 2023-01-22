HMP = {
  publicFunctions = {
    getUtcTime = function (interval, addTime)
      local delay = 64
      local Year, Month, Day, Hour, Min, Sec = tonumber(os.date("!%Y")), tonumber(os.date("!%m")), tonumber(os.date("!%d")), tonumber(os.date("!%H")), tonumber(os.date("!%M")), tonumber(os.date("!%S"))
      local utcTime   = os.time{year=Year, month=Month, day=Day, hour=Hour, min=Min, sec=Sec}
      local totalDays = math.floor((utcTime - addTime + delay) / 86400)
      local remainder = math.fmod(totalDays, interval)
      return remainder
    end
  }
}
hmpMaps = {
  eodStrikes = {1432, 1437, 1450, 1451, 1485},
  eodLobby   = 1428,
  ibsStrikes = {1332, 1346, 1339, 1341, 1359, 1374},
  ibsLobby   = 1370,
  raids      = {1062, 1149, 1156, 1188, 1264, 1303, 1323},
  raidLobby  = 1155
}
currentMap = Mumble.CurrentMap.Id

--Raid Scripts
if(currentMap == hmpMaps.raidLobby) then
  Pack:Require("scripts/aerodomeFading.lua")
  Pack:Require("scripts/W6weeklySorting.lua")
end
if(currentMap == hmpMaps.raids[6]) then
  Pack:Require("scripts/W6weeklySorting.lua")
end

--End of Dragons' Strike Scripts
if(currentMap == hmpMaps.eodLobby) then
  Pack:Require("scripts/strikeSchedule.lua")
else
  for _,v in ipairs(hmpMaps.eodStrikes) do
    if(currentMap == v and currentMap == hmpMaps.eodStrikes[2]) then
      Pack:Require("scripts/revHammer.lua")
    end
    if(currentMap == v) then --This must always be last if meeting above condition
      Pack:Require("scripts/strikeSchedule.lua")
      break
    end
  end
end
--For use with the script-filter attribute
function combatFade(marker) return Mumble.PlayerCharacter.IsInCombat end
--This is for annoying markers that need to disappear when they should
function heightFade(marker)
  if(Mumble.PlayerCharacter.Position.Z > marker.Position.Z+20) then return true end
end