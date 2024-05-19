HMP.HTcmSim.Purification_1 = {
  pos = { I:Vector3(32.053, -534.904, 390.184), I:Vector3(31.641, -507.323, 390.184), I:Vector3(3.935, -507.351, 390.184) },
  jormagLightning = {
    markers = World:CategoryByType("hmpSim.htcm_c1.sc5.p_2"):GetMarkers(),
    track = {
      {0, 0, 0, 0, 0},
      {0, 0, 0, 0, 0},
    },
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

function Reset_HTcm_P1() for k,v in ipairs(jl.markers) do v.InGameVisibility = false v.Alpha = 0 end end
  
--Lightning of Jormag
function HTcm_P1_LightningOfJormag(curTime, table, index)
  --Resetting variables
  if(not table[index]) then
    Reset_HTcm_P1()
    Utility.Misc.ResetTable(jl.track, 0)
    jl.time[1][1] = 11000
    jl.time[1][2] = 11000 + jl.time[2][2]
    table[index] = true
  end
  
  local timeTrack, l = 0, 0
  for i, track in ipairs(jl.track) do
    for k = 1, #track do
      timeTrack, l = jl.time[1][i] + (jl.time[2][1] * (k-1)), (((i-1)*15) + (k*3))-2
      
      --Makes the laser "look" at the player
      if( jl.markers[(l+2)].InGameVisibility ) then
        Utility.Animate.FixedRotate.Z(jl.markers[(l+2)], true)
      end
      --Initial AoE Spawn and Position Set
      if( track[k] == 0 and curTime >= timeTrack ) then
        local vector = Utility.Position.randomXZ(HMP.HTcmSim.Enemies.center.pos, 25)
        for a = l, l+2 do
          if( a < l+2 ) then
            jl.markers[a].InGameVisibility = true
            jl.markers[a].Size = jl.size
            jl.markers[a].Tint = HMP.HTcmSim.color[2]
          else
            jl.markers[a].Tint = HMP.HTcmSim.color[3]
            jl.markers[a]:SetTexture("Assets/Shapes/BigWhiteLine1.png")
          end
          jl.markers[a]:SetPos(vector)
        end
        track[k] = 1
      end
      
      --AoE Fade-In
      if( track[k] == 1 ) then
        for a = l, l+1 do Utility.Animate.FadeIn(curTime, timeTrack, jl.time[3][1], jl.alpha[(a%3)], jl.markers[a]) end
        if( curTime > timeTrack + jl.time[3][1] ) then track[k] = 2 end
      end
      
      --Laser Spawn and Fade-In
      if( track[k] == 2 ) then
        jl.markers[(l+2)].InGameVisibility = true
        Utility.Animate.FadeIn(curTime, (timeTrack + jl.time[3][2]), (jl.time[3][3] - jl.time[3][2]), 0.6, jl.markers[(l+2)])
        if( curTime > timeTrack + jl.time[3][3] ) then track[k] = 3 end
      end
      
      --AoE Fade-Out
      if( track[k] == 3 ) then
        for a = l, l+1 do Utility.Animate.FadeOut(curTime, (timeTrack + jl.time[3][4]), (jl.time[3][5] - jl.time[3][4]), jl.alpha[(a%3)], jl.markers[a]) end
        if( curTime > timeTrack + jl.time[3][5] ) then 
          for a = l, l+1 do jl.markers[a].InGameVisibility = false end
          track[k] = 4
        end
      end
      
      --Despawns Laser
      if( track[k] == 4 and curTime >= timeTrack + jl.time[3][6] ) then
        jl.markers[(l+2)].InGameVisibility = false
        jl.markers[(l+2)]:SetTexture("Assets/Shapes/BigWhiteLine1-2.png")
        --If a player "gets hit" by an AoE, we assume they go down
        if( World:CategoryByType("hmpSim.htcm_c1.sc4.ps_1"):IsVisible() and (Mumble.PlayerCharacter.Position - jl.markers[l].Position):Length() <= jl.markers[l].Size ) then
          ApplyDowned(Mumble.PlayerCharacter.Position)
        end
        track[k] = 5
      end
      
      --2nd AoE Fade-In, Laser Fade-In, and Laser Fade-Out
      if( track[k] == 5 and curTime >= timeTrack + jl.time[3][7] ) then
        for a = l, l+2, 2 do jl.markers[a].InGameVisibility = true end
        jl.markers[l].Tint = HMP.HTcmSim.color[3]
        Utility.Animate.FadeIn(curTime, (timeTrack + jl.time[3][7]), (jl.time[3][9] - jl.time[3][7]), jl.alpha[1]-0.1, jl.markers[l])
        Utility.Animate.FadeIn(curTime, (timeTrack + jl.time[3][7]), (jl.time[3][8] - jl.time[3][7]), 0.95, jl.markers[(l+2)])
        Utility.Animate.FadeOut(curTime, (timeTrack + jl.time[3][8]), (jl.time[3][10] - jl.time[3][8]), 0.95, jl.markers[(l+2)])
        if( curTime > timeTrack + jl.time[3][10] ) then
          jl.markers[(l+2)].InGameVisibility = false
          track[k] = 6
        end
      end
      
      --2nd AoE Fade-Out
      if( track[k] == 6 ) then
        Utility.Animate.FadeOut(curTime, (timeTrack + jl.time[3][11]), (jl.time[3][12] - jl.time[3][11]), jl.alpha[1]-0.1, jl.markers[l])
        --Ends the current marker iteration and prepares for the next
        if( curTime > timeTrack + jl.time[3][12] ) then
          for a = l, l+1 do jl.markers[a].InGameVisibility = false end
          track[k] = 7
          if( k == #track ) then
            for a = 1, 5 do track[a] = 0 end
            jl.time[1][i] = jl.time[1][i] + (jl.time[2][2] * 2)
          end
        end
      end
    end
  end
end