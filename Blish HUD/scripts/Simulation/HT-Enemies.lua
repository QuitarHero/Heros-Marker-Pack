HMP.HTcmSim.Enemies = {
  hitbox = {
    pos = I:Vector3(15.555, -554.495, 391.723),
    r = 10.1
  },
  center = {
    pos = I:Vector3(15.3591026162052, -518.036474472949, 391.723),
    r = {26.9, 35.9},
  },
  giants = {
    markers = World:CategoryByType("hmpSim.htcm_c1.sc3.d5_1"):GetMarkers(),
    rPos = { I:Vector3(0, 0, 0), I:Vector3(0, 0, 0), I:Vector3(0, 0, 0) },
    pos = { I:Vector3(-5.453, -526.002, 391.723), I:Vector3(14.855, -506.634, 391.723), I:Vector3(38.829, -528.011, 391.723) },
    delay = {0, 0, 0, 0},
    time = {0, 0, 0},
    moveDur = {3300, 2500}, --swiftness, superspeed
    rngSpeed = {0, 0, 0},
    delayDur = 1500,
    atkDur = 1680,
    killTime = 3640,
    size = 12.8,
    height = {391.723, 393.523},
    track = {0, 0, 0},
    LL_Time = 1750,
    LL_Size = 6.15,
  },
}

local enemy = HMP.HTcmSim.Enemies

local function getRandomPos(arg1, arg2)
  local d, rNumX, rNumZ = 0, 0, 0
  repeat
    rNumX = math.random(arg1 - enemy.hitbox.r, arg1 + enemy.hitbox.r)
    rNumZ = math.random(arg2 - enemy.hitbox.r, arg2 + enemy.hitbox.r)
    d = math.sqrt((rNumX - arg1) ^ 2 + (rNumZ - arg2) ^ 2)
  until(d <= enemy.hitbox.r and (enemy.center.pos - I:Vector3(rNumX, rNumZ, 391.723)):Length() >= enemy.center.r[1] and (enemy.center.pos - I:Vector3(rNumX, rNumZ, 391.723)):Length() < enemy.center.r[2])
  return I:Vector3(rNumX, rNumZ, 391.723)
end

function Reset_HTcm_Enemies()
  local allMarkers = nil
  for i = 1, #enemy.giants.markers do
    enemy.giants.markers[i].InGameVisibility = false
  end
end

local giants = enemy.giants
function HTcm_D5_Giants(curTime, startTime, table, index)
  --When we're at the start, we reset variables and prepare for Giants
  if(not table[index]) then
    for i = 1, 7, 3 do giants.markers[i].Tint = HMP.HTcmSim.color[1] end
    for i = 9, #giants.markers do
      if( i % 6 == 0 or i % 6 == 1 ) then
        giants.markers[i].Tint = HMP.HTcmSim.color[1]
      else
        giants.markers[i].Tint = HMP.HTcmSim.color[2]
      end
    end
    giants.delay[4] = 0
    local k = 0
    for i = 1, 9 do
      if(i % 3 == 0) then k = 1 else k = 0 end
      giants.markers[i].InGameVisibility = true
      giants.markers[i]:SetPos(giants.pos[math.ceil(i/3)].X, giants.pos[math.ceil(i/3)].Y, giants.height[1+k])
    end
    for i = 1, 3 do
      --Eventually make better, reminder
      giants.rPos[i] = getRandomPos(enemy.hitbox.pos.X, enemy.hitbox.pos.Y)
      local rng = math.random(1, 11)
      if(rng < 9) then giants.rngSpeed[i] = giants.moveDur[1] else giants.rngSpeed[i] = giants.moveDur[2] end
      giants.time[i] = startTime
      giants.track[i] = 0
    end
    for i = 10, 27 do giants.markers[i]:SetPos(giants.rPos[math.ceil((i - 9)/6)]) end
    table[index] = true
  end
  
  for i = 1, 3 do
    --When it's time to move the giants, well we move them
    if(giants.track[i] == 0 and curTime >= giants.time[i] and curTime <= giants.time[i] + giants.rngSpeed[i]) then
      local time, vector = 0, nil
      for k = (i*3)-2, (i*3) do
        time = ( curTime - giants.time[i] )
        vector = HMPphysics.animate.MoveMarker(giants.pos[i], giants.rPos[i], giants.rngSpeed[i], time, 1, 0)
        if(k < (i*3)) then
          giants.markers[k]:SetPos(vector)
        else
          giants.markers[k]:SetPos(vector + I:Vector3(0, 0, 2))
        end
      end
    end
    if(giants.track[i] == 0 and curTime > giants.time[i] + giants.rngSpeed[i]) then
      giants.time[i] = giants.time[i] + giants.moveDur[1] + giants.delayDur
      giants.track[i] = 1
    end
    
    --Once it's time to animate the Giants, we spawn the AoE's and animate their inner expansion
    if(giants.track[i] == 1 and curTime >= giants.time[i] and curTime < giants.time[i] + giants.atkDur) then
      local x, y = (i*6)+4, (i*6)+5
      for k = x, y do
        giants.markers[k].InGameVisibility = true
        giants.markers[k].Size = giants.size
      end
      giants.track[i] = 2
    end
    
    if(giants.track[i] == 2 and curTime >= giants.time[i] and curTime < giants.time[i] + giants.atkDur) then
      local x, y = (i*6)+6, (i*6)+7
      --First Scream Attack
      for k = x, y do
        giants.markers[k].InGameVisibility = true
        HMPphysics.animate.SizeGrow(curTime, giants.time[i], giants.atkDur, 0.025, giants.size, giants.markers[k])
      end
    end
    
    --Second Scream Attack
    if(giants.track[i] == 2 and curTime >= giants.time[i] + giants.atkDur and curTime < giants.time[i] + (giants.atkDur * 2)) then
      for k = (i*6)+6, (i*6)+7 do
        HMPphysics.animate.SizeGrow(curTime, (giants.time[i] + giants.atkDur), giants.atkDur, 0.025, giants.size, giants.markers[k])
      end
    end
    
    --Once both Scream attacks have happened, we hide all AoE markers
    if(giants.track[i] == 2 and curTime >= giants.time[i] + (giants.atkDur * 2)) then
      for k = (i*6)+4, (i*6)+7 do giants.markers[k].InGameVisibility = false end
      giants.time[i] = giants.time[i] + (giants.atkDur * 2)
      giants.track[i] = 3
    end
    
    --When we expect the Giants to die in a practiced group and in a timely manner, we hide the Giant markers and spawn-in the Last Laugh markers
    if(giants.track[i] == 3 and curTime >= giants.time[i] + giants.killTime) then
      for k = (i*3)-2, (i*3) do giants.markers[k].InGameVisibility = false end
      for k = (i*6)+8, (i*6)+9 do giants.markers[k].Size = giants.LL_Size giants.markers[k].InGameVisibility = true end
      giants.time[i] = giants.time[i] + giants.killTime
      giants.track[i] = 4
    end
    
    --Once the Last Laugh (Void Explosion) is complete, we hide the LL markers
    if(giants.track[i] == 4 and curTime >= giants.time[i] + giants.LL_Time) then
      for k = (i*6)+8, (i*6)+9 do giants.markers[k].InGameVisibility = false end
    end
  end
end