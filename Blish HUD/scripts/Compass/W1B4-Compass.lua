HMP.CompassSabetha = {
  markers = World:CategoryByType("HMP.W1_B4.c25"):GetMarkers(),
  cannonPositions = {
    I:Vector3(-133.2225, 52.42474, 62.82022),
    I:Vector3(-161.7514, 87.51527, 62.01423),
    I:Vector3(-126.3933, 115.5325, 62.80072),
    I:Vector3(-97.97771, 80.63229, 62.89721)
  },
  launchPlatforms = {
    I:Vector3(-132.6284, 56.2659, 62.96154),
    I:Vector3(-157.6624, 86.99155, 62.27127),
    I:Vector3(-126.8654, 111.9275, 62.9425),
    I:Vector3(-101.9276, 81.16863, 63.0384)
  },
  bossPos = I:Vector3(-128.986, 85.266, 62.386),
  cmdrIds = { 1335145, 1335146, 1335147, 1335148, 1335149, 1335150, 1335151, 1335152 },
  cannon = 0,
  curTime = 0,
  iconCheck = 0,
  subtract = 0,
  alpha = {0.5, 0.9},
  cannonMech = {0, 0},
  enrage = 480,
}

local compass, player = HMP.CompassSabetha, Mumble.PlayerCharacter
Debug:Watch("Sab Compass Variables", HMP.CompassSabetha)

local function setCompassTexture(category)
  --If the user wants Directional marker icons
  if(category == 1) then
    compass.markers[1]:SetTexture("Data/General/s.png")
    compass.markers[2]:SetTexture("Data/General/w.png")
    compass.markers[3]:SetTexture("Data/General/n.png")
    compass.markers[4]:SetTexture("Data/General/e.png")
  --If the user wants Numerical marker icons
  elseif(category == 2) then
    --If the user wants Individual Numbers
    if(World:CategoryByType("HMP.W1_B4.c25.sc3.asc2.num1"):IsVisible()) then
      compass.markers[1]:SetTexture("Data/General/1.png")
      compass.markers[2]:SetTexture("Data/General/2.png")
      compass.markers[3]:SetTexture("Data/General/3.png")
      compass.markers[4]:SetTexture("Data/General/4.png")
    --If the user wants Combination Numbers
    else
      for i = 1, #compass.markers do
        if(i % 2 == 1) then
          compass.markers[i]:SetTexture("Data/General/1and3.png")
        else
          compass.markers[i]:SetTexture("Data/General/2and4.png")
        end
      end
    end
  --If the user wants Commander Markers
  elseif(category == 3) then
    for i = 1, #compass.markers do
      for k = 1, 8 do
        if( World:CategoryByType("HMP.W1_B4.c25.sc3.asc3.dir" .. i .. ".cmdr" .. k):IsVisible() ) then
          compass.markers[i]:SetTexture(compass.cmdrIds[k]) break
        end
      end
    end
  end
end

local function animateCannon(cannonPosition, marker, time, offset)
  --Sets the Marker's Position
  local cannonVector = (cannonPosition - player.Position)
  cannonVector = cannonVector / cannonVector:Length()
  local cannonPos = player.Position + cannonVector * 2.5
  marker:SetPos(cannonPos.X, cannonPos.Y, 61.5)
  
  --Determines Compass visibility based on player position
  if((player.Position - compass.bossPos):Length() > 31) then
    marker.InGameVisibility = false
  else
    for _, position in ipairs(compass.launchPlatforms) do
      if((player.Position - position):Length() < 4) then marker.InGameVisibility = false break
      elseif(_ == #compass.launchPlatforms) then marker.InGameVisibility = true end
    end
  end
  
  --Changes marker opacity based on time elapsed
  if(time <= 34-offset) then marker.Alpha = compass.alpha[1]
  elseif(time > 34-offset and time <= 37) then marker.Alpha = compass.alpha[2]
    
  --When the "Currrent Cannon" finishes, we do this
  elseif(time > 37 and time < 50) then --"50" is specified here due to the script hitting the condition otherwise multiple times when it shouldn't
    marker.InGameVisibility = false
    compass.subtract = compass.subtract + 30
    if(compass.cannon == 8) then compass.cannon = 1
    else compass.cannon = compass.cannon + 1 end
  end
end

--Resets variables
local function resetSabCompass()
  for i = 1, #compass.markers do compass.markers[i].InGameVisibility = false end
  compass.curTime = 0
  compass.iconCheck = 0
  compass.cannon = 0
  compass.subtract = 0
  compass.cannonMech = {0, 0}
end

local function tick_compassSabetha(gameTime)
  --If the user enables the compass and is around Sabetha, we actually do things
  if(World:CategoryByType("HMP.W1_B4.c25.sc1"):IsVisible() and (player.Position - compass.bossPos):Length() < 110) then
    
    --"Begins" the Script
    if(player.IsInCombat == false and compass.cannon == 0) then
      resetSabCompass()
      compass.curTime = math.floor(gameTime.TotalGameTime.TotalSeconds)
      for i = 1, 3 do
        if( World:CategoryByType("HMP.W1_B4.c25.sc2.asc" .. i):IsVisible() ) then
          if(i == 1) then break
          elseif(i == 2) then compass.cannonMech[1] = 2 break
          elseif(i == 3) then compass.cannonMech[2] = 2 break end
        end
      end
      --Set the texture based on the user's choice
      for i = 1, 3 do if( World:CategoryByType("HMP.W1_B4.c25.sc3.asc" .. i):IsVisible() ) then setCompassTexture(i) break end end
      compass.cannon = 1
      compass.iconCheck = 1
    end
    
    --Use this a lot so made it into a variable for convenience
    local timeDiff = math.floor(gameTime.TotalGameTime.TotalSeconds - compass.curTime)
    Debug:Watch("Sab Compass Time", timeDiff .. "s")
    
    --Every second we update textures to the user's choice
    if( timeDiff >= compass.iconCheck ) then
      for i = 1, 3 do if( World:CategoryByType("HMP.W1_B4.c25.sc3.asc" .. i):IsVisible() ) then setCompassTexture(i) break end end
      compass.iconCheck = compass.iconCheck + 1
    end
    
    --Cannon Functions
    if(compass.cannon == 1) then animateCannon(compass.cannonPositions[1], compass.markers[1], timeDiff-compass.subtract, compass.cannonMech[1]) end
    if(compass.cannon == 2) then animateCannon(compass.cannonPositions[2], compass.markers[2], timeDiff-compass.subtract, compass.cannonMech[2]) end
    if(compass.cannon == 3) then animateCannon(compass.cannonPositions[3], compass.markers[3], timeDiff-compass.subtract, compass.cannonMech[1]) end
    if(compass.cannon == 4) then animateCannon(compass.cannonPositions[4], compass.markers[4], timeDiff-compass.subtract, compass.cannonMech[2]) end
    if(compass.cannon == 5) then animateCannon(compass.cannonPositions[1], compass.markers[1], timeDiff-compass.subtract, compass.cannonMech[1]) end
    if(compass.cannon == 6) then animateCannon(compass.cannonPositions[3], compass.markers[3], timeDiff-compass.subtract, compass.cannonMech[2]) end
    if(compass.cannon == 7) then animateCannon(compass.cannonPositions[2], compass.markers[2], timeDiff-compass.subtract, compass.cannonMech[1]) end
    if(compass.cannon == 8) then animateCannon(compass.cannonPositions[4], compass.markers[4], timeDiff-compass.subtract, compass.cannonMech[2]) end
    
    --"Resets" the Script
    if(player.IsInCombat == true and compass.cannon > 0 or timeDiff > compass.enrage) then resetSabCompass() end
  else
    resetSabCompass()
  end
end

Event:OnTick(tick_compassSabetha)