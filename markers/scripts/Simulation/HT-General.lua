HMP.HTcmSim.General = {
  orb = { --Center / Side Expanding Orbs
    markers = {
      World:CategoryByType("hmpSim.htcm_c1.sc1.asc1.orb1"):GetMarkers(),
      World:CategoryByType("hmpSim.htcm_c1.sc1.asc1.orb2"):GetMarkers(),
      World:CategoryByType("hmpSim.htcm_c1.sc1.asc1.orb3"):GetMarkers(),
      World:CategoryByType("hmpSim.htcm_c1.sc1.asc1.orb4"):GetMarkers(),
    },
    pos = {
      I:Vector3(15.3591026162052, -518.036474472949, 391.723),  --Center
      I:Vector3(15.012366522733, -546.075590551181, 391.723),   --South
      I:Vector3(-12.9544305308611, -518.125374650749, 391.723), --West
      I:Vector3(14.8698475996952, -490.431724663449, 391.723),  --North
      I:Vector3(44.7574218948438, -518.064389128778, 391.723),  --East
    },
    size = {
      2.55, 3.431, 4.3115, 5.1925, 6.073, 6.954, 7.8345, 8.7155, 9.596, 10.477, 11.3575, 12.3575, 13.119, 14, 14.881, 15.7615, 16.6425, 17.523, 18.404, 19.2845, 20.1655, 21.046, 21.927, 22.8075, 23.6885, 24.569, 25.45, 26.331, 27.2115, 28.0925, 28.973, 29.854, 30.7345, 31.6155, 32.496, 33.377, 34.2575, 35.1385, 36.019, 36.9 },
    track = { --current expansion size, first marker pair, second marker pair
      {0, 0, 0}, {0, 0, 0}, {0, 0, 0}, {0, 0, 0},
    },
    time = {0, 0, 0, 0},
    interval = 3039.86956521739,
    fadeDelay = 500, --how long to fade in/out
    timeDelay = 0,
    alpha = {0.9, 0, 0, 0, 0}, --Border, Fills
  },
  vp = { --Void Pools
    markers = World:CategoryByType("hmpSim.htcm_c1.sc1.asc4"):GetMarkers(),
    size = {11.5, 7.65}, --cm, regular
    track = 0,
    alpha = {0.9, 0.15},
    pos = {I:Vector3(0, 0, 0), 0},
    time = {0, 7000, 6700, 800, 400}, --dynamic interval, vp duration, vp placement delay, initial vp growth, fade-out duration
  },
  spread = { --Spread (Targetted Expulsion)
    markers = World:CategoryByType("hmpSim.htcm_c1.sc1.asc3"):GetMarkers(),
    size = 7.68,
    alpha = {1, 0.25},
    time = {0, 5000, 500} --dynamic interval, spread duration, Fade-In duration
  },
  stv = { --Share the Void (Greens)
    markers = World:CategoryByType("hmpSim.htcm_c1.sc1.asc2"):GetMarkers(),
    size = 4.35,
    track = 0,
    alpha = {1, 0.25},
    time = {130000, 6556, 800, 400}, --dynamic interval, green duration, fade-in duration, fade-out duration
  },
  prisRifts = { --Purification's Prismatic Rifts
    markers = World:CategoryByType("hmpsim.htcm_c1.sc5.p_1"):GetMarkers(),
    time = 12000,
    track = 0,
    size = 7.625,
    alpha = {0.75, 0.35},
    dur = 75,
  },
  infirmity = {
    marker = World:MarkerByGuid("zgdl0KGM7kuZtBoc3URkuA=="),
    state = false,
    startTime = 0,
    duration = 0,
    pos = I:Vector3(0, 1, 0),
  },
  debilitated = {
    marker = World:MarkerByGuid("gsNEZG4VYUWG0FcemoktDg=="),
    state = false,
    startTime = 0,
    duration = 0,
    pos = I:Vector3(0, 1, -0.5),
  },
  iotv = {
    marker = World:MarkerByGuid("46VKXJaVcE6lDX78SkXzQg=="),
    state = false,
    startTime = 0,
    duration = 0,
    pos = I:Vector3(0, 1, -1),
  },
  downed = {
    marker = World:MarkerByGuid("P41viKF8YE2989KZwIRozA=="),
    state = false,
    pos = I:Vector3(0, 0, 0),
  },
  death = {
    marker = World:MarkerByGuid("/Uviem1QzEW5urPkn+3N2w=="),
    state = false,
    pos = I:Vector3(0, 0, 3),
  },
  slow = {
    marker = World:MarkerByGuid("omb6xqYTmUi2Nprh/KFATQ=="),
    state = false,
    startTime = 0,
    duration = 0,
    pos = I:Vector3(0, 1, -1.5)
  },
  stateFail = {
    marker = World:MarkerByGuid("4VfiNxjIdUiR0Kt7srhcnw=="),
  },
  target = {
    markers = World:CategoryByType("hmpSim.htcm_c1.sc6.asc1"):GetMarkers()
  },
}

local main = HMP.HTcmSim.General
local pur = main.prisRifts

function Reset_HTcm_General(resetVP)
  local allMarkers = { main.spread.markers, main.stv.markers, main.prisRifts.markers, main.target.markers }
  --Persists Void Pool Visibility if true
  if(resetVP) then
    table.insert(allMarkers, main.vp.markers)
    main.vp.track = 0
  else
    main.vp.markers[1].InGameVisibility = false
    if(main.vp.markers[(main.vp.track * 4) + 1].InGameVisibility) then
      main.vp.pos[2] = 0
      for i = 0, 3 do main.vp.markers[(main.vp.track * 4) - i + 1].InGameVisibility = false end
      main.vp.track = main.vp.track - 1
    end
  end
  --Hides 'General' Mechanical Markers
  for i = 1, #allMarkers do for k = 1, #allMarkers[i] do allMarkers[i][k].InGameVisibility = false end end
  for i = 1, #main.orb.markers do for k = 1, #main.orb.markers[i] do main.orb.markers[i][k].InGameVisibility = false end end
end

function Reset_HTcm_PlayerStates()
  local stateTable = { main.infirmity, main.debilitated, main.iotv, main.downed, main.death }
  --Hides 'General' Player State Markers
  for i = 1, #stateTable do stateTable[i].state = false stateTable[i].marker.InGameVisibility = false end
  main.stateFail.marker.InGameVisibility = false
end

--Called function to remove a player state
local function HTcm_RemovePlayerState(stateTable)
  stateTable.marker.InGameVisibility = false
  stateTable.duration = 0
  stateTable.startTime = 0
  stateTable.state = false
end

--Player State: Infirmity
function ApplyInfirmity() main.infirmity.state = true main.infirmity.duration = 30000 main.infirmity.startTime = HMP.HTcmSim.stateTime[2] end
function HTcm_Infirmity(curTime)
  if(main.infirmity.state) then
    main.infirmity.marker.InGameVisibility = true
    main.infirmity.marker:SetPos(Mumble.PlayerCharacter.Position + main.infirmity.pos)
  end
  if(main.infirmity.state == true and curTime > main.infirmity.startTime + main.infirmity.duration) then HTcm_RemovePlayerState(main.infirmity) end
end

--Player State: Debilitated
function ApplyDebilitated() main.debilitated.state = true main.debilitated.duration = 30000 main.debilitated.startTime = HMP.HTcmSim.stateTime[2] end
function HTcm_Debilitated(curTime)
  if(main.debilitated.state) then
    main.debilitated.marker.InGameVisibility = true
    main.debilitated.marker:SetPos(Mumble.PlayerCharacter.Position + main.debilitated.pos)
  end
  if(main.debilitated.state == true and curTime > main.debilitated.startTime + main.debilitated.duration) then HTcm_RemovePlayerState(main.debilitated) end
end

--Player State: Influence of the Void
function ApplyIOTV() main.iotv.state = true main.iotv.duration = 150000 main.iotv.startTime = HMP.HTcmSim.stateTime[2] end
function HTcm_IOTV(curTime)
  if(main.iotv.state) then
    main.iotv.marker.InGameVisibility = true
    main.iotv.marker:SetPos(Mumble.PlayerCharacter.Position + main.iotv.pos)
  end
  if(main.iotv.state == true and curTime > main.iotv.startTime + main.iotv.duration) then HTcm_RemovePlayerState(main.iotv) end
end

--Player State: Downed
function ApplyDowned(playerPos) main.downed.state = true main.downed.pos = playerPos HMP.HTcmSim.track[1] = 97 end
function HTcm_Downed()
  if(main.downed.state) then
    main.downed.marker.InGameVisibility = true
    main.downed.marker:SetPos(main.downed.pos + I:Vector3(0, 0, -0.75))
    main.stateFail.marker.InGameVisibility = true
    main.stateFail.marker:SetPos(main.downed.pos)
  end
end

--Player State: Death
function ApplyDeath(playerPos) main.death.state = true main.death.pos = playerPos HMP.HTcmSim.track[1] = 97 end
function HTcm_Death()
  if(main.death.state) then
    main.death.marker.InGameVisibility = true
    main.death.marker:SetPos(main.death.pos + I:Vector3(0, 0, -0.75))
    main.stateFail.marker.InGameVisibility = true
    main.stateFail.marker:SetPos(main.death.pos)
  end
end

--Player State: Slow
function ApplySlow() main.slow.state = true main.slow.duration = 5000 main.slow.startTime = HMP.HTcmSim.stateTime[2] end
function HTcm_Slow(curTime)
  if(main.slow.state) then
    main.slow.marker.InGameVisibility = true
    main.slow.marker:SetPos(Mumble.PlayerCharacter.Position + main.slow.pos)
  end
  if(main.slow.state == true and curTime > main.slow.startTime + main.slow.duration) then HTcm_RemovePlayerState(main.slow) end
end

--Expanding Orbs | 'delay' is a boolean (true if pur phase, otherwise false)
function HTcm_VoidOrbs(curTime, vector, table, index, num, delay)
  --Resets variables
  if(not table[index]) then
    for i = 1, 3 do main.orb.track[num][i] = 0 end
    if(not delay) then main.orb.timeDelay = 0 else main.orb.timeDelay = 3039.86956521739 end
    main.orb.time[num] = 5079.73913043478 + main.orb.timeDelay
    main.orb.alpha[num+1] = 0.1
    for i = 1, #main.orb.markers[num] do
      main.orb.markers[num][i]:SetPos(vector)
      main.orb.markers[num][i].Size = main.orb.size[1]
      main.orb.markers[num][i].InGameVisibility = false
      if(i < 5) then main.orb.markers[num][i].Alpha = main.orb.alpha[(((i % 2)*num)+1)] end
      if(i > 5) then main.orb.markers[num][i].Tint = HMP.HTcmSim.color[2] end
    end
    table[index] = true
  end
  
  --Grows "Orb" Marker, Shows and Hides the Orange Indicator
  if(main.orb.track[num][1] == 0 and curTime >= main.orb.interval + main.orb.timeDelay and curTime < main.orb.time[num]) then
    for i = 5, 7 do
      main.orb.markers[num][i].InGameVisibility = true
      if(i > 5) then main.orb.markers[num][i].Size = main.orb.size[1] end
    end
    if(curTime <= main.orb.interval + main.orb.timeDelay + 150) then
      HMPphysics.animate.SizeGrow(curTime, (main.orb.interval + main.orb.timeDelay), 150, 0.025, 1.75, main.orb.markers[num][5])
    end
  elseif(main.orb.track[num][1] == 0 and curTime >= main.orb.time[num]) then
    for i = 6, 7 do main.orb.markers[num][i].InGameVisibility = false end
    main.orb.track[num][1] = 1
  end
  
  --First Expansion
  if(main.orb.track[num][1] == 1) then
    --Fade-In Markers
    if(curTime >= main.orb.time[num] and curTime <= main.orb.time[num] + main.orb.fadeDelay) then
      for i = 1, 2 do
        main.orb.markers[num][i].InGameVisibility = true
        main.orb.markers[num][i].Size = main.orb.size[main.orb.track[num][1]]
        HMPphysics.animate.FadeIn(curTime, main.orb.time[num], main.orb.fadeDelay, main.orb.alpha[(((i % 2)*num)+1)], main.orb.markers[num][i])
      end
      --Applies "Influence of the Void" to the player
      if((Mumble.PlayerCharacter.Position - main.orb.markers[num][1].Position):Length() <= main.orb.markers[num][1].Size and curTime >= main.orb.time[num]) then ApplyIOTV() end
    end
    --Increments variables
    if(curTime >= main.orb.time[num] + main.orb.interval) then
      main.orb.track[num][1] = main.orb.track[num][1] + 1
      main.orb.track[num][2] = 2
      main.orb.time[num] = main.orb.time[num] + main.orb.interval
    end
  --All other expansions
  elseif(main.orb.track[num][1] > 1) then
    --Fade-In and Fade-Out Markers
    if(curTime >= main.orb.time[num] and curTime < main.orb.time[num] + main.orb.fadeDelay) then
      for i = 1, 4 do main.orb.markers[num][i].Size = main.orb.size[main.orb.track[num][1]] main.orb.markers[num][i].InGameVisibility = true end
      for i = 1, 2 do
        HMPphysics.animate.FadeIn( curTime, main.orb.time[num], main.orb.fadeDelay, main.orb.alpha[(((i % 2)*num)+1)], main.orb.markers[num][i + main.orb.track[num][2]])
        HMPphysics.animate.FadeOut(curTime, main.orb.time[num], main.orb.fadeDelay, main.orb.alpha[(((i % 2)*num)+1)], main.orb.markers[num][i + main.orb.track[num][3]])
      end
    end
    --Applies "Influence of the Void" to the player
    if((Mumble.PlayerCharacter.Position - main.orb.markers[num][1].Position):Length() <= main.orb.markers[num][1].Size) then ApplyIOTV() end
    --Increments variables
    if(curTime >= main.orb.time[num] + main.orb.interval) then
      if(main.orb.track[num][2] == 0) then main.orb.track[num][2] = 2 main.orb.track[num][3] = 0 else main.orb.track[num][2] = 0 main.orb.track[num][3] = 2 end
      main.orb.alpha[(num+1)] = main.orb.alpha[(num+1)] + 0.01
      main.orb.track[num][1] = main.orb.track[num][1] + 1
      main.orb.time[num] = main.orb.time[num] + main.orb.interval
    end
  end
end

--Void Pools
function HTcm_VoidPools(curTime, startTime, interval, table, index)
  --Resetting variables
  if(not table[index]) then
    main.vp.markers[1]:SetTexture(757655)
    main.vp.markers[1].RotationXyz = nil
    for i = 2, #main.vp.markers do main.vp.markers[i].Tint = HMP.HTcmSim.color[1] end
    main.vp.pos[2] = 0
    main.vp.time[1] = startTime
    table[index] = true
  end
  
  local track = (main.vp.track * 4) + 1
  --An additional variable reset check
  if(curTime >= (main.vp.time[1] - 1000) and curTime < main.vp.time[1] and main.vp.pos[2] == 0) then
    main.vp.track = main.vp.track + 1
    main.vp.pos[2] = 1
    for i = 0, 1 do main.vp.markers[((main.vp.track * 4) + 1 - i)].Alpha = main.vp.alpha[(i%2)+1] end
  end
  
  if(curTime >= main.vp.time[1] and curTime < main.vp.time[1] + main.vp.time[2]) then
    --Shows Markers, Places Markers on Player
    main.vp.markers[1].InGameVisibility = true
    main.vp.markers[1]:SetPos(Mumble.PlayerCharacter.Position + I:Vector3(0, 0, 3))
    for i = 0, 3 do
      main.vp.markers[(track - i)]:SetPos(Mumble.PlayerCharacter.Position.X, Mumble.PlayerCharacter.Position.Y, 391.723)
    end
    --Grows Markers
    if(curTime <= main.vp.time[1] + main.vp.time[4]) then
      for i = 2, 3 do
        main.vp.markers[(track - i)].InGameVisibility = true
        HMPphysics.animate.SizeGrow(curTime, main.vp.time[1], main.vp.time[4], 0.075, main.vp.size[1], main.vp.markers[(track - i)])
      end
    else
      for i = 0, 1 do
        main.vp.markers[(track - i)].InGameVisibility = true
        HMPphysics.animate.SizeGrow(curTime, (main.vp.time[1] + main.vp.time[4]), (main.vp.time[2] - main.vp.time[4]), 0.075, main.vp.size[1], main.vp.markers[(track - i)])
      end
    end
  end
  
  --Saves Player Position at a certain point
  if(curTime >= main.vp.time[1] + main.vp.time[3] and main.vp.pos[2] == 1) then
    main.vp.pos[1] = I:Vector3(Mumble.PlayerCharacter.Position.X, Mumble.PlayerCharacter.Position.Y, 391.723)
    main.vp.pos[2] = 0
  end
  
  --Places Markers, Fade-Out Markers
  if(curTime >= main.vp.time[1] + main.vp.time[2]) then
    main.vp.markers[1].InGameVisibility = false
    for i = 2, 3 do main.vp.markers[(track - i)]:SetPos(main.vp.pos[1]) end
    for i = 0, 1 do
      main.vp.markers[(track - i)]:SetPos(Mumble.PlayerCharacter.Position.X, Mumble.PlayerCharacter.Position.Y, 391.723)
      HMPphysics.animate.FadeOut(curTime, (main.vp.time[1] + main.vp.time[2]), main.vp.time[5], main.vp.alpha[(i%2)+1], main.vp.markers[(track - i)])
    end
  end
  
  --Ends/Resets the Script
  if(curTime >= main.vp.time[1] + main.vp.time[2] + main.vp.time[5]) then
    for i = 0, 1 do main.vp.markers[(track - i)].InGameVisibility = false end
    main.vp.time[1] = main.vp.time[1] + interval
    HMP.HTcmSim.SooWon.track[1] = HMP.HTcmSim.SooWon.track[1] + 1
  end
end

--Spread
function HTcm_Spread(curTime, startTime, interval, table, index)
  --Resetting variables
  if(not table[index]) then
    for i = 1, #main.spread.markers do main.spread.markers[i].Tint = HMP.HTcmSim.color[2] end
    main.spread.time[1] = startTime
    table[index] = true
  end
  
  if(curTime >= main.spread.time[1]) then
    for i = 1, #main.spread.markers do
      --Placing Markers onto the Player
      main.spread.markers[i]:SetPos(Mumble.PlayerCharacter.Position.X, Mumble.PlayerCharacter.Position.Y, 391.723)
      --Fade-In Markers
      if(curTime < main.spread.time[1] + main.spread.time[3] and i <= 2) then
        main.spread.markers[i].InGameVisibility = true
        HMPphysics.animate.FadeIn(curTime, main.spread.time[1], main.spread.time[3], main.spread.alpha[(i%2)+1], main.spread.markers[i])
      --Grows Markers
      elseif(curTime >= main.spread.time[1] + main.spread.time[3] and i >= 3) then
        main.spread.markers[i].InGameVisibility = true
        HMPphysics.animate.SizeGrow(curTime, (main.spread.time[1] + main.spread.time[3]), (main.spread.time[2] - main.spread.time[3]), 0.025, main.spread.size, main.spread.markers[i])
      end
    end
    
    --Ends/Resets the Script
    if(curTime >= main.spread.time[1] + main.spread.time[2]) then
      for i = 1, #main.spread.markers do main.spread.markers[i].InGameVisibility = false end
      main.spread.time[1] = main.spread.time[1] + interval
    end
  end
end

--Greens (Share the Void)
function HTcm_ShareTheVoid(curTime, startTime, interval, posTable, table, index)
  --Resetting variables
  if(not table[index]) then
    for i = 1, #main.stv.markers do main.stv.markers[i].Tint = HMP.HTcmSim.color[6] end
    main.stv.track = 0
    main.stv.time[1] = startTime
    table[index] = true
  end
  
  if(curTime >= main.stv.time[1]) then
    --Assigns Marker Positions
    if(main.stv.track == 0) then
      for i = 1, 6 do
        main.stv.markers[i]:SetPos(posTable[(math.ceil(i/2))])
        main.stv.markers[i+6]:SetPos(posTable[(math.ceil(i/2))])
      end
      main.stv.track = 1
    end
    for i = 1, #main.stv.markers do
      --Shows and Fade-In Markers
      if(curTime <= main.stv.time[1] + main.stv.time[3]) then
        main.stv.markers[i].InGameVisibility = true
        HMPphysics.animate.FadeIn(curTime, main.stv.time[1], main.stv.time[3], main.stv.alpha[(i%2)+1], main.stv.markers[i])
      end
      --Shrinks Markers
      if(i >= 7 and curTime <= main.stv.time[1] + main.stv.time[2]) then
        HMPphysics.animate.SizeShrink(curTime, main.stv.time[1], main.stv.time[2], 0.025, main.stv.size, main.stv.markers[i])
      end
      --Fade-Out Markers
      if(curTime >= main.stv.time[1] + main.stv.time[2]) then
        HMPphysics.animate.FadeOut(curTime, (main.stv.time[1] + main.stv.time[2]), main.stv.time[4], main.stv.alpha[(i%2)+1], main.stv.markers[i])
      end
    end
    --Hides Markers, Ends/Resets the Script
    if(curTime >= main.stv.time[1] + main.stv.time[2] + main.stv.time[4]) then
      for _, marker in ipairs(main.stv.markers) do marker.InGameVisibility = false end
      main.stv.track = 0
      main.stv.time[1] = main.stv.time[1] + interval
    end
  end
end

--Prismatic Rifts
function HTcm_PrisRifts(curTime, pos, table, index)
  --Resetting variables
  if(not table[index]) then pur.track = 0 table[index] = true end
  
  if(pur.track == 0 and curTime >= pur.time - pur.dur and curTime <= pur.time) then
    --Setting Position, Showing Markers, Growing Markers
    for i = 1, 2 do
      pur.markers[i]:SetPos(pos[(math.ceil(i/2))])
      pur.markers[i].Alpha = pur.alpha[(i%2)+1]
      pur.markers[i].InGameVisibility = true
      HMPphysics.animate.SizeGrow(curTime, (pur.time - pur.dur), pur.dur, 0.025, pur.size, pur.markers[i])
    end
  elseif(pur.track == 0 and curTime > pur.time) then
    --Setting Position, Showing Markers
    for i = 1, (#pos*2) do
      pur.markers[i].Size = pur.size
      if(i > 2) then
        pur.markers[i]:SetPos(pos[(math.ceil(i/2))])
        pur.markers[i].Alpha = pur.alpha[(i%2)+1] * 0.25
        pur.markers[i].InGameVisibility = true
      end
    end
    pur.track = 1
  end
end

--World Boss Target Indicator
function HTcm_TargetIndicator(curTime, startTime)
  if(curTime >= startTime) then
    if((Mumble.PlayerCharacter.Position - main.target.markers[1].Position):Length() < 14.55) then
      main.target.markers[1].InGameVisibility = true
      main.target.markers[2].InGameVisibility = false
    else
      main.target.markers[1].InGameVisibility = false
      main.target.markers[2].InGameVisibility = true
    end
  else
    main.target.markers[1].InGameVisibility = false
    main.target.markers[2].InGameVisibility = false
  end
end