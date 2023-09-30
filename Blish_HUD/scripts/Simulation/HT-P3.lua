HMP.HTcmSim.Purification_3 = {
  pos = { I:Vector3(33.675, -536.803, 390.184), I:Vector3(32.999, -499.133, 390.184) },
  dOrbs = {
    markers = World:CategoryByType("hmpSim.htcm_c1.sc5.p_4"):GetMarkers(),
    centerPos = I:Vector3(14.76, -517.75, 391.723),
    ball = {
      { -- (1) West
        { 0, 0, false }, { I:Vector3(-3.301,  -517.807, 391.723), I:Vector3(18.02, -519.36, 391.723), 2550,  32800, {0, 0} }, { I:Vector3(-0.04218365667, -507.9541918, 391.723), 27450, {0, 0} },
      },
      { -- (2) North-West
        { 0, 0, true },  { I:Vector3(-10.127, -492.524, 391.723), I:Vector3(18.42, -518.01, 391.723), 8800,  59205, {0, 0} }, { I:Vector3(-19.05158865,   -525.7288872, 391.723), 53760, {0, 0} },
      },
      { -- (3) North
        { 0, 0, false }, { I:Vector3(13.873,  -491.059, 391.723), I:Vector3(13.13, -519.4,  391.723), 7950,  43915, {0, 0} }, { I:Vector3(39.1793906,     -508.2285788, 391.723), 40600, {0, 0} },
      },
      { -- (4) South
        { 0, 0, false }, { I:Vector3(15.915,  -541.689, 391.723), I:Vector3(16.29, -515.65, 391.723), 5500,  40227, {0, 0} }, { I:Vector3(-3.684792982,   -532.3599456, 391.723), 36350, {0, 0} },
      },
      { -- (5) South-East
        { 0, 0, true },  { I:Vector3(36.006,  -546.111, 391.723), I:Vector3(12.38, -517.75, 391.723), 11800, 57022, {0, 0} }, { I:Vector3(46.04848598,    -502.6329925, 391.723), 53670, {0, 0} },
      },
      { -- (6) East
        { 0, 0, true }, -- (1) Start Time / (2) Track / (3) CW(F), CCW(T)
        { I:Vector3(28.334, -517.213, 391.723), I:Vector3(14.12, -518.52, 391.723), 4300, 22248, {0, 0} }, -- RAMP-UP | (1) Start Position / (2) Center Position / (3) Ramp-Up Duration / (4) "Ramp-up Cycle Duration"
        { I:Vector3(17.88707197, -504.7484323, 391.723), 20700, {0, 0} }, -- MAIN | (1) Start Position / (2) Cycle Duration
      },
    },
    
    track = {0, 0, 0, 0, 0, 0},
    time = { -- ***NOTE*** For Soo-Won P2, it is 1000ms faster than (1)
      3800, -- (1) Static Spawn Duration (starts at 0, begins fade-out here)
      200,  -- (2) Fade-Out & Fade-In Time
    },
    size = {
      3.775, -- (1) Attack Indicator / Hitbox Size
      2.375  -- (2) Dragon Ball Size
    },
    ballColor = {
      I:Color(36, 233, 255, 255), I:Color(255, 87, 25, 255), I:Color(155, 25, 255, 255),
      I:Color(22, 201, 12, 255), I:Color(104, 135, 9, 255), I:Color(46, 164, 255, 255)
    },
    alpha = {0.35, 0.85},
  },
}

local P3 = HMP.HTcmSim.Purification_3
local orb = P3.dOrbs

function Reset_DragonOrbs()
  for i = 1, #orb.markers do
    orb.markers[i].InGameVisibility = false
    if(i%3) then
      orb.markers[i].Tint = I:Color(0, 0, 0, 0)
    end
  end
end

local function randomColor()
  local check, rNum = true, 0
  local colorCheck = {}
  for i = 3, 18, 3 do
    table.insert(colorCheck, orb.markers[i].Tint)
  end
  repeat
    check = true
    rNum = math.random(1, 6)
    for i = 1, #colorCheck-1 do
      if(orb.ballColor[rNum] == colorCheck[i]) then
        check = false
        break
      end
    end
  until(check)
  return orb.ballColor[rNum]
end

--Dragon Orbs | 'delay' is a boolean. True if on Soo-Won P2, otherwise False
function HTcm_DragonOrbs(curTime, table, index, num, delay)
  if(not table[index]) then
    if(delay) then orb.ball[num][1][1] = orb.time[1] - 1000 else orb.ball[num][1][1] = orb.time[1] end
    for i = 1, 2 do
      orb.ball[num][2][5][i] = 0
      orb.ball[num][3][3][i] = 0
    end
    orb.ball[num][1][2] = 0
    table[index] = true
  end
  
  local a, b = (3*num)-2, (3*num)
  
  if(curTime <= orb.ball[num][1][1] + (orb.time[2] * 2) ) then
    for i = a, b do
      orb.markers[i]:SetPos(orb.ball[num][2][1])
      if(curTime <= orb.ball[num][1][1] and i < b and orb.ball[num][1][2] == 0) then
        orb.markers[i].Size = orb.size[1]
        orb.markers[i].Tint = HMP.HTcmSim.color[2]
        orb.markers[i].Alpha = orb.alpha[(i%3)]
        orb.markers[i].InGameVisibility = true
      elseif(curTime <= orb.ball[num][1][1] and i == b and orb.ball[num][1][2] == 0) then
        if(not orb.ball[num][1][3]) then
          -- Y values
          orb.ball[num][2][5][2] = orb.ball[num][2][2].Y + (orb.ball[num][2][1] - orb.ball[num][2][2]):Length()
          orb.ball[num][3][3][2] = orb.centerPos.Y + (orb.ball[num][3][1] - orb.centerPos):Length()
          -- X values
          orb.ball[num][2][5][1] = orb.ball[num][2][2].X
          orb.ball[num][3][3][1] = orb.centerPos.X
        else
          -- X values
          orb.ball[num][2][5][1] = orb.ball[num][2][2].X + (orb.ball[num][2][1] - orb.ball[num][2][2]):Length()
          orb.ball[num][3][3][1] = orb.centerPos.X + (orb.ball[num][3][1] - orb.centerPos):Length()
          -- Y values
          orb.ball[num][2][5][2] = orb.ball[num][2][2].Y
          orb.ball[num][3][3][2] = orb.centerPos.Y
        end
        if(num < 6) then
          orb.markers[i].Tint = randomColor()
        else
          orb.markers[i].Tint = P3.dOrbs.ballColor[6]
        end
        
        orb.ball[num][1][2] = 1
      end
      
      if(curTime > orb.ball[num][1][1] and curTime <= orb.ball[num][1][1] + orb.time[2] and i < b) then
        HMPphysics.animate.FadeOut(curTime, orb.ball[num][1][1], orb.time[2], orb.alpha[(i%3)], orb.markers[i])
      end
      
      if(curTime > (orb.ball[num][1][1] + orb.time[2]) and curTime <= (orb.ball[num][1][1] + (orb.time[2] * 2))) then
        orb.markers[a].InGameVisibility = false
        if(i == a+1) then
          orb.markers[i].Tint = HMP.HTcmSim.color[1]
          HMPphysics.animate.FadeIn(curTime, (orb.ball[num][1][1] + orb.time[2]), orb.time[2], orb.alpha[(i%3)], orb.markers[i])
        elseif(i == b) then
          orb.markers[i].InGameVisibility = true
          HMPphysics.animate.SizeGrow(curTime, (orb.ball[num][1][1] + orb.time[2]), orb.time[2], 0.025, orb.size[2], orb.markers[i])
        end
      end
    end
  else
    for i = a+1, b do
      local time, vector, mod = 0, nil, 0
      if(curTime <= ( orb.ball[num][1][1] + ( orb.time[2] * 2 ) + orb.ball[num][2][3] ) ) then
        time = curTime - ( orb.ball[num][1][1] + ( orb.time[2] * 2 ) )
        mod = ( math.atan2( ( orb.ball[num][2][1].Y - orb.ball[num][2][2].Y ), ( orb.ball[num][2][1].X - orb.ball[num][2][2].X ) ) - math.atan2( ( orb.ball[num][2][5][2] - orb.ball[num][2][2].Y ), ( orb.ball[num][2][5][1] - orb.ball[num][2][2].X ) ) )
        if(not orb.ball[num][1][3]) then mod = -mod end
        vector = HMPphysics.animate.MoveOrb(orb.ball[num][2][1], orb.ball[num][2][2], orb.ball[num][2][4], time, mod, orb.ball[num][1][3])
        orb.markers[i]:SetPos(vector)
      else
        time = curTime - ( ( orb.ball[num][1][1] + ( orb.time[2] * 2 ) ) + orb.ball[num][2][3] )
        mod = math.atan2( ( orb.ball[num][3][1].Y - orb.centerPos.Y ), ( orb.ball[num][3][1].X - orb.centerPos.X ) ) - math.atan2( ( orb.ball[num][3][3][2] - orb.centerPos.Y ), ( orb.ball[num][3][3][1] - orb.centerPos.X ) )
        if(not orb.ball[num][1][3]) then mod = -mod end
        vector = HMPphysics.animate.MoveOrb(orb.ball[num][3][1], orb.centerPos, orb.ball[num][3][2], time, mod, orb.ball[num][1][3])
        orb.markers[i]:SetPos(vector)
      end
      if( ( Mumble.PlayerCharacter.Position - orb.markers[i].Position ):Length() <= orb.markers[i].Size and World:CategoryByType("hmpSim.htcm_c1.sc4.db_4"):IsVisible() ) then
        ApplySlow()
      end
    end
  end
end