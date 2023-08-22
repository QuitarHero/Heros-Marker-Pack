HMP.HTcmSim.Primordus = {
  greenPos = {
    { I:Vector3(-2.412, -510.488, 391.723), I:Vector3(20.447, -497.788, 391.723), I:Vector3(33.147, -510.488, 391.723) },
    { I:Vector3(-9.729, -507.352, 391.723), I:Vector3(21.990, -491.618, 391.723), I:Vector3(40.465, -507.352, 391.723) }
  },
  time = {
    54000, -- (1) Interval
    29500, -- (2) Greens
    20000, -- (3) Spread
    23500, -- (4) Void Pools
    20000, -- (5) Jaws of Destruction
    33000, -- (6) Lava Slam
    7000,  -- (7) Spawn
  },
  jawsOfDestruction = {
    markers = World:CategoryByType("hmpSim.htcm_c1.sc2.d2.atk1"):GetMarkers(),
    time = 0,
    duration = {7000, 14000},
    size = 38.15,
  },
  lavaSlam = {
    markers = World:CategoryByType("hmpSim.htcm_c1.sc2.d2.atk2"):GetMarkers(),
    track = 0,
    time = 0,
    addTime = 0,
    duration = 3000,
    interval = {13000, 12500},
  }
}

local D2 = HMP.HTcmSim.Primordus
local jaws, slam = D2.jawsOfDestruction, D2.lavaSlam

--Resets variables
function Reset_HTcm_Primordus()
  local allMarkers = { jaws.markers, slam.markers }
  for i = 1, #allMarkers do for k = 1, #allMarkers[i] do allMarkers[i][k].InGameVisibility = false end end
end

--Jaws of Destruction
function HTcm_D2_JawsOfDestruction(curTime, startTime, interval, table, index)
  --Resets variables
  if(not table[index]) then
    for i = 1, #jaws.markers do jaws.markers[i].Tint = HMP.HTcmSim.color[2] end
    jaws.time = startTime
    table[index] = true
  end
  
  for i = 1, #jaws.markers do
    --Grows Marker
    if(curTime >= jaws.time and curTime < jaws.time + jaws.duration[1]) then
      jaws.markers[i].InGameVisibility = true
      HMPphysics.animate.SizeGrow(curTime, jaws.time, jaws.duration[1], 0.025, jaws.size, jaws.markers[3])
    end
    
    --Colorizing Markers and removing the indicator marker
    if(curTime >= jaws.time + jaws.duration[1] and curTime < jaws.time + jaws.duration[2]) then
      jaws.markers[i].Tint = HMP.HTcmSim.color[1]
      jaws.markers[3].InGameVisibility = false
      if( ( Mumble.PlayerCharacter.Position - jaws.markers[1].Position ):Length() <= jaws.markers[1].Size and World:CategoryByType("hmpSim.htcm_c1.sc4.ps_2"):IsVisible() ) then ApplyDeath(Mumble.PlayerCharacter.Position) end
    end
    
    --Resets/Ends the Script
    if(curTime >= jaws.time + jaws.duration[2]) then
      jaws.markers[i].InGameVisibility = false
      jaws.markers[i].Tint = HMP.HTcmSim.color[2]
      if(i == #jaws.markers) then jaws.time = jaws.time + interval end
    end
  end
end

--Lava Slam
function HTcm_D2_LavaSlam(curTime, startTime, interval, table, index)
  --Resetting variables
  if(not table[index]) then
    for i = 1, #slam.markers do slam.markers[i].Tint = HMP.HTcmSim.color[2] end
    slam.track = 0
    slam.addTime = 0
    slam.time = startTime
    table[index] = true
  end
  local all = #slam.markers
  
  --Hides/Shows Markers based on time elapsed
  if(slam.track == 0 and curTime >= slam.time) then
    for i = 1, all do slam.markers[i].InGameVisibility = true end
    slam.track = 1
  end
  if(slam.track == 1 and curTime >= slam.time + slam.duration) then
    if( ( Mumble.PlayerCharacter.Position - slam.markers[1].Position ):Length() <= slam.markers[1].Size and World:CategoryByType("hmpSim.htcm_c1.sc4.ps_2"):IsVisible() ) then ApplyDeath(Mumble.PlayerCharacter.Position) end
    for i = 1, all do slam.markers[i].InGameVisibility = false end
    slam.addTime = slam.addTime + slam.duration slam.track = 2
  end
  if(slam.track == 2 and curTime >= slam.time + slam.addTime + slam.interval[1]) then
    for i = 1, all do slam.markers[i].InGameVisibility = true end
    slam.addTime = slam.addTime + slam.interval[1] slam.track = 3
  end
  if(slam.track == 3 and curTime >= slam.time + slam.addTime + slam.duration) then
    if( ( Mumble.PlayerCharacter.Position - slam.markers[1].Position ):Length() <= slam.markers[1].Size and World:CategoryByType("hmpSim.htcm_c1.sc4.ps_2"):IsVisible() ) then ApplyDeath(Mumble.PlayerCharacter.Position) end
    for i = 1, all do slam.markers[i].InGameVisibility = false end
    slam.addTime = slam.addTime + slam.duration slam.track = 4
  end
  if(slam.track == 4 and curTime >= slam.time + slam.addTime + slam.interval[2]) then
    for i = 1, all do slam.markers[i].InGameVisibility = true end
    slam.addTime = slam.addTime + slam.interval[2] slam.track = 5
  end
  
  --Resets/ends the Script
  if(slam.track == 5 and curTime >= slam.time + slam.addTime + slam.duration) then
    if( ( Mumble.PlayerCharacter.Position - slam.markers[1].Position ):Length() <= slam.markers[1].Size and World:CategoryByType("hmpSim.htcm_c1.sc4.ps_2"):IsVisible() ) then ApplyDeath(Mumble.PlayerCharacter.Position) end
    for i = 1, all do slam.markers[i].InGameVisibility = false end
    slam.addTime = 0 slam.time = slam.time + interval slam.track = 0
  end
end