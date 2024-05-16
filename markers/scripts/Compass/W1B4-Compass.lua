--Dependencies
Pack:Require("scripts/Utility/Countdown")

HMP.Compass_Sabetha = {
  preview = World:CategoryByType("HMP.W1_B4.c4.sc1"):GetMarkers(),
  pVar = {
    center = I:Vector3(-66.78357, 129.9491, 71.77616),
    current = 0,
    start = 0,
    sub = 0,
    mech = { 0, 0 }
  },
  markers = World:CategoryByType("HMP.W1_B4.c4.sc2"):GetMarkers(),
  cannonPositions = {
    I:Vector3(-133.2225, 52.42474, 62.82022), I:Vector3(-161.7514, 87.51527, 62.01423),
    I:Vector3(-126.3933, 115.5325, 62.80072), I:Vector3(-97.97771, 80.63229, 62.89721)
  },
  launchPlatforms = {
    I:Vector3(-132.6284, 56.2659, 62.96154), I:Vector3(-157.6624, 86.99155, 62.27127),
    I:Vector3(-126.8654, 111.9275, 62.9425), I:Vector3(-101.9276, 81.16863, 63.0384)
  },
  bossPos = I:Vector3(-128.986, 85.266, 62.386),
  catStates = {
    { false, false, false }, --Cannons
    { false, false, false, false }, --Countdown, Directions, Numbers, Commander Markers
    { { false, false, false, false, false, false, false, false }, --South
      { false, false, false, false, false, false, false, false }, --West
      { false, false, false, false, false, false, false, false }, --North
      { false, false, false, false, false, false, false, false }, } --East
  },
  dir = "Assets/General/",
  icon = {
    { "empty.png" },
    { "s.png", "w.png", "n.png", "e.png" },
    { "1.png", "2.png", "3.png", "4.png" },
    { 1335145, 1335146, 1335147, 1335148, 1335149, 1335150, 1335151, 1335152 }
  },
  curCannon = 0,
  cannonOrder = { 1, 2, 3, 4, 1, 3, 2, 4 },
  mechCannon = { 0, 0 },
  startTime = 0,
  alpha = { 0.6, 0.95 },
  size = { 1, 0.75},
  color = { I:Color(255, 255, 255, 255), I:Color(200, 197, 227, 255) },
  subtract = 0,
  enrage = 480
}

local compass = HMP.Compass_Sabetha
Debug:Watch("Sab Compass Variables", HMP.Compass_Sabetha)
local cat, player = compass.catStates, Mumble.PlayerCharacter

local function ResetCompass()
  for i = 1, #compass.markers do
    ResetCountdown(compass.markers[i])
    compass.markers[i].InGameVisibility = false
    compass.markers[i].ResetLength = 30
  end
  compass.curCannon = 0
  compass.mechCannon = { 0, 0 }
  compass.startTime = 0
  compass.subtract = 0
end

local function ResetPreview()
  for i = 1, 4 do
    ResetCountdown(compass.preview[i])
    compass.preview[i].InGameVisibility = false
  end
  compass.pVar.current = 0
  compass.pVar.start = 0
  compass.pVar.sub = 0
  compass.pVar.mech = { 0, 0 }
end

local function UpdateCategoryStates()
  --Cannon Category States
  for i = 1, #cat[1] do cat[1][i] = World:CategoryByType("HMP.W1_B4.c4.sc3.asc" .. i):IsVisible() end
  --Display Option States
  for i = 1, #cat[2] do cat[2][i] = World:CategoryByType("HMP.W1_B4.c4.sc4.asc" .. i):IsVisible() end
  --Commander Marker States
  for i = 1, #cat[3] do
    for k = 1, #cat[3][i] do
      cat[3][i][k] = World:CategoryByType("HMP.W1_B4.c4.sc4.asc4.dir" .. i .. ".cmdr" .. k):IsVisible()
    end
  end
end

local function UpdateCompassTexture(markerRef)
  for i = 1, 4 do
    --Countdown
    if( i == 1 and cat[2][i] ) then
      for _,v in ipairs(markerRef) do
        v:SetTexture(compass.dir .. compass.icon[i][1])
        v.Size = compass.size[1]
        v.Tint = compass.color[2]
      end
      break
    end
    --Directions and Numbers
    if( i == 2 and cat[2][i] or i == 3 and cat[2][i] ) then
      for _,v in ipairs(markerRef) do
        ResetCountdown(v)
        v:SetTexture(compass.dir .. compass.icon[i][_])
        v.Size = compass.size[2]
        v.Tint = compass.color[1]
      end
      break
    end
    --Commander Markers
    if( i == 4 and cat[2][i] ) then
      for k = 1, #cat[3] do
        for l = 1, #cat[3][k] do
          if( cat[3][k][l] ) then
            ResetCountdown(markerRef[k])
            markerRef[k]:SetTexture(compass.icon[i][l])
            markerRef[k].Size = compass.size[2]
            markerRef[k].Tint = compass.color[1]
            break
          end
        end
      end
    end
  end
end

local function UpdateCannonMechanic()
      if( cat[1][1] ) then compass.pVar.mech = { 0, 0 } compass.mechCannon = { 0, 0 }
  elseif( cat[1][2] ) then compass.pVar.mech = { 2, 0 } compass.mechCannon = { 2, 0 }
  elseif( cat[1][3] ) then compass.pVar.mech = { 0, 2 } compass.mechCannon = { 0, 2 } end
end

local function CheckCategoryStates()
  --Checking 'Cannon Category' States
  for i = 1, #cat[1] do
    if( World:CategoryByType("HMP.W1_B4.c4.sc3.asc" .. i):IsVisible() ~= cat[1][i] ) then
      UpdateCategoryStates() UpdateCannonMechanic()
    end
  end
  --Checking 'Display Option' States
  for i = 1, #cat[2] do
    if( World:CategoryByType("HMP.W1_B4.c4.sc4.asc" .. i):IsVisible() ~= cat[2][i] ) then
      UpdateCategoryStates() UpdateCompassTexture(compass.markers) UpdateCompassTexture(compass.preview)
    end
  end
  --Checking 'Commander Marker' States
  for i = 1, #cat[3] do
    for k = 1, #cat[3][i] do
      if( World:CategoryByType("HMP.W1_B4.c4.sc4.asc4.dir" .. i .. ".cmdr" .. k):IsVisible() ~= cat[3][i][k] ) then
        UpdateCategoryStates() UpdateCompassTexture(compass.markers) UpdateCompassTexture(compass.preview)
      end
    end
  end
end

local function AnimateCompass(cannonPos, marker, time, offset)
  --Sets the Marker's Position around the player
  local vector = cannonPos - player.Position
  vector = vector / vector:Length()
  local pos = player.Position + vector * 2.5 --'2.5' can be changed to modify marker distance from player
  marker:SetPos(pos.X, pos.Y, 61.5) --'61.5' is the height.
  
  --Determines Marker visibility based on the player's position
  if( (player.Position - compass.bossPos):Length() > 31 ) then
    marker.InGameVisibility = false
  else
    for _, position in ipairs(compass.launchPlatforms) do
      if( (player.Position - position):Length() < 4 ) then marker.InGameVisibility = false break
      elseif( _ == #compass.launchPlatforms ) then marker.InGameVisibility = true end
    end
  end
  
  --Changes marker opacity based on time elapsed
  if( time <= 34-offset ) then
    marker.Alpha = compass.alpha[1]
    
  elseif( time > 34-offset and time <= 38 ) then
    if( cat[1][1] ) then
      marker.Alpha = compass.alpha[2]
    elseif( cat[1][2] and offset == compass.mechCannon[1] ) then
      marker.Alpha = compass.alpha[2]
    elseif( cat[1][3] and offset == compass.mechCannon[2] ) then
      marker.Alpha = compass.alpha[2]
    end
  
  --When the Current Cannon completes, we modify running variables
  elseif( time > 38 and time < 50 ) then --'50' is specified here due to the script hitting the condition multiple times when it shouldn't
    marker.InGameVisibility = false
    compass.subtract = compass.subtract + 30
    if( compass.curCannon == 8 ) then compass.curCannon = 1
    else compass.curCannon = compass.curCannon + 1 end
    --If the marker requires a countdown, we give it here
    --(since this is code that is only run once per ~30s)
    if( cat[2][1] ) then
      for i = 1, 4 do
        if( marker.Guid == compass.markers[i].Guid ) then
          hmpCountdown(compass.markers[compass.cannonOrder[compass.curCannon]])
          break
        end
      end
    end
  end
end

local function AnimatePreview(marker, time, offset)
  marker.InGameVisibility = true
  
  if( time <= 6-offset ) then
    marker.Alpha = compass.alpha[1]
  elseif( time > 6-offset and time <= 10 ) then
    if( cat[1][1] ) then
      marker.Alpha = compass.alpha[2]
    elseif( cat[1][2] and offset == compass.pVar.mech[1] ) then
      marker.Alpha = compass.alpha[2]
    elseif( cat[1][3] and offset == compass.pVar.mech[2] ) then
      marker.Alpha = compass.alpha[2]
    end
    
  elseif( time > 10 and time < 15 ) then
    marker.InGameVisibility = false
    compass.pVar.sub = compass.pVar.sub + 10
    if( compass.pVar.current == 8 ) then compass.pVar.current = 1
    else compass.pVar.current = compass.pVar.current + 1 end
    --If the marker requires a countdown, we give it here
    --(since this is code that is only run once per ~30s)
    if( cat[2][1] ) then
      for i = 1, 4 do
        if( marker.Guid == compass.preview[i].Guid ) then
          hmpCountdown(compass.preview[compass.cannonOrder[compass.pVar.current]])
          break
        end
      end
    end
  end
end

ResetCompass()
UpdateCategoryStates()
UpdateCompassTexture(compass.markers)

local function tick_compass_Sabetha(gameTime)
  if( not player.IsInCombat and World:CategoryByType("HMP.W1_B4.c4.sc1"):IsVisible() and (player.Position - compass.pVar.center):Length() < 30 ) then
    CheckCategoryStates()
    
    if( compass.pVar.current == 0 ) then
      ResetPreview()
      UpdateCompassTexture(compass.preview)
      compass.pVar.start = gameTime.TotalGameTime.TotalSeconds
      for i = 1, 3 do
        if( cat[1][i] ) then
          if( i == 1 and cat[2][1] ) then break end
          if( i == 2 ) then compass.pVar.mech[1] = 2 break end
          if( i == 3 ) then compass.pVar.mech[2] = 2 break end
        end
      end
      if( cat[2][1] ) then
        hmpCountdown(compass.preview[1])
      end
      compass.pVar.current = 1
    end
    
    local time = ( gameTime.TotalGameTime.TotalSeconds - compass.pVar.start )
    Debug:Watch("Sabetha Preview Time: ", time .. "s")
    
    if( compass.pVar.current == 1 ) then AnimatePreview( compass.preview[1], time-compass.pVar.sub, compass.pVar.mech[1] ) end
    if( compass.pVar.current == 2 ) then AnimatePreview( compass.preview[2], time-compass.pVar.sub, compass.pVar.mech[2] ) end
    if( compass.pVar.current == 3 ) then AnimatePreview( compass.preview[3], time-compass.pVar.sub, compass.pVar.mech[1] ) end
    if( compass.pVar.current == 4 ) then AnimatePreview( compass.preview[4], time-compass.pVar.sub, compass.pVar.mech[2] ) end
    if( compass.pVar.current == 5 ) then AnimatePreview( compass.preview[1], time-compass.pVar.sub, compass.pVar.mech[1] ) end
    if( compass.pVar.current == 6 ) then AnimatePreview( compass.preview[3], time-compass.pVar.sub, compass.pVar.mech[2] ) end
    if( compass.pVar.current == 7 ) then AnimatePreview( compass.preview[2], time-compass.pVar.sub, compass.pVar.mech[1] ) end
    if( compass.pVar.current == 8 ) then AnimatePreview( compass.preview[4], time-compass.pVar.sub, compass.pVar.mech[2] ) end
  elseif( player.IsInCombat or not World:CategoryByType("HMP.W1_B4.c4.sc1"):IsVisible() or (player.Position - compass.pVar.center):Length() >= 30 ) then
    ResetPreview()
  end
  
  --When the compass is enabled by the user and the user is around Sabetha, we "begin" this script
  if( World:CategoryByType("HMP.W1_B4.c4.sc2"):IsVisible() and (player.Position - compass.bossPos):Length() < 110 ) then
    CheckCategoryStates()
    
    --"Begins" the Script
    if( player.IsInCombat and compass.curCannon == 0) then
      ResetCompass()
      compass.startTime = gameTime.TotalGameTime.TotalSeconds
      compass.markers[1].ResetLength = 38
      for i = 1, 3 do
        if( cat[1][i] ) then
          if( i == 1 and cat[2][1] ) then break end
          if( i == 2 ) then compass.mechCannon[1] = 2 break end
          if( i == 3 ) then compass.mechCannon[2] = 2 break end
        end
      end
      if( cat[2][1] ) then
        hmpCountdown(compass.markers[1])
        compass.markers[1].ResetLength = 30
      end
      compass.curCannon = 1
    end
    
    local time = ( gameTime.TotalGameTime.TotalSeconds - compass.startTime )
    Debug:Watch("Sabetha Compass Time: ", time .. "s")
    
    --Cannon Functions
    if( compass.curCannon == 1 ) then AnimateCompass( compass.cannonPositions[1], compass.markers[1], time-compass.subtract, compass.mechCannon[1] ) end
    if( compass.curCannon == 2 ) then AnimateCompass( compass.cannonPositions[2], compass.markers[2], time-compass.subtract, compass.mechCannon[2] ) end
    if( compass.curCannon == 3 ) then AnimateCompass( compass.cannonPositions[3], compass.markers[3], time-compass.subtract, compass.mechCannon[1] ) end
    if( compass.curCannon == 4 ) then AnimateCompass( compass.cannonPositions[4], compass.markers[4], time-compass.subtract, compass.mechCannon[2] ) end
    if( compass.curCannon == 5 ) then AnimateCompass( compass.cannonPositions[1], compass.markers[1], time-compass.subtract, compass.mechCannon[1] ) end
    if( compass.curCannon == 6 ) then AnimateCompass( compass.cannonPositions[3], compass.markers[3], time-compass.subtract, compass.mechCannon[2] ) end
    if( compass.curCannon == 7 ) then AnimateCompass( compass.cannonPositions[2], compass.markers[2], time-compass.subtract, compass.mechCannon[1] ) end
    if( compass.curCannon == 8 ) then AnimateCompass( compass.cannonPositions[4], compass.markers[4], time-compass.subtract, compass.mechCannon[2] ) end
    
    --"Resets" the Script
    if( not player.IsInCombat and compass.curCannon > 0 ) then ResetCompass() end
  end
end

Event:OnTick(tick_compass_Sabetha)