HMP = {}
HMP.HTcmSim = {}
HMPphysics = {}
hmpMaps = {
  --Arbr, Aeth, XJJ,  Kain, Harv, OLC,   CO,  Febe
  {1428, 1432, 1450, 1451, 1437, 1485, 1515, 1520},
 --EotN, Shvr, KBro, FoJ,  Bone, WoJ,  CWar
  {1370, 1332, 1346, 1341, 1339, 1359, 1374},
 --LAA,   W1,   W2,   W3,   W4,   W5,   W6,   W7
  {1155, 1062, 1149, 1156, 1188, 1264, 1303, 1323},
 --AeB, AqR, CMT, Caos, Clf, Deep, MlO, Bos, Fur, Ntmr, Shat, Surf, Reef, Sno, SoO, Peak, SwL, ThR, TwOa, Unc, UnF, UBg, Vol
  {956, 951, 960, 1164, 952, 1290, 872, 959, 955, 1177, 1205, 1500, 1309, 948, 958, 1384, 949, 957, 1267, 947, 953, 950, 954},
 --AC, 
  {36, 0}
}
Dir = { "scripts/General/", "scripts/Educational/", "scripts/Utility/",
  "scripts/Schedule/", "scripts/Simulation/", "scripts/Compass/" }

--Info Category Loading
for i = 1, #hmpMaps do for k = 1, #hmpMaps[i] do if( Mumble.CurrentMap.Id == hmpMaps[i][k] ) then Pack:Require(Dir[1] .. "MenuInfo") break end end end
  
if(not Mumble.IsAvailable) then Debug:Error("Hero's Pack: Mumble API unavailable, script load aborted.")
elseif( not HMP_GetBool("PackScriptToggle") ) then Debug:Error("Hero's Pack: Main Script loading aborted on user preference.")
else
  local map = Mumble.CurrentMap.Id
  
  -- ========== Raid Scripts ==========
  if( map == hmpMaps[3][1] ) then Pack:Require(Dir[3] .. "Time") Pack:Require(Dir[1] .. "LAA-Fade") Pack:Require(Dir[1] .. "W6-WeeklyEvent") end
  if( map == hmpMaps[3][2] ) then Pack:Require(Dir[3] .. "Countdown") Pack:Require(Dir[6] .. "W1B4-Compass") end
  if( map == hmpMaps[3][7] ) then Pack:Require(Dir[3] .. "Time" ) Pack:Require(Dir[1] .. "W6-WeeklyEvent") Pack:Require(Dir[3] .. "Animate") Pack:Require(Dir[1] .. "W6B2-Aide") end
  --if( map == hmpMaps[3][8] ) then Pack:Require(Dir[2] .. "W7B4 - Q2") end
  -- ========== End of Dragons' Strike Scripts ==========
  for i = 1, #hmpMaps[1] do if( map == hmpMaps[1][i] ) then Pack:Require(Dir[3] .. "Time") Pack:Require(Dir[4] .. "EoD Strikes") break end end
  if( map == hmpMaps[1][5] ) then
    local files = { { "Throw Helper", "StrB10_D2_SafeSpot" },
      { "Animate", "Position" },
      { "HT-Main", "HT-General", "HT-Enemies", "HT-P1", "HT-D1", "HT-D2", "HT-D3", "HT-P2", "HT-D4", "HT-D4-Practice", "HT-D5", "HT-P3", "HT-D6", "HT-P4" },
    }
    for i = 1, #files[1] do Pack:Require(Dir[1] .. files[1][i]) end
    for i = 1, #files[2] do Pack:Require(Dir[3] .. files[2][i]) end
    for i = 1, #files[3] do Pack:Require(Dir[5] .. files[3][i]) end
  end
  -- ========== Icebrood Saga Strike Scripts ==========
  for i = 1, #hmpMaps[2] do if( map == hmpMaps[2][i] ) then Pack:Require(Dir[3] .. "Time") Pack:Require(Dir[4] .. "Icebrood Saga") break end end
  
  --For use with the script-filter attribute
  function combatFade(marker) return Mumble.PlayerCharacter.IsInCombat end
  function onlyCombatFade(marker) if(not Mumble.PlayerCharacter.IsInCombat) then return true end end
  --This is for annoying markers that need to disappear when they should
  function heightFade(marker) if(Mumble.PlayerCharacter.Position.Z > marker.Position.Z+20) then return true end end
end