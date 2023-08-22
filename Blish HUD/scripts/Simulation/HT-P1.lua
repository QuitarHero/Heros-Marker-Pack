HMP.HTcmSim.Purification_1 = {
  pos = { I:Vector3(32.053, -534.904, 390.184), I:Vector3(31.641, -507.323, 390.184), I:Vector3(3.935, -507.351, 390.184) },
  jormagLightning = {
    markers = World:CategoryByType("hmpSim.htcm_c1.sc5.p_2"):GetMarkers(),
    track = { {0, 0, 0, 0, 0}, {0, 0, 0, 0, 0}, },
    time = {
      { 11000, 14000 }, --dynamic spawn track
      { 120, 3000 }, --spawn intervals
      { -- Animation Timings
        116,  -- (1)  AoE Fade-In
        251,  -- (2)  Laser Spawn
        684,  -- (3)  Laser Fade-In
        1732, -- (4)  AoE Begin Fade-Out
        1867, -- (5)  AoE Fade-Out
        1984, -- (6)  Laser Despawn
        1999, -- (7)  AoE & Laser Spawn
        2422, -- (8)  Laser Max Bright
        2485, -- (9)  AoE Fade-In
        2645, -- (10) Laser Fade-Out
        3751, -- (11) AoE Begin Fade-Out
        4721, -- (12) AoE Fade-Out
      }
    },
    alpha = { 0.4, 1 },
    interval = 3000,
    size = 5.1, -- ~200 radius
  },
}

local P1 = HMP.HTcmSim.Purification_1
local jl = P1.jormagLightning

function Reset_HTcm_P1() for i = 1, #jl.markers do jl.markers[i].InGameVisibility = false end end

--Lightning of Jormag
function HTcm_P1_LightningOfJormag(curTime, table, index)
  --Resetting variables
  if(not table[index]) then
    for i = 1, #jl.track do for k = 1, #jl.track[i] do jl.track[i][k] = 0 end end
    jl.time[1][1] = 11000
    jl.time[1][2] = 11000 + jl.time[2][2]
    table[index] = true
  end
  
  local timeTrack, l = 0, 0
  
  for i = 1, 2 do
    for k = 1, 5 do
      timeTrack, l = jl.time[1][i] + (jl.time[2][1] * (k-1)), (((i-1)*15) + (k*3))-2
      
      --Makes the laser "look" at the player
      if(jl.markers[(l+2)].InGameVisibility == true) then
        HMPphysics.pos.FixedRotate.Z(jl.markers[(l+2)], true)
      end
      --Initial AoE Spawn and Position Set
      if(jl.track[i][k] == 0 and curTime >= timeTrack) then
        local vector = HMPphysics.pos.randomXZ(HMP.HTcmSim.Enemies.center.pos, 25)
        for a = l, l+2 do
          if(a < l+2) then
            jl.markers[a].InGameVisibility = true
            jl.markers[a].Size = jl.size
            jl.markers[a].Tint = HMP.HTcmSim.color[2]
          else
            jl.markers[a].Tint = HMP.HTcmSim.color[3]
            jl.markers[a]:SetTexture("Data/Shapes/BigWhiteLine1.png")
          end
          jl.markers[a]:SetPos(vector)
        end
        jl.track[i][k] = 1
      end
      
      --AoE Fade-In
      if(jl.track[i][k] == 1 and curTime <= timeTrack + jl.time[3][1]) then
        for a = l, l+1 do
          HMPphysics.animate.FadeIn(curTime, timeTrack, jl.time[3][1], jl.alpha[(a%3)], jl.markers[a])
        end
      elseif(jl.track[i][k] == 1 and curTime > timeTrack + jl.time[3][1]) then
        jl.track[i][k] = 2
      end
      
      --Laser Spawn & Fade-In
      if(jl.track[i][k] == 2 and curTime >= timeTrack + jl.time[3][2] and curTime <= timeTrack + jl.time[3][3]) then
        jl.markers[(l+2)].InGameVisibility = true
        HMPphysics.animate.FadeIn(curTime, (timeTrack + jl.time[3][2]), (jl.time[3][3] - jl.time[3][2]), 0.6, jl.markers[(l+2)])
      elseif(jl.track[i][k] == 2 and curTime > timeTrack + jl.time[3][3]) then
        jl.track[i][k] = 3
      end
      
      --AoE Fade-Out
      if(jl.track[i][k] == 3 and curTime >= timeTrack + jl.time[3][4] and curTime <= timeTrack + jl.time[3][5]) then
        for a = l, l+1 do
          HMPphysics.animate.FadeOut(curTime, (timeTrack + jl.time[3][4]), (jl.time[3][5] - jl.time[3][4]), jl.alpha[(a%3)], jl.markers[a])
        end
      elseif(jl.track[i][k] == 3 and curTime > timeTrack + jl.time[3][5]) then
        for a = l, l+1 do jl.markers[a].InGameVisibility = false end
        jl.track[i][k] = 4
      end
      
      --"Despawn" Laser
      if(jl.track[i][k] == 4 and curTime >= timeTrack + jl.time[3][6]) then
        jl.markers[(l+2)].InGameVisibility = false
        jl.markers[(l+2)]:SetTexture("Data/Shapes/BigWhiteLine1-2.png")
        --If a player "gets hit" by an AoE, we assume they go down
        if( ( Mumble.PlayerCharacter.Position - jl.markers[l].Position ):Length() <= jl.markers[l].Size and World:CategoryByType("hmpSim.htcm_c1.sc4.ps_1"):IsVisible() ) then
          ApplyDowned(Mumble.PlayerCharacter.Position)
        end
        jl.track[i][k] = 5
      end
      
      --2nd AoE Fade-In
      if(jl.track[i][k] == 5 and curTime >= timeTrack + jl.time[3][7] and curTime < timeTrack + jl.time[3][9]) then
        jl.markers[l].InGameVisibility = true
        jl.markers[l].Tint = HMP.HTcmSim.color[3]
        HMPphysics.animate.FadeIn(curTime, (timeTrack + jl.time[3][7]), (jl.time[3][9] - jl.time[3][7]), jl.alpha[1]-0.1, jl.markers[l])
      end
      
      --Laser Fade-In
      if(jl.track[i][k] == 5 and curTime >= timeTrack + jl.time[3][7] and curTime < timeTrack + jl.time[3][8]) then
        jl.markers[(l+2)].InGameVisibility = true
        HMPphysics.animate.FadeIn(curTime, (timeTrack + jl.time[3][7]), (jl.time[3][8] - jl.time[3][7]), 0.95, jl.markers[(l+2)])
      end
      
      --Laser Fade-Out
      if(jl.track[i][k] == 5 and curTime >= timeTrack + jl.time[3][8] and curTime <= timeTrack + jl.time[3][10]) then
        HMPphysics.animate.FadeOut(curTime, (timeTrack + jl.time[3][8]), (jl.time[3][10] - jl.time[3][8]), 0.95, jl.markers[(l+2)])
      elseif(jl.track[i][k] == 5 and curTime > timeTrack + jl.time[3][10]) then
        jl.markers[(l+2)].InGameVisibility = false
        jl.track[i][k] = 6
      end
      
      if(jl.track[i][k] == 6 and curTime >= timeTrack + jl.time[3][11] and curTime <= timeTrack + jl.time[3][12]) then
        HMPphysics.animate.FadeOut(curTime, (timeTrack + jl.time[3][11]), (jl.time[3][12] - jl.time[3][11]), jl.alpha[1]-0.1, jl.markers[l])
      -- Ends the current marker iteration, prepares for next
      elseif(jl.track[i][k] == 6 and curTime > timeTrack + jl.time[3][12]) then
        for a = l, l+1 do jl.markers[a].InGameVisibility = false end
        jl.track[i][k] = 7
        if(k == 5) then
          for a = 1, 5 do jl.track[i][a] = 0 end
          jl.time[1][i] = jl.time[1][i] + (jl.time[2][2] * 2)
        end
      end
    end
  end
end