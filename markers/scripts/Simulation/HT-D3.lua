HMP.HTcmSim.Kralkatorrik = {
  time = {
    25250, -- (1) Interval | 12625
    27500, -- (2) Void Pool Start
    14800, -- (3) Branding Beam (Sides)
    27500, -- (4) Branding Beam (Center)
    22000, -- (5) Crystal Barrage Start (interval is half)
    10000, -- (6) Spawn
  },
  beamStats = {
    start = {0, 280, 560, 840, 1120, 1400, 1680, 1960},
    --Spawn-in, static size time, size increase, beam duration, fade-out
    dur = {2200, 260, 170, 4120, 1000},
    size = {9.15, 9.65}, --18.3 / 19.3 for branding beam size
  },
  sideBeams = {
    markers = World:CategoryByType("hmpSim.htcm_c1.sc2.d3.atk1"):GetMarkers(),
    addTime = {0, 0, 0, 0, 0, 0, 0, 0},
    track = {0, 0, 0, 0, 0, 0, 0, 0},
    time = 0,
  },
  centerBeam = {
    markers = World:CategoryByType("hmpSim.htcm_c1.sc2.d3.atk2"):GetMarkers(),
    addTime = {0, 0, 0, 0, 0, 0, 0, 0},
    track = {0, 0, 0, 0, 0, 0, 0, 0},
    time = 0,
  },
  crystalBarrage = {
    markers = World:CategoryByType("hmpSim.htcm_c1.sc2.d3.atk3.sc1"):GetMarkers(),
    proj    = World:CategoryByType("hmpSim.htcm_c1.sc2.d3.atk3.sc2"):GetMarkers(),
    track = {0, 0, 0, 0},
    time =  {0, 0, 0, 0},
    delay = {0, 0, 0, 0},
    sum = {0, 0},
    setDelay = {1200, 1750},
    duration = 3000,
    projDur = 2000,
  }
}

local D3, D0, D0e = HMP.HTcmSim.Kralkatorrik, HMP.HTcmSim.General, HMP.HTcmSim.Enemies
local side, center, cb, beam = D3.sideBeams, D3.centerBeam, D3.crystalBarrage, D3.beamStats

function Reset_HTcm_Kralkatorrik()
  local allMarkers = { side.markers, center.markers, cb.markers, cb.proj }
  for i = 1, #allMarkers do for k = 1, #allMarkers[i] do allMarkers[i][k].InGameVisibility = false end end
end

--Side Beams
function HTcm_D3_SideBeams(curTime, startTime, interval, table, index)
  --Resets variables
  if(not table[index]) then
    for k = 1, #side.track do
      side.addTime[k] = beam.dur[1]
      side.track[k] = 0
    end
    for i = 1, 2 do
      side.markers[i].Tint = HMP.HTcmSim.color[2]
      side.markers[i+10].Tint = HMP.HTcmSim.color[2]
    end
    side.time = startTime
    table[index] = true
  end
  
  for i = 1, 8 do
    local a, b = i+2, i+12
    --Shows initial Attack Indicators
    if(side.track[1] == 0 and curTime >= side.time) then
      for k = 1, 2 do
        side.markers[k].InGameVisibility = true
        side.markers[(k+10)].InGameVisibility = true
      end
      for k = 1, 8 do side.track[k] = 1 end
    end
    
    --Hides initial Attack Indicators
    if(side.track[i] == 1 and curTime >= side.time + side.addTime[i] + beam.start[i] and curTime < side.time + side.addTime[i] + beam.start[i] + beam.dur[2]) then
      for k = 1, 2 do
        side.markers[k].InGameVisibility = false
        side.markers[(k+10)].InGameVisibility = false
      end
      for k = a, b, 10 do side.markers[k].InGameVisibility = true end
      side.addTime[i] = side.addTime[i] + beam.start[i]
      side.track[i] = 2
    end
    
    --Fade-In Markers
    if(side.track[i] == 2 and curTime >= side.time + side.addTime[i] and curTime < side.time + side.addTime[i] + beam.dur[2] + beam.dur[3]) then
      for k = a, b, 10 do HMPphysics.animate.FadeIn(curTime, (side.time + side.addTime[i]), (beam.dur[2] + beam.dur[3]), 1, side.markers[k]) end
    end
    
    --Grows Markers
    if(side.track[i] == 2 and curTime >= side.time + side.addTime[i] + beam.dur[2] and curTime < side.time + side.addTime[i] + beam.dur[2] + beam.dur[3]) then
      for k = a, b, 10 do HMPphysics.animate.SizeGrow(curTime, (side.time + side.addTime[i] + beam.dur[2]), beam.dur[3], beam.size[1], beam.size[2], side.markers[k]) end
    elseif(side.track[i] == 2 and curTime >= side.time + side.addTime[i] + beam.dur[2] + beam.dur[3]) then
      side.addTime[i] = side.addTime[i] + beam.dur[2] + beam.dur[3] + beam.dur[4]
      side.track[i] = 3
    end
    
    --Fade-Out Markers
    if(side.track[i] == 3 and curTime >= side.time + side.addTime[i] and curTime < side.time + side.addTime[i] + beam.dur[5]) then
      for k = a, b, 10 do HMPphysics.animate.FadeOut(curTime, (side.time + side.addTime[i]), beam.dur[5], 1, side.markers[k]) end
    elseif(side.track[i] == 3 and curTime >= side.time + side.addTime[i] + beam.dur[5]) then
      side.track[i] = 4
      for k = a, b, (b-2) do
        side.markers[k].InGameVisibility = false
        side.markers[k].Size = beam.size[1]
      end
      --Ends/Resets the Script
      if(i == 8) then
        for k = 1, #side.addTime do
          side.addTime[k] = beam.dur[1]
          side.track[k] = 0
        end
        side.time = side.time + interval
      end
    end
    --If a player touches a beam, we down them
    if( side.markers[a].InGameVisibility == true and side.markers[a].Alpha > 0.5 and ( Mumble.PlayerCharacter.Position - side.markers[a].Position ):Length() < side.markers[a].Size and World:CategoryByType("hmpSim.htcm_c1.sc4.ps_1"):IsVisible() ) then ApplyDowned(Mumble.PlayerCharacter.Position) end
    if( side.markers[b].InGameVisibility == true and side.markers[b].Alpha > 0.5 and ( Mumble.PlayerCharacter.Position - side.markers[b].Position ):Length() < side.markers[b].Size and World:CategoryByType("hmpSim.htcm_c1.sc4.ps_1"):IsVisible() ) then ApplyDowned(Mumble.PlayerCharacter.Position) end
  end
end

--Center Beam
function HTcm_D3_CenterBeam(curTime, startTime, interval, table, index)
  --Resets variables
  if(not table[index]) then
    for k = 1, #center.track do
      center.addTime[k] = beam.dur[1]
      center.track[k] = 0
    end
    for i = 1, 2 do
      center.markers[i].Tint = HMP.HTcmSim.color[2]
    end
    center.time = startTime
    table[index] = true
  end
  
  for i = 1, 8 do
    local a = i+2
    --Shows initial Attack Indicators
    if(center.track[1] == 0 and curTime >= center.time) then
      for k = 1, 2 do center.markers[k].InGameVisibility = true end
      for k = 1, 8 do center.track[k] = 1 end
    end
    
    --Hides initial Attack Indicators
    if(center.track[i] == 1 and curTime >= center.time + center.addTime[i] + beam.start[i] and curTime < center.time + center.addTime[i] + beam.start[i] + beam.dur[2]) then
      for k = 1, 2 do center.markers[k].InGameVisibility = false end
      center.markers[a].InGameVisibility = true
      center.addTime[i] = center.addTime[i] + beam.start[i]
      center.track[i] = 2
    end
    
    --Fade-In Markers
    if(center.track[i] == 2 and curTime >= center.time + center.addTime[i] and curTime < center.time + center.addTime[i] + beam.dur[2] + beam.dur[3]) then
      HMPphysics.animate.FadeIn(curTime, (center.time + center.addTime[i]), (beam.dur[2] + beam.dur[3]), 1, center.markers[a])
    end
    
    --Grows Markers
    if(center.track[i] == 2 and curTime >= center.time + center.addTime[i] + beam.dur[2] and curTime < center.time + center.addTime[i] + beam.dur[2] + beam.dur[3]) then
      HMPphysics.animate.SizeGrow(curTime, (center.time + center.addTime[i] + beam.dur[2]), beam.dur[3], beam.size[1], beam.size[2], center.markers[a])
    elseif(center.track[i] == 2 and curTime >= center.time + center.addTime[i] + beam.dur[2] + beam.dur[3]) then
      center.addTime[i] = center.addTime[i] + beam.dur[2] + beam.dur[3] + beam.dur[4]
      center.track[i] = 3
    end
    
    --Fade-Out Markers
    if(center.track[i] == 3 and curTime >= center.time + center.addTime[i] and curTime < center.time + center.addTime[i] + beam.dur[5]) then
      HMPphysics.animate.FadeOut(curTime, (center.time + center.addTime[i]), beam.dur[5], 1, center.markers[a])
    elseif(center.track[i] == 3 and curTime >= center.time + center.addTime[i] + beam.dur[5]) then
      center.track[i] = 4
      center.markers[a].InGameVisibility = false
      center.markers[a].Size = beam.size[1]
      --Ends/Resets the Script
      if(i == 8) then
        for k = 1, #center.addTime do
          center.addTime[k] = beam.dur[1]
          center.track[k] = 0
        end
        center.time = center.time + interval
      end
    end
    --If a player touches the beam, we down them
    if( center.markers[a].InGameVisibility == true and center.markers[a].Alpha > 0.5 and ( Mumble.PlayerCharacter.Position - center.markers[a].Position ):Length() < center.markers[a].Size and World:CategoryByType("hmpSim.htcm_c1.sc4.ps_1"):IsVisible() ) then ApplyDowned(Mumble.PlayerCharacter.Position) end
  end
end

--Crystal Barrage
function HTcm_D3_CrystalBarrage(curTime, startTime, interval, table, index)
  --Resets variables
  if(not table[index]) then
    for i = 1, #cb.track do
      cb.track[i] = 0
      cb.time[i] = startTime
      cb.delay[i] = 0
      cb.sum[(math.floor(i/2) + 1)] = 0
    end
    for i = 1, #cb.markers do
      cb.markers[i].Tint = HMP.HTcmSim.color[2]
    end
    table[index] = true
  end
  
  for i = 2, 8, 2 do
    local a, b = i-1, i/2
    --Randomizing spawn positions and time delays
    if(cb.track[b] == 0 and curTime >= cb.time[b]) then
      local L = #D0.orb.size
      cb.markers[i].Position = Utility.Position.randomXZ(D0.orb.pos[1], D0.orb.size[L])
      cb.markers[a].Position = cb.markers[i].Position
      if(i <= 4) then
        cb.delay[b] = math.random(cb.sum[1], b * 250)
        cb.sum[1] = cb.sum[1] + cb.delay[b]
        if(i == 4) then cb.sum[2] = math.random(cb.setDelay[1], cb.setDelay[2]) cb.sum[1] = cb.sum[2] end
      else
        cb.delay[b] = math.random(cb.sum[1], cb.sum[1] + ((b - 2) * 250))
        cb.sum[1] = cb.delay[b]
      end
      cb.track[b] = 1
    end
    
    --Shows Markers
    if(cb.track[b] == 1 and curTime >= cb.time[b] + cb.delay[b] and curTime <= cb.time[b] + cb.delay[b] + cb.duration) then
      for k = a, i do cb.markers[k].InGameVisibility = true end
      cb.track[b] = 2
    end
    
    --Moves Projectile Markers
    if(cb.track[b] == 2 and curTime >= cb.time[b] + cb.delay[b] + (cb.duration - cb.projDur) and curTime <= cb.time[b] + cb.delay[b] + cb.duration) then
      local time = (curTime - (cb.time[b] + cb.delay[b] + (cb.duration - cb.projDur)))
      local vector = HMPphysics.animate.MoveMarker(I:Vector3(D0e.hitbox.pos.X, D0e.hitbox.pos.Y, 401.723), cb.markers[i].Position, cb.projDur, time, 2, 0)
      cb.proj[b].InGameVisibility = true
      cb.proj[b]:SetPos(vector)
      --cb.proj[b]:SetRotY(4.27606 + ((cb.proj[b].Position - I:Vector3(cb.markers[i].Position.X, cb.markers[i].Position.Y, 391.723)):Length() / 120))
    end
    
    --Hides Markers
    if(cb.track[b] == 2 and curTime > cb.time[b] + cb.delay[b] + cb.duration) then
      for k = a, i do cb.markers[k].InGameVisibility = false end
      cb.proj[b].InGameVisibility = false
      --Ends/Resets the Script
      if(i == 8) then
        for k = 1, #cb.track do
          cb.track[k] = 0
          cb.time[k] = cb.time[k] + interval
          cb.delay[k] = 0
          cb.sum[(math.floor(k/2) + 1)] = 0
        end
      end
    end
  end
end