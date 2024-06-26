HMP = {}
HMP.HTcmSim = {}
HMPphysics = {}
HMPutility = {}
Utility = {}
Dir = { "scripts/General/", "scripts/Educational/", "scripts/Utility/",
  "scripts/Schedule/", "scripts/Simulation/", "scripts/Compass/" }
HMP.MapScripts = {
  -- Aetherblade Fractal ------------------ Aquatic Ruins Fractal ---------------- Captain Mai Trin Fractal ------------- Chaos Fractal ------------------------- Cliffside Fractal -------------------- Deepstone Fractal --------------------- Mistlock Observatory Fractal --------- Molten Boss Fractal ------------------ Molten Furnace Fractal --------------- Nightmare Fractal --------------------- Shattered Observatory Fractal --------- Silent Surf Fractal ------------------- Siren's Reef Fractal ------------------ Snowblind Fractal -------------------- Solid Ocean Fractal ------------------ Sunqua Peak Fractal ------------------- Swampland Fractal -------------------- Thaumanova Reactor Fractal ----------- The Lonely Tower Fractal -------------- Twilight Oasis Fractal ---------------- Uncategorized Fractal ---------------- Underground Facility Fractal --------- Urban Battlegrounds Fractal ---------- Volcanic Fractal
  { {956, {Dir[1] .. "Fractal_Slaying"} }, {951, {Dir[1] .. "Fractal_Slaying"} }, {960, {Dir[1] .. "Fractal_Slaying"} }, {1164, {Dir[1] .. "Fractal_Slaying"} }, {952, {Dir[1] .. "Fractal_Slaying"} }, {1290, {Dir[1] .. "Fractal_Slaying"} }, {872, {Dir[1] .. "Fractal_Slaying"} }, {959, {Dir[1] .. "Fractal_Slaying"} }, {955, {Dir[1] .. "Fractal_Slaying"} }, {1177, {Dir[1] .. "Fractal_Slaying"} }, {1205, {Dir[1] .. "Fractal_Slaying"} }, {1500, {Dir[1] .. "Fractal_Slaying"} }, {1309, {Dir[1] .. "Fractal_Slaying"} }, {948, {Dir[1] .. "Fractal_Slaying"} }, {958, {Dir[1] .. "Fractal_Slaying"} }, {1384, {Dir[1] .. "Fractal_Slaying"} }, {949, {Dir[1] .. "Fractal_Slaying"} }, {957, {Dir[1] .. "Fractal_Slaying"} }, {1538, {Dir[1] .. "Fractal_Slaying"} }, {1267, {Dir[1] .. "Fractal_Slaying"} }, {947, {Dir[1] .. "Fractal_Slaying"} }, {953, {Dir[1] .. "Fractal_Slaying"} }, {950, {Dir[1] .. "Fractal_Slaying"} }, {954, {Dir[1] .. "Fractal_Slaying"} } },
  -- Lion's Arch Aerodome --------------------------------------- Spirit Vale ----------------------------------------------- W2 ------------ W3 ------------ W4 ------------ W5 ------------ Mythwright Gambit -------------------------------------------- W7
  { {1155, {Dir[1] .. "LAA-Fade", Dir[1] .. "W6-WeeklyEvent"} }, {1062, {Dir[3] .. "Countdown", Dir[6] .. "W1B4-Compass"} }, {1149, {nil} }, {1156, {nil} }, {1188, {nil} }, {1264, {nil} }, {1303, {Dir[1] .. "W6-WeeklyEvent", Dir[1] .. "W6_B2-Aide"} }, {1323, {nil} } },
  -- Eye of the North -------------------- Icebrood Construct ------------------ Kodan Brothers ---------------------- Fraenir of Jormag ------------------- Boneskinner ------------------------- Whisper of Jormag ------------------- Cold War (Varina Stormsounder)
  { {1370, {Dir[4] .. "Icebrood Saga"} }, {1332, {Dir[4] .. "Icebrood Saga"} }, {1346, {Dir[4] .. "Icebrood Saga"} }, {1341, {Dir[4] .. "Icebrood Saga"} }, {1339, {Dir[4] .. "Icebrood Saga"} }, {1359, {Dir[4] .. "Icebrood Saga"} }, {1374, {Dir[4] .. "Icebrood Saga"} } },
  -- Arborstone ------------------------ Aetherblade Hideout --------------- Xunlai Jade Junkyard -------------- Kaineng Overlook ------------------ Harvest Temple ------------------------------------------------------------------------------------------------------ Old Lion's Court
  { {1428, {Dir[4] .. "EoD Strikes"} }, {1432, {Dir[4] .. "EoD Strikes"} }, {1450, {Dir[4] .. "EoD Strikes"} }, {1451, {Dir[4] .. "EoD Strikes"} }, {1437, {Dir[3] .. "Throw Helper", Dir[1] .. "StrB10_D2_SafeSpot", Dir[1] .. "StrB10_RevGS5", Dir[5] .. "HT-Main" } }, {1485, {Dir[4] .. "EoD Strikes"} } },
  -- C-Observatory - Temple of Febe
  { {1515, {nil} }, {1520, {Dir[1] .. "DP_Adventure"} } },
  -- Ascalon Cat - blahblah
  { {36, {nil} }, {0, {nil} } }
}

--We're forced to load this script, else the script console errors out due to the, "PackScriptToggle" check below.
Pack:Require(Dir[3] .. "Storage")

if(not Mumble.IsAvailable) then Debug:Error("Hero's Pack: Mumble API unavailable, script load aborted.")
elseif( not GetBool("PackScriptToggle") ) then Debug:Error("Hero's Pack: Main Script loading aborted on user preference.")
else
  local map, check = Mumble.CurrentMap.Id, false
  
  -- ========== Script Loading ==========
  for a,maps in ipairs(HMP.MapScripts) do
    for b,id in ipairs(maps) do
      if( map == id[1] ) then
        check = true
        Pack:Require(Dir[1] .. "MenuInfo") --Info Categories
        if( id[2][1] ~= nil ) then
          for c,script in ipairs(id[2]) do
            Pack:Require(script)
          end
        end
        break
      end
    end
    if( check ) then break end
  end
  
  --For use with the script-filter attribute
  function combatFade(marker) return Mumble.PlayerCharacter.IsInCombat end
  function onlyCombatFade(marker) if(not Mumble.PlayerCharacter.IsInCombat) then return true end end
  --This is for annoying markers that need to disappear when they should
  function heightFade(marker) if(Mumble.PlayerCharacter.Position.Z > marker.Position.Z+20) then return true end end
end