HMP.HTcmSim.Mordremoth = {
  time = {
    22640, -- (1) Interval
    30000, -- (2) Spread     (18s after spawn)
    20080, -- (3) Void Pools (~8s after spawn)
    24900, -- (4) Poison Roar
    33600, -- (5) Shock Waves
    12000, -- (6) Spawn
  },
  poisonRoar = {
    markers = World:CategoryByType("hmpSim.htcm_c1.sc2.d4.atk1.sc1"):GetMarkers(),
    proj = World:CategoryByType("hmpSim.htcm_c1.sc2.d4.atk1.sc2"):GetMarkers(),
    pos = {
      I:Vector3(15.368, -518.108, 391.723),  I:Vector3(24.972, -527.632, 391.723), I:Vector3(29.542, -517.993, 391.723), I:Vector3(34.113, -508.354, 391.723),
      I:Vector3(24.474, -503.783, 391.723),  I:Vector3(14.834, -499.213, 391.723), I:Vector3(10.264, -508.852, 391.723), I:Vector3(5.693, -518.491, 391.723),
      I:Vector3(1.122, -528.130, 391.723),   I:Vector3(10.762, -532.701, 391.723), I:Vector3(20.401, -537.272, 391.723), I:Vector3(30.040, -541.842, 391.723),
      I:Vector3(34.611, -532.203, 391.723),  I:Vector3(39.182, -522.564, 391.723), I:Vector3(43.752, -512.924, 391.723), I:Vector3(48.323, -503.285, 391.723),
      I:Vector3(38.684, -498.715, 391.723),  I:Vector3(29.044, -494.144, 391.723), I:Vector3(19.405, -489.573, 391.723), I:Vector3(9.766, -485.003, 391.723),
      I:Vector3(5.195, -494.642, 391.723),   I:Vector3(0.624, -504.281, 391.723),  I:Vector3(-3.946, -513.921, 391.723), I:Vector3(-8.517, -523.560, 391.723),
      I:Vector3(-13.088, -533.199, 391.723), I:Vector3(-3.448, -537.770, 391.723), I:Vector3(6.191, -542.340, 391.723),  I:Vector3(15.830, -546.911, 391.723),
      I:Vector3(25.470, -551.482, 391.723),  I:Vector3(44.250, -536.774, 391.723), I:Vector3(48.821, -527.134, 391.723), I:Vector3(-4.444, -490.071, 391.723),
      I:Vector3(-9.015, -499.711, 391.723),  I:Vector3(-13.586, -509.350, 391.723),
    },
    spawn = {0, 34, 78, 127, 168, 196, 196, 239, 285, 333, 357, 401, 435, 481, 522, 564, 597, 664, 676, 728, 768, 810, 839, 881, 923, 969, 996, 1044, 1091, 1201, 1241, 1683, 1725, 1764},
    dur = {2319, 1983, 2400, 2767, 2917, 3084, 2677, 2284, 1952, 1700, 1596, 1667, 1939, 1949, 2299, 3184, 3185, 3300, 3515, 3584, 3233, 2867, 2584, 2295, 1988, 1630, 1334, 1129, 1134, 2089, 2401, 3451, 3133, 2817},
    time = 130000,
    leeway = 50,
  },
  shockWaves = {
    markers = World:CategoryByType("hmpSim.htcm_c1.sc2.d4.atk2"):GetMarkers(),
    height = {0, 0, 0},
    time = {0, 0, 0},
    track = {0, 0, 0},
    attr = {
      minSize = {7, 6.99, 6.98, 6.97, 6.96, 6.95, 6.94, 6.93, 6.92, 6.91, 6.9, 6.89, 6.88, 6.87, 6.86, 6.85, 6.84, 6.83, 6.82, 6.81, 6.7995, 6.78811299654995, 6.77576360188814, 6.76236994073852, 6.74784307796487, 6.73208639327766, 6.71499489767279, 6.69645448567591, 6.67634111678043, 6.65451991868871, 6.63084420408103, 6.60515439162735, 6.57727682080389, 6.54702244875495, 6.51418541592413, 6.47854146543256, 6.43984619916739, 6.39783315121289, 6.35221165655316, 6.30266448983204, 6.24884524528996, 6.19037542471228, 6.12684119519885, 6.05778977265708, 5.98272537995542, 5.90110472043618, 5.81233189771564, 5.71575270107342, 5.61064816185572, 5.49622726969937},
      maxSize = {59.7025, 59.6925, 59.6825, 59.6725, 59.6625, 59.6525, 59.6425, 59.6325, 59.6225, 59.6125, 59.6025, 59.5925, 59.5825, 59.5725, 59.5625, 59.5525, 59.5425, 59.5325, 59.5225, 59.5125, 59.502, 59.49061299655, 59.4782636018882, 59.4648699407386, 59.4503430779649, 59.4345863932777, 59.4174948976728, 59.3989544856759, 59.3788411167805, 59.3570199186888, 59.3333442040811, 59.3076543916274, 59.2797768208039, 59.249522448755, 59.2166854159242, 59.1810414654326, 59.1423461991674, 59.1003331512129, 59.0547116565532, 59.0051644898321, 58.95134524529, 58.8928754247123, 58.8293411951989, 58.7602897726571, 58.6852253799555, 58.6036047204362, 58.5148318977157, 58.4182527010735, 58.3131481618558, 58.1987272696994},
      alpha = {0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.495, 0.49, 0.485, 0.48, 0.475, 0.47, 0.465, 0.46, 0.455, 0.45, 0.445, 0.44, 0.435, 0.43, 0.425, 0.42, 0.415, 0.41, 0.405, 0.4, 0.395, 0.39, 0.385, 0.38, 0.375, 0.37, 0.365, 0.36, 0.355, 0.35},
      pos = I:Vector3(15.3328420548443, -523.060716043307, 391.723),
      time = {2600, 1600}, --2540, 1540
      fadeDur = 400,
      height = 391.723,
      heightInc = 0.025,
      leeway = 8, --0.0075 / 0.5
    },
    indicator = {
      time = {0, 2400, 4310},
      dur = 1000,
      size = 42.7,
    },
  }
}

local D4 = HMP.HTcmSim.Mordremoth
local pr, sw, player = D4.poisonRoar, D4.shockWaves, Mumble.PlayerCharacter

function Reset_HTcm_Mordremoth()
  local allMarkers = { pr.markers, pr.proj, sw.markers, }
  for i = 1, #allMarkers do for k = 1, #allMarkers[i] do allMarkers[i][k].InGameVisibility = false end end
end

function HTcm_D4_PoisonRoar(curTime, startTime, interval, table, index)
  --Resets variables
  if(not table[index]) then
    for i = 1, #pr.markers do pr.markers[i].Tint = HMP.HTcmSim.color[2] end
    pr.time = startTime
    table[index] = true
  end
  
  if(curTime >= pr.time) then
    local m = 0
    for _, marker in ipairs(pr.markers) do
      m = math.ceil(_/2)
      --Shows Markers, sets their positions, and Moves Projectiles
      if(curTime >= pr.time + pr.spawn[m] and curTime <= pr.time + pr.spawn[m] + pr.dur[m]) then
        local time = (curTime - pr.time) - pr.spawn[m]
        marker.InGameVisibility = true
        pr.proj[m].InGameVisibility = true
        marker:SetPos(pr.pos[m])
        local vector = HMPphysics.animate.MoveMarker(I:Vector3(HMP.HTcmSim.Enemies.hitbox.pos.X, HMP.HTcmSim.Enemies.hitbox.pos.Y, 411.723), pr.pos[m], pr.dur[m], time, 2, 0)
        pr.proj[m]:SetPos(vector)
        pr.proj[m]:SetRotY(4.27606 + ((pr.proj[m].Position - pr.pos[m]):Length() / 45))
      --Applies Infirmity and Debilitated if a player is "hit"
      elseif(curTime >= pr.time + pr.spawn[m] + pr.dur[m] - pr.leeway and curTime <= pr.time + pr.spawn[m] + pr.dur[m] + pr.leeway and (player.Position - marker.Position):Length() <= marker.Size ) then
        if( World:CategoryByType("hmpSim.htcm_c1.sc4.db_1"):IsVisible() ) then ApplyInfirmity() end
        if( World:CategoryByType("hmpSim.htcm_c1.sc4.db_2"):IsVisible() ) then ApplyDebilitated() end
      --Hides Markers and Ends/Resets the script
      else marker.InGameVisibility = false pr.proj[m].InGameVisibility = false end
      if(curTime >= pr.time + 6000) then pr.time = pr.time + interval end
    end
  end
end

function HTcm_D4_ShockWaves(curTime, startTime, interval, table, index)
  --Resets variables
  if(not table[index]) then
    for i = 1, #sw.track do
      sw.track[i] = 0
      sw.time[i] = startTime + sw.indicator.time[i]
      sw.height[i] = sw.attr.height
    end
    table[index] = true
  end
  
  for i = 1, 3 do
    --Shows and Grows the Attack Indicator
    if(curTime >= sw.time[i] - sw.indicator.dur and curTime < sw.time[i]) then
      sw.markers[1].InGameVisibility = true
      HMPphysics.animate.SizeGrow(curTime, (sw.time[i] - sw.indicator.dur), sw.indicator.dur, 0.25, sw.indicator.size, sw.markers[1])
    end
    
    --Hides Attack Indicator, Sets position, height, alpha, and tint of the wave
    if(sw.track[i] == 0 and curTime >= sw.time[i]) then
      sw.markers[1].InGameVisibility = false
      sw.height[i] = sw.attr.height
      local v = 0
      for k = 1, 50 do
        v = ((i * 50) + (k+1) - 50)
        sw.markers[v].Alpha = sw.attr.alpha[k]
        sw.markers[v].Tint = HMP.HTcmSim.color[4]
        sw.markers[v]:SetPos(sw.attr.pos.X, sw.attr.pos.Y, sw.height[i])
        sw.height[i] = sw.height[i] + sw.attr.heightInc
      end
      sw.track[i] = 1
    end
    
    
    if(sw.track[i] == 1 and curTime >= sw.time[i]) then
      local v, t = 0, 0
      for k = 1, 50 do
        v, t = ((i * 50) + (k+1) - 50), math.ceil(k / 30)
        --Grows Markers
        sw.markers[v].InGameVisibility = true
        HMPphysics.animate.SizeGrow(curTime, sw.time[i], sw.attr.time[1], sw.attr.minSize[k], sw.attr.maxSize[k], sw.markers[v])
        --Fade-Out Markers
        if(curTime >= sw.time[i] + sw.attr.time[t] - sw.attr.fadeDur and curTime <= sw.time[i] + sw.attr.time[t]) then
          HMPphysics.animate.FadeOut(curTime, (sw.time[i] + sw.attr.time[t] - sw.attr.fadeDur), sw.attr.fadeDur, sw.attr.alpha[k], sw.markers[v])
        end
        
        --Player Fail-State
        if(k == 1 and player.Position.Z <= 391.733 and (player.Position - sw.markers[v].Position):Length() >= sw.markers[v].Size - sw.attr.leeway and (player.Position - sw.markers[v].Position):Length() < sw.markers[v].Size) then
          --Stops the script when this function is called from the "Wave Practice" script
          if(HMP.SimStrB10cmD4_P.track == 2) then
            HMP.SimStrB10cmD4_P.track = 4
            break
          else
            --Applies Infirmity and Debilitated to the player
            if( World:CategoryByType("hmpSim.htcm_c1.sc4.db_1"):IsVisible() ) then ApplyInfirmity() end
            if( World:CategoryByType("hmpSim.htcm_c1.sc4.db_2"):IsVisible() ) then ApplyDebilitated() end
          end
        end
      end
    end
    
    --Hides markers and Resets/Ends the Script
    if(sw.track[i] == 1 and curTime >= sw.time[i] + sw.attr.time[1]) then
      local v = 0
      for k = 1, 50 do
        v = ((i * 50) + (k+1) - 50)
        sw.markers[v].InGameVisibility = false
        sw.markers[v].Alpha = sw.attr.alpha[math.ceil(k / 30)]
      end
      sw.height[i] = sw.attr.height
      sw.time[i] = sw.time[i] + interval
      sw.track[i] = 0
    end
    
    --This is a silly (but necessary) statement that ensures the attack indicator hides when a player fails to jump a wave
    if(sw.track == 4) then sw.indicator.marker.InGameVisibility = false end
  end
end