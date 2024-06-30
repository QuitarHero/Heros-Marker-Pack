  HMP.HTcmSim.Jormag = {
    greenPos = {
      { I:Vector3(20.447, -535.888, 391.723), I:Vector3(33.147, -518.108, 391.723), I:Vector3(-2.412, -518.108, 391.723) },
      { I:Vector3(20.915, -537.524, 391.723), I:Vector3(35.560, -518.108, 391.723), I:Vector3(-4.825, -518.108, 391.723) },
      { I:Vector3(23.741, -547.414, 391.723), I:Vector3(45.847, -518.107, 391.723), I:Vector3(-15.112, -518.107, 391.723) },
    },
    time = {
      40360, -- (1) Interval
      18000, -- (2) Greens
      32000, -- (3) Spread
      9000,  -- (4) Void Pools
      11000, -- (5) Void Pool Breath
      32000, -- (6) Spread Breath
      22900, -- (7) Grasp of Jormag
      47290, -- (8) Icy Spikes of Jormag
      4000,  -- (9) Spawn
    },
    vpBreath = {
      markers = World:CategoryByType("hmpSim.htcm_c1.sc2.d1.atk1"):GetMarkers(),
      pos = {
        { --Start, End positions (Left, Middle, Right)
          { I:Vector3(-5.29625, -535.1885, 391.603),   I:Vector3(-5.997879, -498.2167, 391.603) },
          { I:Vector3(0.02059424, -547.3484, 391.603), I:Vector3(23.0881648686666, -490.4661025, 391.603) },
          { I:Vector3(14.953, -552.558, 391.603),      I:Vector3(44.613, -518.797, 391.603) },
        },
        { --Start, Middle, End
          I:Vector3(15.585, -529.600, 391.603), --South => North
          I:Vector3(2.809,  -516.776, 391.603), --West => East
          I:Vector3(15.585, -504.015, 391.603), --North => South
          I:Vector3(28.410, -516.776, 391.603), --East => West
        },
        { --Center Positions
          I:Vector3(15.584, -513.307, 391.603), --South => North
          I:Vector3(19.109, -516.776, 391.603), --West => East
          I:Vector3(15.585, -520.307, 391.603), --North => South
          I:Vector3(11.800, -516.775, 391.603), --East => West
        },
      },
      dur = { --1st 2nd
        {150, 200},   --Fade-In
        {400, 500},   --Fade-Out
        {2850, 3300}, --Move Duration
        3000 --First Half Total
      },
      set = { {1, 6}, {7, 14} },
      time = 0,
      track = 1,
      radius = 16.2925,
      alpha = {0.75, 0.35},
    },
    graspOfJormag = {
      markers = World:CategoryByType("hmpSim.htcm_c1.sc2.d1.atk2"):GetMarkers(),
      pos = {--Start position, Random position
        {I:Vector3(0, 0, 0), I:Vector3(0, 0, 0), I:Vector3(0, 0, 0), I:Vector3(0, 0, 0), I:Vector3(0, 0, 0),
        I:Vector3(0, 0, 0), I:Vector3(0, 0, 0), I:Vector3(0, 0, 0), I:Vector3(0, 0, 0), I:Vector3(0, 0, 0)},
        {I:Vector3(0, 0, 0), I:Vector3(0, 0, 0), I:Vector3(0, 0, 0), I:Vector3(0, 0, 0), I:Vector3(0, 0, 0),
        I:Vector3(0, 0, 0), I:Vector3(0, 0, 0), I:Vector3(0, 0, 0), I:Vector3(0, 0, 0), I:Vector3(0, 0, 0)}
      },
      direction = {
        I:Vector3(1.48, 2.08, 0), I:Vector3(-0.88, 2.38, 0), I:Vector3(-2.45, 0.65, 0), I:Vector3(-1.95, -1.63, 0), I:Vector3(0.23, -2.53, 0), I:Vector3(2.18, -1.28, 0),
        I:Vector3(2.3, 1.08, 0),  I:Vector3(0.45, 2.5, 0),   I:Vector3(-1.8, 1.8, 0),   I:Vector3(-2.51, -0.45, 0),
      },
      track = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
      dur = { --1st, 2nd
        {125, 300}, --Fade-In
        {150, 450}, --Fade-Out
        {1500, 1000}, --Static Spawn, Move Duration
        1775 --First half total
      },
      time = 0,
      interval = 400,
      radius = 10.22, --skilldef radius: 200
      alpha = {0.75, 0.25},
    },
    spreadBreath = {
      markers = World:CategoryByType("hmpSim.htcm_c1.sc2.d1.atk3"):GetMarkers(),
      pos1 = { --Start, End positions | 32
        { I:Vector3(44.991, -519.001, 391.603), I:Vector3(21.062,  -490.656, 391.603) }, --Top
        { I:Vector3(31.636, -546.178, 391.603), I:Vector3(2.120,   -492.810, 391.603) }, --Middle
        { I:Vector3(0.801,  -546.899, 391.603), I:Vector3(-12.215, -508.711, 391.603) }, --Bottom
      },
      time = 0,
      --Fade-In, Duration, Fade-Out
      dur1 = { 150, 3000, 400 },
      alpha = {0.75, 0.35},
    },
    frostMeteor = {
      markers = World:CategoryByType("hmpSim.htcm_c1.sc2.d1.atk4"):GetMarkers(),
      time = 0,
      addTime = 0,
      track = 0,
      size = {15.2, 30.75},
      alpha = {0.25, 0.9, 0.15},
      --Fade-In, AtkInd dur, AoeInd dur, expand dur, aoe dur, Fade-Out
      dur = {100, 500, 1500, 3000, 6400, 400},
    },
  }

  local D1 = HMP.HTcmSim.Jormag
  local vpBreath, grasp, spBreath, meteor = D1.vpBreath, D1.graspOfJormag, D1.spreadBreath, D1.frostMeteor

  --Resets Variables
  function Reset_HTcm_Jormag()
    local allMarkers = { vpBreath.markers, grasp.markers, spBreath.markers, meteor.markers }
    for a,v in ipairs(allMarkers) do for b,marker in ipairs(v) do marker.InGameVisibility = false end end
  end

  --Jormag's Void Pool Breath
  function HTcm_D1_VoidPoolBreath(curTime, startTime, interval, table, index)
    --Resets variables
    if(not table[index]) then
      for k,v in ipairs(vpBreath.markers) do
        if( k % 2 == 0 ) then v.Tint = HMP.HTcmSim.color[1] else v.Tint = HMP.HTcmSim.color[3] end
      end
      vpBreath.time = startTime
      vpBreath.track = 1
      table[index] = true
    end
    
    --Setting regularly used equations as variables
    local curInt, t, time, vector = vpBreath.time, vpBreath.track, 0, nil
    if(vpBreath.track == 2) then curInt = curInt + vpBreath.dur[4] end
    
    --Fade-In Markers
    if(curTime >= curInt and curTime < curInt + vpBreath.dur[1][t]) then
      for i = vpBreath.set[t][1], vpBreath.set[t][2] do
        vpBreath.markers[i].InGameVisibility = true
        HMPphysics.animate.FadeIn(curTime, curInt, vpBreath.dur[1][t], vpBreath.alpha[((i%2)+1)], vpBreath.markers[i])
        if(t == 2) then vpBreath.markers[i]:SetPos(vpBreath.pos[2][( math.ceil(( i - 6 ) / 2) )]) end
      end
    end
    
    --Moving Markers
    if(t == 1 and curTime >= curInt and curTime < curInt + vpBreath.dur[4]) then
      time = (curTime - curInt)
      local k = 0
      for i = vpBreath.set[1][1], vpBreath.set[1][2] do
        k = math.ceil(i/2)
        vector = HMPphysics.animate.MoveMarker(vpBreath.pos[1][k][1], vpBreath.pos[1][k][2], vpBreath.dur[4], time, 1, 0)
        vpBreath.markers[i]:SetPos(vector)
      end
    end
    if(t == 2 and curTime >= curInt + vpBreath.dur[1][2] and curTime < curInt + vpBreath.dur[1][2] + vpBreath.dur[2][2] + vpBreath.dur[3][2]) then
      time = (curTime - (curInt + vpBreath.dur[1][2]))
      local k = 0
      for i = vpBreath.set[2][1], vpBreath.set[2][2] do
        k = math.ceil(( i - 6 ) / 2)
        vector = HMPphysics.animate.MoveCircle(vpBreath.pos[2][k], vpBreath.pos[3][k], (vpBreath.dur[1][2] + vpBreath.dur[3][2]), time, (math.pi / 2) * (k-1))
        vpBreath.markers[i]:SetPos(vector)
        --If a player gets hit by the Breath, we give them Debilitated
        if( ( Mumble.PlayerCharacter.Position - vpBreath.markers[i].Position ):Length() <= vpBreath.markers[i].Size ) then
          ApplyDebilitated()
        end
      end
    end
    
    --Fade-Out Markers
    if(curTime >= curInt + vpBreath.dur[1][t] + vpBreath.dur[3][t] and curTime < curInt + vpBreath.dur[1][t] + vpBreath.dur[2][t] + vpBreath.dur[3][t]) then
      for i = vpBreath.set[t][1], vpBreath.set[t][2] do
        HMPphysics.animate.FadeOut(curTime, (curInt + vpBreath.dur[1][t] + vpBreath.dur[3][t]), vpBreath.dur[2][t], vpBreath.alpha[((i%2)+1)], vpBreath.markers[i])
        --If a player gets hit by the Breath, we give them Debilitated
        if( ( Mumble.PlayerCharacter.Position - vpBreath.markers[i].Position ):Length() <= vpBreath.markers[i].Size ) then
          ApplyDebilitated()
        end
      end
    end
    
    --Reset/End Script and track increment
    if(t == 1 and curTime >= curInt + vpBreath.dur[4]) then
      for i = vpBreath.set[1][1], vpBreath.set[1][2] do vpBreath.markers[i].InGameVisibility = false end
      vpBreath.track = 2
    end
    if(t == 2 and curTime >= curInt + vpBreath.dur[1][2] + vpBreath.dur[2][2] + vpBreath.dur[3][2]) then
      for i = 1, vpBreath.set[2][1], vpBreath.set[2][2] do vpBreath.markers[i].InGameVisibility = false end
      vpBreath.track = 1
      vpBreath.time = vpBreath.time + interval
    end
  end

  --Grasp of Jormag
  function HTcm_D1_GraspOfJormag(curTime, startTime, interval, table, index)
    --Resets variables
    if(not table[index]) then
      for i = 1, #grasp.track do grasp.track[i] = 0 end
      grasp.time = startTime
      table[index] = true
    end
    
    local a, b, curInt = 0, 0, 0
    for i = 1, #grasp.markers do
      --Setting regularly used equations up
      a, b = math.ceil(i/2), (i%2)+1
      if(grasp.track[a] < 4) then curInt = grasp.time + ( grasp.interval * (a - 1) )
      else curInt = grasp.time + ( grasp.interval * (a - 1) ) + grasp.dur[4] end
      
      --Placing markers around the player
      if(grasp.track[a] == 0 and curTime >= curInt) then
        for k = 0, 1 do
          grasp.markers[i+k].Tint = HMP.HTcmSim.color[2]
          grasp.markers[i+k].InGameVisibility = true
          grasp.markers[i+k]:SetPos(Mumble.PlayerCharacter.Position + grasp.direction[a])
        end
        grasp.track[a] = 1
      end
      
      --Fade-In Markers
      if(grasp.track[a] == 1 and curTime >= curInt or grasp.track[a] == 4 and curTime >= curInt and curTime < curInt + grasp.dur[1][2]) then
        HMPphysics.animate.FadeIn(curTime, curInt, grasp.dur[1][(math.ceil(grasp.track[a]/2))], grasp.alpha[b], grasp.markers[i])
        if(grasp.track[a] == 1 and curTime >= curInt + grasp.dur[1][1]) then grasp.track[a] = 2 end
      end
      
      --Fade-Out Markers
      if(grasp.track[a] == 2 and curTime >= curInt + grasp.dur[1][1] + grasp.dur[3][1] or grasp.track[a] == 5) then
        local v = math.floor(grasp.track[a] / 2)
        HMPphysics.animate.FadeOut(curTime, (curInt + grasp.dur[1][v] + grasp.dur[3][v]), grasp.dur[2][v], grasp.alpha[b], grasp.markers[i])
        if(curTime >= curInt + grasp.dur[1][v] + grasp.dur[2][v] + grasp.dur[3][v]) then grasp.track[a] = grasp.track[a] + 1 end
      end
      
      --Randomizing and saving positions
      if(grasp.track[a] == 3) then
        curInt = grasp.time + ( grasp.interval * (a - 1) ) + grasp.dur[4]
        grasp.markers[i].Tint = HMP.HTcmSim.color[3]
        grasp.markers[i+1].Tint = HMP.HTcmSim.color[1]
        grasp.pos[1][a] = grasp.markers[i].Position
        grasp.pos[2][a] = Utility.Position.randomXYedge(grasp.markers[i].Position, grasp.radius)
        grasp.track[a] = 4
      end
      
      --Moving Markers
      if(grasp.track[a] == 4) then
        local time = curTime - curInt
        local vector = HMPphysics.animate.MoveMarker(grasp.pos[1][a], grasp.pos[2][a], (grasp.dur[1][2] + grasp.dur[3][2]), time, 1, 0)
        grasp.markers[i]:SetPos(vector)
        if(curTime >= curInt + grasp.dur[1][2] + grasp.dur[3][2]) then grasp.track[a] = 5 end
      end
      
      --Ends / Resets the Script for the next Grasp set
      if(grasp.track[10] == 6) then
        for c = 1, 2 do for d = 1, #grasp.pos[a] do grasp.pos[c][d] = I:Vector3(0, 0, 0) end end
        for k = 1, #grasp.track do grasp.track[k] = 0 end
        grasp.time = grasp.time + interval
      end
    end
  end

  --Jormag's Spread Breath
  function HTcm_D1_SpreadBreath(curTime, startTime, interval, table, index)
    --Resets variables
    if(not table[index]) then
      for i = 1, #spBreath.markers do
        if( i % 2 == 0 ) then
          spBreath.markers[i].Tint = HMP.HTcmSim.color[1]
        else
          spBreath.markers[i].Tint = HMP.HTcmSim.color[3]
        end
      end
      spBreath.time = startTime
      table[index] = true
    end
    
    --Fade-In Marker
    if(curTime >= spBreath.time and curTime < spBreath.time + spBreath.dur1[1]) then
      for i = 1, 6 do
        spBreath.markers[i].InGameVisibility = true
        HMPphysics.animate.FadeIn(curTime, spBreath.time, spBreath.dur1[1], spBreath.alpha[(i%2)+1], spBreath.markers[i])
      end
    end
    
    --Moves Marker
    if(curTime >= spBreath.time and curTime < spBreath.time + spBreath.dur1[2]) then
      local time, vector = (curTime - spBreath.time), nil
      for i = 1, 6 do
        local k = math.ceil(i/2)
        vector = HMPphysics.animate.MoveMarker(spBreath.pos1[k][1], spBreath.pos1[k][2], spBreath.dur1[2], time, 1, 0)
        spBreath.markers[i]:SetPos(vector)
      end
    end
    
    --Fade-Out Marker
    if(curTime >= spBreath.time + spBreath.dur1[2] and curTime < spBreath.time + spBreath.dur1[2] + spBreath.dur1[3]) then
      for i = 1, 6 do
        HMPphysics.animate.FadeOut(curTime, (spBreath.time + spBreath.dur1[2]), spBreath.dur1[3], spBreath.alpha[(i%2)+1], spBreath.markers[i])
      end
    --Ends / Resets Spread Breath
    elseif(curTime >= spBreath.time + spBreath.dur1[2] + spBreath.dur1[3]) then
      for i = 1, 6 do spBreath.markers[i].InGameVisibility = false end
      spBreath.time = spBreath.time + interval
    end
  end

  --Jormag's Frost Meteor
  function HTcm_D1_FrostMeteor(curTime, startTime, interval, table, index)
    --Resets variables
    if(not table[index]) then
      for i = 2, #meteor.markers do
        meteor.markers[i].Tint = HMP.HTcmSim.color[2]
        if(i == #meteor.markers) then
          meteor.markers[i].Tint = HMP.HTcmSim.color[3]
        end
      end
      meteor.time = startTime
      meteor.track = 0
      meteor.addTime = 0
      table[index] = true
    end
    
    --Fade-In Marker
    if(meteor.track == 0 and curTime >= meteor.time and curTime < meteor.time + meteor.dur[1]) then
      for i = 1, #meteor.markers do
        meteor.markers[i].InGameVisibility = true
        if(i == 2 or i == 3) then
          meteor.markers[i].Size = meteor.size[1]
          HMPphysics.animate.FadeIn(curTime, meteor.time, meteor.dur[1], meteor.alpha[((i%2)+1)], meteor.markers[i])
        end
      end
    end
    
    --Grows Marker
    if(meteor.track == 0 and curTime >= meteor.time and curTime < meteor.time + meteor.dur[2]) then
      HMPphysics.animate.SizeGrow(curTime, meteor.time, meteor.dur[2], 0.025, HMP.HTcmSim.General.orb.size[#HMP.HTcmSim.General.orb.size], meteor.markers[1])
    elseif(meteor.track == 0 and curTime >= meteor.time + meteor.dur[2]) then meteor.markers[1].InGameVisibility = false end
    
    --Shoots Projectile
    if(meteor.track == 0 and curTime >= meteor.time and curTime < meteor.time + meteor.dur[3]) then
      local time, vector = (curTime - meteor.time), nil
      vector = HMPphysics.animate.MoveMarker(I:Vector3(HMP.HTcmSim.Enemies.hitbox.pos.X, HMP.HTcmSim.Enemies.hitbox.pos.Y, 396.723), meteor.markers[1].Position, meteor.dur[3], time, 2, 0)
      meteor.markers[4]:SetPos(vector)
      
    --Prepares for Part 2 of Frost Meteor
    elseif(meteor.track == 0 and curTime >= meteor.time + meteor.dur[3]) then
      for i = 3, 4 do meteor.markers[i].InGameVisibility = false end
      meteor.markers[2].Tint = HMP.HTcmSim.color[3]
      meteor.markers[2].Alpha = meteor.alpha[3]
      meteor.addTime = meteor.dur[3]
      meteor.track = 1
    end
    
    --Grows Marker
    if(meteor.track == 1 and curTime >= meteor.time + meteor.addTime and curTime < meteor.time + meteor.addTime + meteor.dur[4]) then
      HMPphysics.animate.SizeGrow(curTime, (meteor.time + meteor.addTime), meteor.dur[4], 0.025, meteor.size[2], meteor.markers[2])
    elseif(meteor.track == 1 and curTime >= meteor.time + meteor.addTime + meteor.dur[4]) then
      meteor.addTime = meteor.addTime + meteor.dur[4]
      meteor.track = 2
    end
    
    --Fade-Out Marker
    if(meteor.track == 2 and curTime >= meteor.time + meteor.addTime + meteor.dur[5]) then
      HMPphysics.animate.FadeOut(curTime, (meteor.time + meteor.addTime + meteor.dur[5]), meteor.dur[6], meteor.alpha[3], meteor.markers[2])
    end
    
    --Ends/Resets Frost Meteor
    if(meteor.track == 2 and curTime >= meteor.time + meteor.addTime + meteor.dur[5] + meteor.dur[6]) then
      meteor.markers[2].InGameVisibility = false
      meteor.markers[2].Tint = HMP.HTcmSim.color[2]
      meteor.addTime = 0
      meteor.track = 0
      meteor.time = meteor.time + interval
    end
  end