HMP.HTcmSim.SooWon = {
  greenPos = {
    { I:Vector3(28.067, -513.028, 391.723), I:Vector3(22.987, -523.188, 391.723), I:Vector3(17.907, -540.968, 391.723) },
    { I:Vector3(17.907, -540.968, 391.723), I:Vector3(32.909, -529.802, 391.723), I:Vector3(34.941, -510.278, 391.723) },
    { I:Vector3(18.734, -548.402, 391.723), I:Vector3(43.668, -506.789, 391.723), I:Vector3(40.729, -535.016, 391.723) },
  },
  track = {
    0, -- (3) vp track
    0, -- (4) wave track
    nil, -- (5) where the wave spawns
  },
  vpInt = { 21800, 23870 }, --First, Second
  delay = 5000, --Time delay between P1 and P2
  time = {
    45670, -- (1) Interval
    15500, -- (2) Greens
    25000, -- (3) Spread
    15500, -- (4) Void Pools
    17100, -- (5) Tsunami Wave
    27000, -- (6) Claw Slap
    42300, -- (7) Tail Slam
    54603, -- (8) Void Beam
    12000, -- (9) Spawn
  },
  magicHail = {
    markers = World:CategoryByType("hmpSim.htcm_c1.sc2.d6.atk6"):GetMarkers(),
    size = {2.5, 0.5},
    dur = 1750,
  },
  tsunamiWave = {
    markers = World:CategoryByType("hmpSim.htcm_c1.sc2.d6.atk2"):GetMarkers(),
    time = 0,
    dur = {1, 500},
    mhDur = 1750,
    size = 57.6065
  },
  clawSlap = {
    markers = World:CategoryByType("hmpSim.htcm_c1.sc2.d6.atk3"):GetMarkers(),
    startPos = {
      I:Vector3(-0.994, -545.397, 391.723), I:Vector3(2.405, -538.594, 391.723),  I:Vector3(7.448, -532.901, 391.723),  I:Vector3(13.793, -528.708, 391.723),
      I:Vector3(21.006, -526.299, 391.723), I:Vector3(28.598, -525.840, 391.723), I:Vector3(36.050, -527.362, 391.723), I:Vector3(42.854, -530.760, 391.723),
    },
    time = {0, 2000},
    track = 1,
    dur = {500, 1300, 2100, 3000},
    mhAmt = { {13, 28}, {29, 40}, {41, 48}, {49, 52}, }
  },
  tailSlam = {
    markers = World:CategoryByType("hmpSim.htcm_c1.sc2.d6.atk4"):GetMarkers(),
    time = 0,
    dur = {250, 1000, 1500},
    mhDur = 1750,
    size = 36.9
  },
  voidBeam = {
    markers = World:CategoryByType("hmpSim.htcm_c1.sc2.d6.atk5"):GetMarkers(),
    start = {
      0, 123, 242, 394, 513, 513, 636, 671, 761, 793,
      918, 1033, 1163, 1194, 1311, 1363, 1404, 1441, 1554, 1592,
      1729, 1846, 1957, 1994, 2076, 2120, 2257, 2257, 2284, 2349,
      2391, 2524, 2631, 2713, 2756, 2799, 2937, 3052, 3156, 3200,
      3313, 3313, 3400, 3434, 3520, 3597, 3734, 3845, 4554, 4759
    },
    dur = 4000,
    time = 0,
  },
  wave = {
    markers = World:CategoryByType("hmpSim.htcm_c1.sc2.d6.atk1"):GetMarkers(),
    attr = {
      minSize = { 3.3562, 3.341, 3.329, 3.318, 3.304, 3.29, 3.275, 3.259, 3.242, 3.224, 3.205, 3.185, 3.164, 3.142, 3.119, 3.095, 3.07, 3.047, 3.026, 3.007, 2.9925, 2.9762, 2.96, 2.9444, 2.9268, 2.9058, 2.8847, 2.8609, 2.8386, 2.8147, 2.7897, 2.7685, 2.7446, 2.722, 2.6997, 2.674, 2.6448, 2.616, 2.5837, 2.5402, 2.4903, 2.4248, 2.3646, 2.3103, 2.2596, 2.1817, 2.091, 1.993, 1.884, 1.77 },
      maxSize = { 56.8725, 56.671128, 56.469756, 56.268384, 56.067012, 55.86564, 55.664268, 55.462896, 55.261524, 55.060152, 54.85878, 54.657408, 54.456036, 54.254664, 54.053292, 53.85192, 53.650548, 53.449176, 53.247804, 53.046432, 52.84506, 52.643688, 52.442316, 52.240944, 52.039572, 51.8382, 51.636828, 51.435456, 51.234084, 51.032712, 50.83134, 50.629968, 50.428596, 50.227224, 50.025852, 49.82448, 49.623108, 49.421736, 49.220364, 49.018992, 48.81762, 48.616248, 48.414876, 48.213504, 48.012132, 47.81076, 47.609388, 47.408016, 47.206644, 47.005272 },
      heightNums = { 391.723, 391.745, 391.767, 391.7927, 391.827, 391.863, 391.903, 391.947, 391.995, 392.047, 392.103, 392.163, 392.221, 392.277, 392.331, 392.383, 392.433, 392.473, 392.503, 392.523, 392.5357, 392.5457, 392.554, 392.5607, 392.5636, 392.5628, 392.5566, 392.5426, 392.523, 392.4954, 392.454, 392.4136, 392.363, 392.3155, 392.27, 392.221, 392.174, 392.1356, 392.089, 392.0397, 391.994, 391.94, 391.896, 391.866, 391.845, 391.817, 391.789, 391.765, 391.742, 391.723 },
      time = {0, 0},
    },
    interval = {
      25200, --wave interval 2 (tail slam - tsunami wave)
      20470, --wave interval 1 ( (interval + tsunami wave) - tail slam)
    },
    time = 0,
    duration = 5000,
    alpha = 0.8,
  }
}

local D6 = HMP.HTcmSim.SooWon
local tw, cs, ts, vb, mh, wave = D6.tsunamiWave, D6.clawSlap, D6.tailSlam, D6.voidBeam, D6.magicHail, D6.wave

function Reset_HTcm_SooWon()
  local allMarkers = { tw.markers, cs.markers, ts.markers, vb.markers, mh.markers, wave.markers }
  for i = 1, #allMarkers do for k = 1, #allMarkers[i] do allMarkers[i][k].InGameVisibility = false end end
  D6.track = { 0, 0, nil }
end

--Delay is a boolean; true to add delay for P2, false to reset times back to P1
function HTcm_D6_UpdateTimes(delay)
  if(delay) then
    D6.delay = 5000
    for i = 2, #D6.time do
      if(i < #D6.time) then
        D6.time[i] = D6.time[i] - D6.delay
      else
        D6.time[i] = 0
      end
    end
  else
    D6.delay = 0
    D6.time = { 45670, 15500, 25000, 15500, 17100, 27000, 42300, 54603, 12000 }
  end
end

--Soo-Won's Wave
function HTcm_D6_Wave(curTime, startTime, interval, table, index, pos)
  --Resets variables
  if(not table[index]) then
    wave.alpha = 0.8
    for i = 1, #wave.markers do
      wave.markers[i].InGameVisibility = false
      wave.markers[i].Tint = I:Color(0, 200-(i*2), 255, 255)
      wave.markers[i].Alpha = wave.alpha
      wave.alpha = wave.alpha - 0.01
    end
    wave.time = startTime
    table[index] = true
  end
  
  if(curTime >= wave.time) then
    --Shows and Grows Markers
    for i = 1, #wave.markers do
      wave.markers[i].InGameVisibility = true
      wave.markers[i]:SetPos(pos.Position.X, pos.Position.Y, wave.attr.heightNums[i])
      HMPphysics.animate.SizeGrow(curTime, wave.time, wave.duration, wave.attr.minSize[i], wave.attr.maxSize[i], wave.markers[i])
    end
    --Hides Markers, Ends/Resets the Script
    if(curTime >= wave.time + wave.duration) then
      for i = 1, #wave.markers do wave.markers[i].InGameVisibility = false end
      wave.time = wave.time + interval
      wave.alpha = 0.8
    end
  end
end

--Tsunami Wave
function HTcm_D6_TsunamiWave(curTime, startTime, interval, table, index)
  --Resets variables
  if(not table[index]) then
    for i = 2, #tw.markers do tw.markers[i].Tint = HMP.HTcmSim.color[2] end
    tw.time = startTime
    tw.dur[1] = 1
    table[index] = true
  end
  
  if(curTime >= tw.time) then
    --Shows, Hides, and Grows the Attack Indicator
    if(curTime >= tw.time + ((tw.dur[1] - 1) * tw.dur[2])and curTime < tw.time + (tw.dur[1] * tw.dur[2])) then
      for i = 1, 3 do tw.markers[i].InGameVisibility = true end
      HMPphysics.animate.SizeGrow(curTime, (tw.time + ((tw.dur[1] - 1) * tw.dur[2])), tw.dur[2], 0.025, tw.size, tw.markers[1])
    elseif(curTime >= tw.time + (tw.dur[1] * tw.dur[2])) then
      tw.dur[1] = 3
      tw.markers[1].InGameVisibility = false
    end
    
    --Shows Magic Hail AoE's and Moves their Projectiles
    if(curTime > tw.time + (tw.dur[2] * 3) and curTime <= tw.time + (tw.dur[2] * 3) + tw.mhDur) then
      for i = 1, 3 do tw.markers[i].InGameVisibility = false end
      for i = 4, #tw.markers do tw.markers[i].InGameVisibility = true end
      local vector, time = nil, curTime - (tw.time + (tw.dur[1] * tw.dur[2]))
      for i = 1, 5 do
        mh.markers[i].InGameVisibility = true
        mh.markers[i].Size = mh.size[1]
        vector = HMPphysics.animate.MoveMarker(I:Vector3(tw.markers[2].Position.X, tw.markers[2].Position.Y, 393.723), tw.markers[(2 + (i * 2))].Position, tw.mhDur, time, 3, 394.723)
        mh.markers[i]:SetPos(vector)
      end
    end
    
    --Hides All Markers, Ends/Resets the Script
    if(curTime > tw.time + (tw.dur[2] * 3) + tw.mhDur) then
      for i = 4, #tw.markers do tw.markers[i].InGameVisibility = false end
      for i = 1, 5 do mh.markers[i].InGameVisibility = false end
      tw.dur[1] = 1 tw.time = tw.time + interval
    end
  end
end

--Claw Slap
function HTcm_D6_ClawSlap(curTime, startTime, interval, table, index)
  --Resets Variables
  if(not table[index]) then
    for i = 1, #cs.markers do
      if(i < 5 or i > 12) then
        cs.markers[i].Tint = HMP.HTcmSim.color[2]
      end
    end
    cs.time[1] = startTime
    cs.track = 1
    table[index] = true
  end
  
  if(curTime >= cs.time[1]) then
    local vector, time, t, m1, m2 = nil, 0, cs.track, nil, nil
    if(curTime >= cs.time[1] and curTime < cs.time[1] + cs.time[2]) then
      for i = 1, 12 do cs.markers[i].InGameVisibility = true end
    elseif(curTime >= cs.time[1] + cs.time[2] and curTime < cs.time[1] + cs.time[2] + cs.dur[1]) then
      for i = 1, 12 do cs.markers[i].InGameVisibility = false end
      if( ( Mumble.PlayerCharacter.Position - cs.markers[1].Position ):Length() <= cs.markers[3].Size and World:CategoryByType("hmpSim.htcm_c1.sc4.ps_2"):IsVisible() ) then
        ApplyDeath(Mumble.PlayerCharacter.Position)
      end
    end
    
    if(curTime >= cs.time[1] + cs.time[2] and curTime < cs.time[1] + cs.time[2] + cs.dur[t]) then
      for i = cs.mhAmt[t][1], cs.mhAmt[t][2] do
        cs.markers[i].InGameVisibility = true
      end
      for i = t, (9-t) do
        m1 = cs.markers[(cs.mhAmt[t][1] - (((t-1)*2)+1) + (i*2))]
        mh.markers[i].InGameVisibility = true
        mh.markers[i].Size = mh.size[2]
        if(t == 1) then
          time = curTime - (cs.time[1] + cs.time[2])
          vector = HMPphysics.animate.MoveMarker(I:Vector3(cs.startPos[i].X, cs.startPos[i].Y, 392.223), I:Vector3(m1.Position.X, m1.Position.Y, 390.223), cs.dur[1], time, 2, 0)
        else
          time = curTime - (cs.time[1] + cs.time[2] + cs.dur[(t-1)])
          m2 = cs.markers[(cs.mhAmt[(t-1)][1] - (((t-2)*2)+1) + (i*2))]
          vector = HMPphysics.animate.MoveMarker(I:Vector3(m2.Position.X, m2.Position.Y, 390.223), I:Vector3(m1.Position.X, m1.Position.Y, 390.223), (cs.dur[t] - cs.dur[(t-1)]), time, 3, 392.223)
        end
        mh.markers[i]:SetPos(vector)
      end
    elseif(curTime >= cs.time[1] + cs.time[2] + cs.dur[t]) then
      for i = cs.mhAmt[t][1], cs.mhAmt[t][2] do cs.markers[i].InGameVisibility = false end
      mh.markers[t].InGameVisibility = false
      mh.markers[(9-t)].InGameVisibility = false
      cs.track = cs.track + 1
      if(cs.track == 5) then
        cs.track = 1
        cs.time[1] = cs.time[1] + interval
      end
    end
  end
end

--Tail Slam
function HTcm_D6_TailSlam(curTime, startTime, interval, table, index)
  --Resets variables
  if(not table[index]) then
    for i = 2, #ts.markers do ts.markers[i].Tint = HMP.HTcmSim.color[2] end
    ts.time = startTime
    table[index] = true
  end
  
  if(curTime >= ts.time) then
    --Shows, Grows, then Hides the Attack Indicator
    if(curTime >= ts.time and curTime < ts.time + ts.dur[1]) then
      for i = 1, 3 do ts.markers[i].InGameVisibility = true end
      HMPphysics.animate.SizeGrow(curTime, ts.time, ts.dur[1], 0.025, ts.size, ts.markers[1])
    elseif(curTime >= ts.time + ts.dur[1]) then
      ts.markers[1].InGameVisibility = false
    end
    
    --Shows, Grows, then Hides the Attack Indicator
    if(curTime >= ts.time + ts.dur[2] and curTime < ts.time + ts.dur[1] + ts.dur[2]) then
      ts.markers[1].InGameVisibility = true
      HMPphysics.animate.SizeGrow(curTime, (ts.time + ts.dur[2]), ts.dur[1], 0.025, ts.size, ts.markers[1])
    elseif(curTime >= ts.time + ts.dur[1] + ts.dur[2]) then
      ts.markers[1].InGameVisibility = false
    end
    
    --Hides and Shows Markers. Moves Projectiles
    if(curTime >= ts.time + ts.dur[3]) then
      for i = 2, 3 do ts.markers[i].InGameVisibility = false end
      for i = 4, #ts.markers do ts.markers[i].InGameVisibility = true end
      local vector, time = nil, (curTime - (ts.time + ts.dur[3]))
      for i = 1, 5 do
        mh.markers[i].InGameVisibility = true
        mh.markers[i].Size = mh.size[1]
        vector = HMPphysics.animate.MoveMarker(I:Vector3(ts.markers[2].Position.X, ts.markers[2].Position.Y, 393.723), ts.markers[(2 + (i * 2))].Position, ts.mhDur, time, 3, 394.723)
        mh.markers[i]:SetPos(vector)
      end
    end
    
    --Hides Markers. Ends/Resets the Script
    if(curTime >= ts.time + ts.dur[3] + ts.mhDur) then
      for i = 4, #ts.markers do ts.markers[i].InGameVisibility = false end
      for i = 1, 5 do mh.markers[i].InGameVisibility = false end
      ts.time = ts.time + interval
    end
  end
end

--Void Beam
function HTcm_D6_VoidBeam(curTime, startTime, interval, table, index)
  if(not table[index]) then
    for i = 1, #vb.markers do vb.markers[i].Tint = HMP.HTcmSim.color[5] end
    vb.time = startTime
    table[index] = true
  end
  
  if(curTime >= startTime) then
    local m = 0
    for _, marker in ipairs(vb.markers) do
      m = math.ceil(_/2)
      if(curTime >= vb.time + vb.start[m] and curTime <= vb.time + vb.start[m] + vb.dur) then
        marker.InGameVisibility = true
      else
        marker.InGameVisibility = false
      end
    end
    if(curTime > vb.time + vb.start[#vb.start] + vb.dur) then vb.time = vb.time + interval end
  end
end