HMP.HTcmSim.Zhaitan = {
  greenPos = {
    { I:Vector3(5.207, -510.488, 391.723),  I:Vector3(25.527, -510.488, 391.723), I:Vector3(15.367, -533.348, 391.723) },
    { I:Vector3(3.581, -509.167, 391.723),  I:Vector3(27.254, -509.193, 391.723), I:Vector3(15.367, -533.348, 391.723) },
    { I:Vector3(-4.342, -503.325, 391.723), I:Vector3(35.078, -503.325, 391.723), I:Vector3(15.367, -542.746, 391.723) },
    { I:Vector3(39.751, -499.820, 391.723), I:Vector3(-9.016, -499.820, 391.723), I:Vector3(15.367, -548.588, 391.723) }
  },
  time = {
    32750, -- (1) Interval
    8500,  -- (2) Greens
    33500, -- (3) Spread
    23500, -- (4) Void Pools
    12000, -- (5) Putrid Deluge
    12000, -- (6) Zhaitan's Reach (wurms), min time
    25000, -- (7) Claw Slam
    30000, -- (8) Scream
    15000, -- (9) Spawn
  },
  putridDeluge = {
    markers = World:CategoryByType("hmpSim.htcm_c1.sc2.d5.atk1.sc1"):GetMarkers(),
    proj = World:CategoryByType("hmpSim.htcm_c1.sc2.d5.atk1.sc2"):GetMarkers(),
    pattern = {
      { I:Vector3(-3.826, -541.729, 391.723), I:Vector3(-1.228, -529.251, 391.723), I:Vector3(1.370, -516.773, 391.723),  I:Vector3(3.968, -504.294, 391.723),
        I:Vector3(6.566, -491.816, 391.723),  I:Vector3(8.782, -542.814, 391.723),  I:Vector3(11.380, -530.336, 391.723), I:Vector3(13.978, -517.858, 391.723),
        I:Vector3(16.576, -505.380, 391.723), I:Vector3(19.175, -492.901, 391.723), I:Vector3(21.390, -543.900, 391.723), I:Vector3(23.989, -531.421, 391.723),
        I:Vector3(26.587, -518.943, 391.723), I:Vector3(29.185, -506.465, 391.723), I:Vector3(31.783, -493.986, 391.723), I:Vector3(33.999, -544.985, 391.723),
        I:Vector3(36.597, -532.506, 391.723), I:Vector3(39.195, -520.028, 391.723), I:Vector3(41.793, -507.550, 391.723), I:Vector3(51.804, -521.113, 391.723),
      },
      { I:Vector3(-11.516, -527.595, 391.723), I:Vector3(-8.919, -515.116, 391.723), I:Vector3(-6.321, -502.638, 391.723), I:Vector3(-3.724, -490.159, 391.723),
        I:Vector3(-1.504, -541.157, 391.723),  I:Vector3(1.093, -528.679, 391.723),  I:Vector3(3.690, -516.200, 391.723),  I:Vector3(6.287, -503.722, 391.723),
        I:Vector3(8.884, -491.243, 391.723),   I:Vector3(11.103, -542.240, 391.723), I:Vector3(13.701, -529.763, 391.723), I:Vector3(16.299, -517.284, 391.723),
        I:Vector3(18.896, -504.806, 391.723),  I:Vector3(21.493, -492.327, 391.723), I:Vector3(23.713, -543.326, 391.723), I:Vector3(26.310, -530.847, 391.723),
        I:Vector3(28.907, -518.368, 391.723),  I:Vector3(31.504, -505.890, 391.723), I:Vector3(34.102, -493.412, 391.723), I:Vector3(36.321, -544.410, 391.723),
        I:Vector3(38.919, -531.931, 391.723),  I:Vector3(41.516, -519.453, 391.723), I:Vector3(44.113, -506.974, 391.723),
      },
    },
    time = {0, 3000, 10000}, --dynamic interval, indicator duration, AoE duration
    set = {1, 6}, --Only 2 sets, the 1st, and 2nd+
    addInterval = 50, --amt of milliseconds to add for each delayed action
  },
  clawSlam = {
    markers = World:CategoryByType("hmpSim.htcm_c1.sc2.d5.atk2"):GetMarkers(),
    track = 0, --tracks which part of the function we're at so it does the right things
    time = {130000, 3000}, --dynamic interval, duration
  },
  scream = {
    markers = World:CategoryByType("hmpSim.htcm_c1.sc2.d5.atk3"):GetMarkers(),
    track = 0, --tracks which part of the function we're at so it does the right things
    time = {130000, 2500}, --dynamic interval, duration
    size = 36.925,
  },
  zhaitansReach = {
    markers = World:CategoryByType("hmpSim.htcm_c1.sc3.d5_2"):GetMarkers(),
    centerPos = { I:Vector3(21.12552, -532.931, 391.723), I:Vector3(-1.975932, -513.8334, 391.723), I:Vector3(24.91432, -503.3301, 391.723), }, --close / mid / far
    icon = {
      {"Assets/Shapes/CircleFill.png", "Assets/Shapes/Orb5.png"},
      {"Assets/Shapes/wurmThrashBorder.png", "Assets/Shapes/wurmThrashFill.png"}
    },
    height = { --Max / Min
      {390.723, 394.723}, --Wurm Text
      {388.923, 392.923}, --Wurm Pic
    },
    track = {0, 0, 0}, --tracks which part of the function we're at so it does the right things.
    halfway = {1, 1, 1}, --Tracks halfway point
    size = {9.75, 12.75}, --Slam, Thrash
    alpha = {0.15, 0.85, 0.25}, --Slam Fill, Border, Thrash Fill
    time = {0, 0, 0, 0}, --tracks how long a wurm's been alive
    delay = {0, 0, 0}, --the first entry here is solely for loop compatibility
    sum = 0, --delay sum
    spawnUp = {1500, 1000}, --time after spawn, vertical duration
    slam = {
      {4000, 2500, 100}, --time after spawn, duration, fade-out time
      {1300, 800, 100},  --time after thrash2, duration, fade-out time
    },
    thrash = {
      {4400, 1900, 100}, --time after slam1, duration, grow time
      {5300, 1900, 100}, --time after thrash1, duration, grow time
    },
    death = 1200, --time after slam2
    radius = 13.4,
  },
}

local D5, enemies = HMP.HTcmSim.Zhaitan, HMP.HTcmSim.Enemies
local pd, scrm, slam, wurms, player = D5.putridDeluge, D5.scream, D5.clawSlam, D5.zhaitansReach, Mumble.PlayerCharacter

--Resets variables if the user interacts with the trigger mid-script
function Reset_HTcm_Zhaitan()
  local allMarkers = { pd.markers, pd.proj, scrm.markers, slam.markers, wurms.markers }
  for i = 1, #allMarkers do for k = 1, #allMarkers[i] do allMarkers[i][k].InGameVisibility = false end end
end

function HTcm_D5_PutridDeluge(curTime, startTime, interval, table, index)
  --Resetting values if at the start
  if(not table[index]) then pd.time[1] = startTime pd.set[1] = 1 table[index] = true end
  
  if(curTime >= pd.time[1]) then
    local m, curInt, time, max = 0, 0, 0, (#pd.markers - ((pd.set[1]%2) * pd.set[2]))
    for i = 1, max do
      m = math.ceil(i/2)
      curInt = pd.addInterval * (m-1)
      --Shows, Tints, Moves, and Set Positions on Markers
      if(curTime >= pd.time[1] + curInt and curTime < pd.time[1] + pd.time[2] + curInt) then
        pd.markers[i].InGameVisibility = true pd.proj[m].InGameVisibility = true
        pd.markers[i].Tint = HMP.HTcmSim.color[2]
        time = (curTime - pd.time[1]) - curInt
        local vector = HMPphysics.animate.MoveMarker(I:Vector3(enemies.hitbox.pos.X, enemies.hitbox.pos.Y, 411.723), pd.pattern[pd.set[1]][m], pd.time[2], time, 2, 0)
        pd.proj[m]:SetPos(vector)
        pd.proj[m]:SetRotY(4.27606 + ( ( pd.proj[m].Position - pd.pattern[pd.set[1]][m] ):Length() / 45 ) )
        pd.markers[i]:SetPos(pd.pattern[pd.set[1]][m])
      --Tints Markers again, Hides Markers
      elseif(curTime >= pd.time[1] + pd.time[2] + curInt and curTime < pd.time[1] + pd.time[2] + pd.time[3] + curInt) then
        pd.markers[i].Tint = HMP.HTcmSim.color[1]
        pd.proj[m].InGameVisibility = false
        --Player Fail-State
        if( ( player.Position - pd.markers[i].Position ):Length() <= pd.markers[i].Size and World:CategoryByType("hmpSim.htcm_c1.sc4.db_1"):IsVisible() ) then
          ApplyInfirmity()
        end
      --Hides Markers
      elseif(curTime >= pd.time[1] + pd.time[2] + pd.time[3] + curInt) then
        pd.markers[i].InGameVisibility = false
        --Resets/Ends the Script
        if(pd.markers[(#pd.markers - ((pd.set[1]%2) * pd.set[2]))].InGameVisibility == false) then
          pd.time[1] = pd.time[1] + interval
          pd.set[1] = 2
        end
      end
    end
  end
end

function HTcm_D5_Scream(curTime, startTime, interval, table, index)
  --Resets variables
  if(not table[index]) then
    for i = 1, #scrm.markers do scrm.markers[i].Tint = HMP.HTcmSim.color[2] end
    scrm.track = 1
    scrm.time[1] = startTime
    table[index] = true
  end
  
  if(curTime >= scrm.time[1]) then
    --Shows Markers
    if(scrm.track == 1) then
      for _, marker in ipairs(scrm.markers) do marker.InGameVisibility = true end
      scrm.track = 0
    end
    --Grows Markers
    for i = 3, 4 do HMPphysics.animate.SizeGrow(curTime, scrm.time[1], scrm.time[2], 0.1, scrm.size, scrm.markers[i]) end
    --Apply Infirmity to the player, Hides Markers, then Ends/Resets the Script
    if(curTime >= scrm.time[1] + scrm.time[2]) then
      ApplyInfirmity()
      for _, marker in ipairs(scrm.markers) do marker.InGameVisibility = false end
      scrm.time[1] = scrm.time[1] + interval
      scrm.track = 1
    end
  end
end

function HTcm_D5_ClawSlam(curTime, startTime, interval, table, index)
  --Resets variables
  if(not table[index]) then
    for i = 1, #slam.markers do slam.markers[i].Tint = HMP.HTcmSim.color[2] end
    slam.track = 0
    slam.time[1] = startTime
    table[index] = true
  end
  
  --Shows Markers
  if(slam.track == 0 and curTime >= slam.time[1]) then
    for _, marker in ipairs(slam.markers) do marker.InGameVisibility = true end
    slam.track = 1
  end
  
  --Hides Markers, Ends/Resets the Script
  if(curTime >= slam.time[1] + slam.time[2]) then
    for _, marker in ipairs(slam.markers) do marker.InGameVisibility = false end
    slam.track = 0
    slam.time[1] = slam.time[1] + interval
  end
end

function HTcm_D5_Wurms(curTime, startTime, interval, table, index)
  --Resets variables
  if(not table[index]) then
    for i = 7, #wurms.markers do wurms.markers[i].Tint = HMP.HTcmSim.color[2] end
    for i = 1, #wurms.time do wurms.time[i] = startTime end
    for i = 1, #wurms.track do
      wurms.track[i] = 0
      wurms.halfway[i] = 1
    end
    wurms.sum = 0
    table[index] = true
  end
  
  local a, b, c, h = 0, 0, 0, 0
  for i = 1, 3 do
    --Debug:Watch("i", i)
    a, b, c, h = (i*2), (i*4)+3, (i*4)+6, wurms.halfway[i]
    --Randomizing wurm positions and delays
    if(wurms.track[i] == 0 and curTime >= wurms.time[4]) then
      local vector = Utility.Position.randomXZ(wurms.centerPos[i], wurms.radius)
      for k = a-1, a do wurms.markers[k]:SetPos(vector) end
      for k = b, c do wurms.markers[k]:SetPos(vector) end
      wurms.delay[i] = math.random(wurms.sum, 1000 + ((i - 1) * 250)) - wurms.sum
      wurms.sum = wurms.sum + wurms.delay[i]
      wurms.time[i] = wurms.time[4] + wurms.delay[i] + wurms.spawnUp[1]
      wurms.track[i] = 1
    end
    --Animating when the wurms "come out of the ground"
    if(wurms.track[i] == 1 and curTime >= wurms.time[i]) then
      for k = a-1, a do
        wurms.markers[k].InGameVisibility = true
        HMPphysics.animate.Elevate(curTime, (wurms.time[i] + wurms.spawnUp[2]), wurms.spawnUp[2], wurms.height[(k%2)+1][1], wurms.height[(k%2)+1][2], wurms.markers[k])
      end
      if(curTime >= wurms.time[i] + wurms.spawnUp[2]) then
        wurms.time[i] = wurms.time[i] + wurms.spawnUp[2]
        wurms.track[i] = 2
      end
    end
    
    -- ===== Ground Slam =====
    --Setting attributes once
    if(wurms.track[i] == 2 and curTime >= wurms.time[i] + wurms.slam[h][1] or wurms.track[i] == 8 and curTime >= wurms.time[i] + wurms.slam[h][1]) then
      for k = b, c do
        wurms.markers[k].InGameVisibility = true
        wurms.markers[k].Size = wurms.size[1]
        wurms.markers[k].Alpha = wurms.alpha[(k%2)+1]
        wurms.markers[k]:SetTexture(wurms.icon[1][(k%2)+1])
      end
      wurms.time[i] = wurms.time[i] + wurms.slam[h][1]
      wurms.track[i] = wurms.track[i] + 1
    end
    --AoE Indicator Animation
    if(wurms.track[i] == 3 and curTime <= wurms.time[i] + wurms.slam[h][2] or wurms.track[i] == 9 and curTime <= wurms.time[i] + wurms.slam[h][2]) then
      for k = b+2, c do HMPphysics.animate.SizeGrow(curTime, wurms.time[i], wurms.slam[h][2], 0.025, wurms.size[1], wurms.markers[k]) end
    end
    --Fade-Out Animation
    if(wurms.track[i] == 3 and curTime > wurms.time[i] + wurms.slam[h][2] or wurms.track[i] == 9 and curTime > wurms.time[i] + wurms.slam[h][2]) then
      for k = b, c do HMPphysics.animate.FadeOut(curTime, (wurms.time[i] + wurms.slam[h][2]), wurms.slam[h][3], wurms.alpha[(k%2)+1], wurms.markers[k]) end
      --Finishing the attack, resetting values and progressing to the next attack
      if(curTime > wurms.time[i] + wurms.slam[h][2] + wurms.slam[h][3]) then
        for k = b, c do wurms.markers[k].InGameVisibility = false end
        wurms.time[i] = wurms.time[i] + wurms.slam[h][2] + wurms.slam[h][3]
        wurms.track[i] = wurms.track[i] + 1
      end
    end
    
    -- ===== Thrash =====
    if(wurms.track[i] == 4 and curTime >= wurms.time[i] + wurms.thrash[1][1] or wurms.track[i] == 6 and curTime >= wurms.time[i] + wurms.thrash[2][1]) then
      --Setting attributes once
      for k = b, c-2 do
        wurms.markers[k].InGameVisibility = true
        wurms.markers[k].Size = wurms.size[2]
        wurms.markers[k].Alpha = wurms.alpha[(k%2)+2]
        wurms.markers[k]:SetTexture(wurms.icon[2][(k%2)+1])
      end
      wurms.time[i] = wurms.time[i] + wurms.thrash[h][1]
      wurms.track[i] = wurms.track[i] + 1
    end
    --Complete Attack Indicator quick spawn-in
    if(wurms.track[i] == 5 and curTime <= wurms.time[i] + wurms.thrash[h][3] or wurms.track[i] == 7 and curTime <= wurms.time[i] + wurms.thrash[h][3]) then
      for k = b, c-2 do HMPphysics.animate.SizeGrow(curTime, wurms.time[i], wurms.thrash[h][3], 0.025, wurms.size[2], wurms.markers[k]) end
    end
    --Finishing the attack, resetting values and progressing to the next attack
    if(wurms.track[i] == 5 and curTime >= wurms.time[i] + wurms.thrash[h][2] + wurms.thrash[h][3] or wurms.track[i] == 7 and curTime >= wurms.time[i] + wurms.thrash[h][2] + wurms.thrash[h][3]) then
      for k = b, c-2 do wurms.markers[k].InGameVisibility = false end
      wurms.time[i] = wurms.time[i] + wurms.thrash[h][2] + wurms.thrash[h][3]
      wurms.track[i] = wurms.track[i] + 1
      if(wurms.halfway[i] == 1) then wurms.halfway[i] = 2 end
    end
    
    -- ===== Death =====
    --"Killing" the wurms, resetting values
    if(wurms.track[i] == 10 and curTime >= wurms.time[i] + wurms.death) then
      for k = a-1, a do wurms.markers[k].InGameVisibility = false end
      wurms.delay[i] = 0
      wurms.track[i] = wurms.track[i] + 1
      wurms.time[i] = wurms.time[4] + interval
      wurms.halfway[i] = 1
      --Ends/Resets the Script
      if(wurms.track[1] == 11 and wurms.track[2] == 11 and wurms.track[3] == 11) then
        for k = 1, #wurms.track do wurms.track[k] = 0 end
        wurms.time[4] = wurms.time[4] + interval
        wurms.sum = 0
      end
    end
  end
end