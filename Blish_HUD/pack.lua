HMP = {}
HMP.HTcmSim = {}
HMPphysics = {}
hmpMaps = {
  {1428, 1432, 1437, 1450, 1451, 1485}, -- Arborstone, EoD Strikes
  {1370, 1332, 1346, 1339, 1341, 1359, 1374}, -- Eye of the North, IBS Strikes
  {1155, 1062, 1149, 1156, 1188, 1264, 1303, 1323}, -- LAA, Raids
}
LoadLoc = { "scripts/General/", "scripts/Educational/", "scripts/Utility/", "scripts/Schedule/", "scripts/Simulation/" }

if(not Mumble.IsAvailable) then Debug:Error("Hero's Pack: Mumble API unavailable, script load aborted.")
else
  local map, files = Mumble.CurrentMap.Id, nil
  
  --Raid Scripts
  if(map == hmpMaps[3][1]) then
    Pack:Require(LoadLoc[3] .. "Time")
    files = { "LAA-Fade", "W6-WeeklyEvent" }
    for i = 1, #files do Pack:Require(LoadLoc[1] .. files[i]) end
  else
    for _,v in ipairs(hmpMaps[3]) do
      if(map == v and map == hmpMaps[3][2]) then Pack:Require("scripts/Compass/W1B4-Compass")
      if(map == hmpMaps[3][7]) then Pack:Require(LoadLoc[3] .. "Time") Pack:Require(LoadLoc[1] .. "W6-WeeklyEvent") Pack:Require(LoadLoc[3] .. "Animate") Pack:Require(LoadLoc[1] .. "W6_B2-Aide") end
    end
  end
  
  --End of Dragons' Strike Scripts
  if(map == hmpMaps[1][1]) then Pack:Require(LoadLoc[3] .. "Time") Pack:Require(LoadLoc[4] .. "EoD Strikes")
  else
    for _,v in ipairs(hmpMaps[1]) do
      if(map == v and map == hmpMaps[1][3]) then --Harvest Temple
        files = { c1 = { "Throw Helper", "StrB10_D2_SafeSpot" },
          c2 = { "Animate", "Position" },
          c3 = { "HT-Main", "HT-General", "HT-Enemies", "HT-P1", "HT-D1", "HT-D2", "HT-D3", "HT-P2", "HT-D4", "HT-D4-Practice", "HT-D5", "HT-P3", "HT-D6", "HT-P4" },
        }
        for i = 1, #files.c1 do Pack:Require(LoadLoc[1] .. files.c1[i]) end
        for i = 1, #files.c2 do Pack:Require(LoadLoc[3] .. files.c2[i]) end
        for i = 1, #files.c3 do Pack:Require(LoadLoc[5] .. files.c3[i]) end
      end
      --This must always be last if meeting above condition
      if(map == v) then
        Pack:Require(LoadLoc[3] .. "Time")
        Pack:Require(LoadLoc[4] .. "EoD Strikes")
        break
      end
    end
  end
  
  --Icebrood Saga Strike Scripts
  if(map == hmpMaps[2][1]) then Pack:Require(LoadLoc[3] .. "Time") Pack:Require(LoadLoc[4] .. "Icebrood Saga")
  else
    for _,v in ipairs(hmpMaps[2]) do
      if(map == v) then Pack:Require(LoadLoc[3] .. "Time") Pack:Require(LoadLoc[4] .. "Icebrood Saga") break end
    end
  end
  
  --For use with the script-filter attribute
  function combatFade(marker) return Mumble.PlayerCharacter.IsInCombat end
  function onlyCombatFade(marker) if(not Mumble.PlayerCharacter.IsInCombat) then return true end end
  --This is for annoying markers that need to disappear when they should
  function heightFade(marker) if(Mumble.PlayerCharacter.Position.Z > marker.Position.Z+20) then return true end end
end