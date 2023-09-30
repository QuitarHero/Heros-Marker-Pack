HMP.HTcmSim = {
  titleMarker = World:MarkerByGuid("OJcRXfwjCke2koxPLreeXg=="),
  track = {
    0, -- (1) Main Script Tracking Variable
    0, -- (2) 'Share the Void' track
  },
  check = {false, false, false, false, false, false, false, false, false, false, false, false, false, false, false}, -- 15 Total
  ballCheck = {false, false, false, false, false, false},
  curTime = 0,
  orbTime = 0,
  stateTime = { 0, 0 },
  enrage = { 90000, 126000 }, -- Purification Phases, Dragon Phases
  color = {
    I:Color(214, 19,  19,  255), -- Void Pool Color
    I:Color(222, 172, 80,  255), -- Attack Indicating Color ( 222, 137, 18,  255 )
    I:Color(79,  131, 214, 255), -- Jormag's Blue Color
    I:Color(85,  194, 192, 255), -- Mordremoth's Wave Color
    I:Color(29,  15,  41,  255), -- "Void" Color
    I:Color(44,  223, 13,  255), -- 'Share the Void' Color
  }
}

Debug:Watch("Main Variables", HMP.HTcmSim)
local HTcm = HMP.HTcmSim

local function Reset_HTcm_Main() for i = 1, #HTcm.check do HTcm.check[i] = false end end

function Trigger_HTcm_Sim() HTcm.track[1] = HTcm.track[1] + 1 end

local titleTextures = { "P1", "D1", "D2", "D3", "P2", "D4", "D5", "P3", "D6-1", "P4", "D6-2" }
local function SetTitleTexture(index)
  --Setting Textures
  if(index < 1) then HTcm.titleMarker:SetTexture("Assets/Sim/Titles/Start.png")
  elseif(index > #titleTextures) then HTcm.titleMarker:SetTexture("Assets/Sim/Titles/Reset.png")
  else HTcm.titleMarker:SetTexture("Assets/Sim/Titles/" .. titleTextures[index] .. ".png") end
  --Re-Showing the Marker
  HTcm.titleMarker.InGameVisibility = true
end

local function HideTitle(time) if(time > 5079.73913043478) then HTcm.titleMarker.InGameVisibility = false end end

local function resetAll()
  SetTitleTexture(0)
  Reset_HTcm_Main()
  Reset_HTcm_Enemies()
  Reset_HTcm_General(true)
  Reset_HTcm_PlayerStates()
  Reset_HTcm_P1()
  Reset_HTcm_Jormag()
  Reset_HTcm_Primordus()
  Reset_HTcm_Kralkatorrik()
  Reset_HTcm_Mordremoth()
  Reset_HTcm_Zhaitan()
  Reset_DragonOrbs()
  Reset_HTcm_SooWon()
end

local function tick_HTcm_Simulation(gameTime)
  local gTime = gameTime.TotalGameTime.TotalMilliseconds
  local time = (gTime - HTcm.curTime)
  HTcm.stateTime[2] = ( gTime - HTcm.stateTime[1] )
  Debug:Watch("Sim Time", time)
  Debug:Watch("Start Time", HTcm.stateTime[2])
  
  --Resets the Script to the beginning when need be
  if(HTcm.track[1] ~= 0 and World:CategoryByType("hmpSim.htcm_main"):IsVisible() == false or HTcm.track[1] == 99) then
    for i = 1, #HTcm.track do HTcm.track[i] = 0 end
    resetAll()
  end
  
  --Player States
  if(HTcm.track[1] > 0 and HTcm.track[1] < 100) then
    HTcm_IOTV(HTcm.stateTime[2])
    HTcm_Debilitated(HTcm.stateTime[2])
    HTcm_Infirmity(HTcm.stateTime[2])
    HTcm_Slow(HTcm.stateTime[2])
    HTcm_Downed()
    HTcm_Death()
  end
  
  --Preparing for Purification 1
  if(HTcm.track[1] == 1) then
    SetTitleTexture(1)
    Reset_HTcm_General(true)
    Reset_HTcm_PlayerStates()
    Reset_HTcm_P1()
    HTcm.curTime = gTime
    HTcm.stateTime[1] = gTime
    HTcm.track[1] = 2
    time = (gTime - HTcm.curTime)
  end
  --Purification 1
  if(HTcm.track[1] == 2) then
    --General Mechanics
    HideTitle(time)
    HTcm_VoidOrbs(time, HTcm.General.orb.pos[2], HTcm.check, 1, 1, true)
    HTcm_VoidOrbs(time, HTcm.General.orb.pos[3], HTcm.check, 2, 2, true)
    HTcm_VoidOrbs(time, HTcm.General.orb.pos[4], HTcm.check, 3, 3, true)
    HTcm_VoidOrbs(time, HTcm.General.orb.pos[5], HTcm.check, 4, 4, true)
    --Purification 1 Mechanics
    HTcm_PrisRifts(time, HTcm.Purification_1.pos, HTcm.check, 5)
    HTcm_P1_LightningOfJormag(time, HTcm.check, 6)
    --If the player takes too long to phase / encounter fails, we reset
    if(time >= HTcm.enrage[1]) then HTcm.track[1] = 99 end
  end
  
  --Preparing for Jormag
  if(HTcm.track[1] == 3) then
    SetTitleTexture(2)
    Reset_HTcm_General(true)
    Reset_HTcm_P1()
    Reset_HTcm_Jormag()
    Reset_HTcm_Main()
    HTcm.curTime = gTime
    HTcm.track[2] = 1
    HTcm.track[1] = 4
    time = (gTime - HTcm.curTime)
  end
  --Jormag
  if(HTcm.track[1] == 4) then
    local D1 = HTcm.Jormag
    --General Mechanics
    HideTitle(time)
    HTcm_VoidOrbs(    time, HTcm.General.orb.pos[1], HTcm.check, 1, 1, false)
    HTcm_ShareTheVoid(time, D1.time[2], D1.time[1], D1.greenPos[HTcm.track[2]], HTcm.check, 2)
    HTcm_Spread(      time, D1.time[3], D1.time[1], HTcm.check, 3)
    HTcm_VoidPools(   time, D1.time[4], D1.time[1], HTcm.check, 4)
    HTcm_TargetIndicator(time, D1.time[9])
    --Jormag's Mechanics
    HTcm_D1_VoidPoolBreath(time, D1.time[5], D1.time[1], HTcm.check, 5)
    HTcm_D1_GraspOfJormag( time, D1.time[7], D1.time[1], HTcm.check, 6)
    HTcm_D1_SpreadBreath(  time, D1.time[6], D1.time[1], HTcm.check, 7)
    HTcm_D1_FrostMeteor(   time, D1.time[8], D1.time[1], HTcm.check, 8)
    --Dynamic Function Parameter Updates (Share the Void)
    if(time >= D1.time[2] + HTcm.General.stv.time[2] + ((HTcm.track[2]-1) * D1.time[1])) then HTcm.track[2] = HTcm.track[2] + 1 end
    --If the player takes too long to phase / encounter fails, we reset
    if(time >= HTcm.enrage[2]) then HTcm.track[1] = 99 end
  end
  
  --Preparing for Primordus
  if(HTcm.track[1] == 5) then
    SetTitleTexture(3)
    Reset_HTcm_General(true)
    Reset_HTcm_Jormag()
    Reset_HTcm_Primordus()
    Reset_HTcm_Main()
    HTcm.curTime = gTime
    HTcm.track[2] = 1
    HTcm.track[1] = 6
    time = (gTime - HTcm.curTime)
  end
  --Primordus
  if(HTcm.track[1] == 6) then
    local D2 = HTcm.Primordus
    --General Mechanics
    HideTitle(time)
    HTcm_VoidOrbs(    time, HTcm.General.orb.pos[1], HTcm.check, 1, 1, false)
    HTcm_ShareTheVoid(time, D2.time[2], D2.time[1], D2.greenPos[HTcm.track[2]], HTcm.check, 2)
    HTcm_Spread(      time, D2.time[3], D2.time[1], HTcm.check, 3)
    HTcm_VoidPools(   time, D2.time[4], D2.time[1], HTcm.check, 4)
    HTcm_TargetIndicator(time, D2.time[7])
    --Primordus Mechanics
    HTcm_D2_JawsOfDestruction(time, D2.time[5], D2.time[1], HTcm.check, 5)
    HTcm_D2_LavaSlam(         time, D2.time[6], D2.time[1], HTcm.check, 6)
    --Dynamic Function Parameter Updates (Share the Void)
    if(time >= D2.time[2] + HTcm.General.stv.time[2] + ((HTcm.track[2]-1) * D2.time[1])) then HTcm.track[2] = HTcm.track[2] + 1 end
    --If the player takes too long to phase / encounter fails, we reset
    if(time >= HTcm.enrage[2]) then HTcm.track[1] = 99 end
  end
  
  --Preparing for Kralkatorrik
  if(HTcm.track[1] == 7) then
    SetTitleTexture(4)
    Reset_HTcm_General(true)
    Reset_HTcm_Primordus()
    Reset_HTcm_Kralkatorrik()
    Reset_HTcm_Main()
    HTcm.curTime = gTime
    HTcm.track[2] = 1
    HTcm.track[1] = 8
    time = (gTime - HTcm.curTime)
  end
  --Kralkatorrik
  if(HTcm.track[1] == 8) then
    local D3 = HTcm.Kralkatorrik
    --General Mechanics
    HideTitle(time)
    HTcm_VoidOrbs( time, HTcm.General.orb.pos[1], HTcm.check, 1, 1, false)
    HTcm_VoidPools(time, D3.time[2], D3.time[1], HTcm.check, 2)
    HTcm_TargetIndicator(time, D3.time[6])
    --Kralkatorrik Mechanics
    HTcm_D3_SideBeams(time, D3.time[3], D3.time[1], HTcm.check, 3)
    HTcm_D3_CenterBeam(time, D3.time[4], D3.time[1], HTcm.check, 4)
    HTcm_D3_CrystalBarrage(time, D3.time[5], (D3.time[1] / 2), HTcm.check, 5)
    --If the player takes too long to phase / encounter fails, we reset
    if(time >= HTcm.enrage[2]) then HTcm.track[1] = 99 end
  end
  
  --Preparing for Purification 2
  if(HTcm.track[1] == 9) then
    SetTitleTexture(5)
    Reset_HTcm_General(true)
    Reset_HTcm_Kralkatorrik()
    Reset_HTcm_Main()
    HTcm.curTime = gTime
    HTcm.track[1] = 10
    time = (gTime - HTcm.curTime)
  end
  --Purification 2
  if(HTcm.track[1] == 10) then
    local P2 = HTcm.Purification_2
    --General Mechanics
    HideTitle(time)
    HTcm_VoidOrbs(time, HTcm.General.orb.pos[2], HTcm.check, 1, 1, true)
    HTcm_VoidOrbs(time, HTcm.General.orb.pos[3], HTcm.check, 2, 2, true)
    HTcm_VoidOrbs(time, HTcm.General.orb.pos[4], HTcm.check, 3, 3, true)
    HTcm_VoidOrbs(time, HTcm.General.orb.pos[5], HTcm.check, 4, 4, true)
    --Purification 2 Mechanics
    HTcm_PrisRifts(time, P2.pos, HTcm.check, 5)
    --If the player takes too long to phase / encounter fails, we reset
    if(time >= HTcm.enrage[1]) then HTcm.track[1] = 99 end
  end
  
  --Preparing for Mordremoth
  if(HTcm.track[1] == 11) then
    SetTitleTexture(6)
    Reset_HTcm_General(true)
    Reset_HTcm_Mordremoth()
    Reset_HTcm_Main()
    HTcm.curTime = gTime
    HTcm.track[1] = 12
    time = (gTime - HTcm.curTime)
  end
  --Mordremoth
  if(HTcm.track[1] == 12) then
    local D4 = HTcm.Mordremoth
    --General Mechanics
    HideTitle(time)
    HTcm_VoidOrbs( time, HTcm.General.orb.pos[1], HTcm.check, 1, 1, false)
    HTcm_Spread(   time, D4.time[2], D4.time[1], HTcm.check, 2)
    HTcm_VoidPools(time, D4.time[3], D4.time[1], HTcm.check, 3)
    HTcm_TargetIndicator(time, D4.time[6])
    --Mordremoth Mechanics
    HTcm_D4_PoisonRoar(time, D4.time[4], D4.time[1], HTcm.check, 4)
    HTcm_D4_ShockWaves(time, D4.time[5], D4.time[1], HTcm.check, 5)
    --If the player takes too long to phase / encounter fails, we reset
    if(time >= HTcm.enrage[2]) then HTcm.track[1] = 99 end
  end
  
  --Preparing for Zhaitan
  if(HTcm.track[1] == 13) then
    SetTitleTexture(7)
    Reset_HTcm_General(true)
    Reset_HTcm_Mordremoth()
    Reset_HTcm_Zhaitan()
    Reset_HTcm_Main()
    HTcm.curTime = gTime
    HTcm.track[2] = 1
    HTcm.track[1] = 14
    time = (gTime - HTcm.curTime)
  end
  --Zhaitan
  if(HTcm.track[1] == 14) then
    local D5 = HTcm.Zhaitan
    --Enemies
    HTcm_D5_Giants(time, 500, HTcm.check, 1)
    --General Mechanics
    HideTitle(time)
    HTcm_VoidOrbs(    time, HTcm.General.orb.pos[1], HTcm.check, 2, 1, false)
    HTcm_ShareTheVoid(time, D5.time[2], D5.time[1], D5.greenPos[HTcm.track[2]], HTcm.check, 3)
    HTcm_Spread(      time, D5.time[3], D5.time[1], HTcm.check, 4)
    HTcm_VoidPools(   time, D5.time[4], D5.time[1], HTcm.check, 5)
    HTcm_TargetIndicator(time, D5.time[9])
    --Zhaitan Mechanics
    HTcm_D5_PutridDeluge(time, D5.time[5], D5.time[1], HTcm.check, 6)
    HTcm_D5_Wurms(       time, D5.time[6], D5.time[1], HTcm.check, 7)
    HTcm_D5_ClawSlam(    time, D5.time[7], D5.time[1], HTcm.check, 8)
    HTcm_D5_Scream(      time, D5.time[8], D5.time[1], HTcm.check, 9)
    --Dynamic Function Parameter Updates (Share the Void)
    if(time >= D5.time[2] + HTcm.General.stv.time[2] + ((HTcm.track[2]-1) * D5.time[1])) then HTcm.track[2] = HTcm.track[2] + 1 end
    --If the player takes too long to phase / encounter fails, we reset
    if(time >= HTcm.enrage[2]) then HTcm.track[1] = 99 end
  end
  
  --Preparing for Purification 3
  if(HTcm.track[1] == 15) then
    SetTitleTexture(8)
    Reset_HTcm_General(true)
    Reset_HTcm_Zhaitan()
    Reset_DragonOrbs()
    Reset_HTcm_Enemies()
    Reset_HTcm_Main()
    for i = 1, 6 do HTcm.ballCheck[i] = false end
    HTcm.curTime = gTime
    HTcm.orbTime = gTime
    HTcm.track[2] = 1
    HTcm.track[1] = 16
    time = (gTime - HTcm.curTime)
  end
  --Purification 3
  if(HTcm.track[1] == 16) then
    local P3 = HTcm.Purification_3
    --General Mechanics
    HideTitle(time)
    HTcm_VoidOrbs(time, HTcm.General.orb.pos[2], HTcm.check, 1, 1, true)
    HTcm_VoidOrbs(time, HTcm.General.orb.pos[3], HTcm.check, 2, 2, true)
    HTcm_VoidOrbs(time, HTcm.General.orb.pos[4], HTcm.check, 3, 3, true)
    HTcm_VoidOrbs(time, HTcm.General.orb.pos[5], HTcm.check, 4, 4, true)
    --Purification 3 Mechanics
    HTcm_PrisRifts(time, P3.pos, HTcm.check, 5)
    --If the player takes too long to phase / encounter fails, we reset
    if(time >= HTcm.enrage[1]) then HTcm.track[1] = 99 end
  end
  
  -- Purification 3 Dragon Orbs
  if(HTcm.track[1] >= 16 and HTcm.track[1] <= 18) then
    local ballTime = (gTime - HTcm.orbTime)
    HTcm_DragonOrbs(ballTime, HTcm.ballCheck, 1, 1, false)
    HTcm_DragonOrbs(ballTime, HTcm.ballCheck, 2, 2, false)
    HTcm_DragonOrbs(ballTime, HTcm.ballCheck, 3, 3, false)
    HTcm_DragonOrbs(ballTime, HTcm.ballCheck, 4, 4, false)
    HTcm_DragonOrbs(ballTime, HTcm.ballCheck, 5, 5, false)
  end
  
  --Preparing for Soo-Won P1
  if(HTcm.track[1] == 17) then
    SetTitleTexture(9)
    Reset_HTcm_General(true)
    Reset_HTcm_SooWon()
    Reset_HTcm_Main()
    HTcm_D6_UpdateTimes(false)
    HTcm.curTime = gTime
    HTcm.track[2] = 1
    HTcm.track[1] = 18
    time = (gTime - HTcm.curTime)
  end
  --Soo-Won P1
  if(HTcm.track[1] == 18 or HTcm.track[1] == 22) then
    local D6 = HTcm.SooWon
    --General Mechanics
    HideTitle(time)
    HTcm_VoidOrbs(    time, HTcm.General.orb.pos[1], HTcm.check, 1, 1, false)
    HTcm_ShareTheVoid(time, D6.time[2], D6.time[1], D6.greenPos[HTcm.track[2]], HTcm.check, 2)
    HTcm_Spread(      time, D6.time[3], D6.time[1], HTcm.check, 3)
    --[[
    if(HTcm.General.vp.time[1] == 0 - D6.delay)          then D6.track[1] = 0 end
    if(HTcm.General.vp.time[1] == D6.time[4] - D6.delay) then D6.track[1] = 0 end
    if(HTcm.General.vp.time[1] == 37300 - D6.delay)      then D6.track[1] = 1 end
    if(HTcm.General.vp.time[1] == 61170 - D6.delay)      then D6.track[1] = 2 end
    if(HTcm.General.vp.time[1] == 82970 - D6.delay)      then D6.track[1] = 3 end
    if(HTcm.General.vp.time[1] == 106840 - D6.delay)     then D6.track[1] = 4 end
    ]]
    HTcm_VoidPools(   time, D6.time[4], D6.vpInt[( ( D6.track[1] % 2 ) + 1 )], HTcm.check, 4)
    HTcm_TargetIndicator(time, D6.time[9])
    --Soo-Won's Mechanics
    if(D6.wave.time == 0 - D6.delay)      then D6.track[2] = 0 D6.track[3] = D6.tsunamiWave.markers[1] end
    if(D6.wave.time == 18600 - D6.delay)  then D6.track[2] = 0 D6.track[3] = D6.tsunamiWave.markers[1] end
    if(D6.wave.time == 43800 - D6.delay)  then D6.track[2] = 1 D6.track[3] = D6.tailSlam.markers[1] end
    if(D6.wave.time == 64270 - D6.delay)  then D6.track[2] = 2 D6.track[3] = D6.tsunamiWave.markers[1] end
    if(D6.wave.time == 89470 - D6.delay)  then D6.track[2] = 3 D6.track[3] = D6.tailSlam.markers[1] end
    if(D6.wave.time == 109940 - D6.delay) then D6.track[2] = 4 D6.track[3] = D6.tsunamiWave.markers[1] end
    HTcm_D6_Wave(       time, D6.time[5] + 1500, D6.wave.interval[( ( D6.track[2] % 2 ) + 1 )], HTcm.check, 5, D6.track[3])
    HTcm_D6_TsunamiWave(time, D6.time[5], D6.time[1], HTcm.check, 6)
    HTcm_D6_ClawSlap(   time, D6.time[6], D6.time[1], HTcm.check, 7)
    HTcm_D6_TailSlam(   time, D6.time[7], D6.time[1], HTcm.check, 8)
    HTcm_D6_VoidBeam(   time, D6.time[8], D6.time[1], HTcm.check, 9)
    --Dragon Orb
    if(HTcm.track[1] == 18) then
      HTcm_DragonOrbs(time, HTcm.ballCheck, 6, 6, true)
    elseif(HTcm.track[1] == 22) then
      HTcm_DragonOrbs(time, HTcm.ballCheck, 1, 1, true)
      HTcm_DragonOrbs(time, HTcm.ballCheck, 2, 2, true)
      HTcm_DragonOrbs(time, HTcm.ballCheck, 3, 3, true)
      HTcm_DragonOrbs(time, HTcm.ballCheck, 4, 4, true)
      HTcm_DragonOrbs(time, HTcm.ballCheck, 5, 5, true)
      HTcm_DragonOrbs(time, HTcm.ballCheck, 6, 6, true)
    end
    --Dynamic Function Parameter Updates (Share the Void, Void Pools)
    if(time >= D6.time[2] + HTcm.General.stv.time[2] + ((HTcm.track[2]-1) * D6.time[1])) then HTcm.track[2] = HTcm.track[2] + 1 end
    --if(time >= D6.time[4] + HTcm.General.vp.time[2]  + (D6.track[1] * D6.time[1])) then D6.track[1] = D6.track[1] + 1 end
    --If the player takes too long to phase / encounter fails, we reset
    if(time >= HTcm.enrage[2]) then HTcm.track[1] = 99 end
  end
  
  --Preparing for Purification 4
  if(HTcm.track[1] == 19) then
    SetTitleTexture(10)
    Reset_HTcm_General(false)
    Reset_HTcm_SooWon()
    Reset_HTcm_Main()
    Reset_DragonOrbs()
    for i = 1, 6 do HTcm.ballCheck[i] = false end
    HTcm.curTime = gTime
    HTcm.track[2] = 1
    HTcm.track[1] = 20
    time = (gTime - HTcm.curTime)
  end
  --Purification 4
  if(HTcm.track[1] == 20) then
    local P4 = HTcm.Purification_4
    HideTitle(time)
  end
  
  --Preparing for Soo-Won P2
  if(HTcm.track[1] == 21) then
    SetTitleTexture(11)
    Reset_HTcm_Main()
    HTcm_D6_UpdateTimes(true)
    HTcm.curTime = gTime
    HTcm.track[1] = 22
    time = (gTime - HTcm.curTime)
  end
  
  --If the user fails a mechanic...
  if(HTcm.track[1] == 97) then
    SetTitleTexture(97)
    HTcm.track[1] = 98
  end
  
  --"Resets" the script, allowing the user to loop through all phases without manually resetting
  if(HTcm.track[1] == 23) then HTcm.track[1] = 99 end
end

Event:OnTick(tick_HTcm_Simulation)