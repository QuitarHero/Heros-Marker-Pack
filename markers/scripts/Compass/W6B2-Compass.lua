HMP.TwinLargosCompass = {
  markers = World:CategoryByType("hmpAlpha.W6_Compass"):GetMarkers(),
  centerPos = { --Nikare P1-3, Kenut P1-3
    I:Vector3(366.862, -82.811, 33.557), I:Vector3(295.256, 39.582, 33.557), I:Vector3(294.817, 125.677, 33.557),
    I:Vector3(366.792, 1.175, 33.557),   I:Vector3(440.029, 40.765, 33.557), I:Vector3(439.923, 125.515, 33.557)
  },
  pos = {
    --Nikare P1-3
    { I:Vector3(366.792, 1.175, 0),   I:Vector3(367.120, -122.282, 0), I:Vector3(330.608, -80.781, 0), I:Vector3(402.621, -80.950, 0) },
    { I:Vector3(295.065, 125.881, 0), I:Vector3(334.086, 20.901, 0) },
    { I:Vector3(439.923, 125.515, 0), I:Vector3(296.011, 81.542, 0),   I:Vector3(264.214, 126.731, 0), I:Vector3(316.117, 146.794, 0) },
    --Kenut P1-3
    { I:Vector3(295.256, 39.582, 0),  I:Vector3(440.029, 40.765, 0),  I:Vector3(367.046, -41.765, 0), I:Vector3(368.874, 42.697, 0) },
    { I:Vector3(439.726, 125.123, 0), I:Vector3(400.995, 21.577, 0) },
    { I:Vector3(294.817, 125.677, 0), I:Vector3(440.421, 80.713, 0),   I:Vector3(469.278, 126.329, 0), I:Vector3(418.478, 146.667, 0) }
  },
  track = {0, 0, 0, 0, 0, 0},
  color = { I:Color(255, 255, 255, 255), I:Color(0, 251, 255, 255) },
  
}

Debug:Watch("Largos Compass", HMP.TwinLargosCompass)
local compass = HMP.TwinLargosCompass


local function changeTrack(index) for i = 1, #compass.track do if(i == index) then compass.track[i] = 1 else compass.track[i] = 0 end end end


local function setAttr(index)
  for i = 1, 4 do
    if( i == 1 and index <= 2 or i == 1 and index == 4 or i == 1 and index == 6 ) then
      compass.markers[i]:SetTexture("Assets/Raids/nikare.png")
      compass.markers[i].Tint = compass.color[1]
      compass.markers[i].HeightOffset = 2
    elseif( i == 1 and index == 3 or i == 2 and index == 4 or i == 1 and index == 5 ) then
      compass.markers[i]:SetTexture("Assets/Raids/kenut.png")
      compass.markers[i].Tint = compass.color[1]
      compass.markers[i].RotationXyz = nil
      compass.markers[i].HeightOffset = 2
    elseif( World:CategoryByType("hmpAlpha.W6_Compass.c2"):IsVisible() ) then
      compass.markers[i]:SetTexture("Storage/1433816.png")
      compass.markers[i]:SetRotX(math.pi)
      compass.markers[i].Tint = compass.color[2]
      compass.markers[i].HeightOffset = 1.5
    else
      compass.markers[i].InGameVisibility = false
    end
  end
end


local function Tick_LargosCompass(gameTime)
  if( not Mumble.PlayerCharacter.IsInCombat ) then
    for i = 1, #compass.centerPos do
      
      if( ( Mumble.PlayerCharacter.Position - compass.centerPos[i] ):Length() <= 20 and compass.track[i] ~= 1 ) then
        changeTrack(i) setAttr(i)
        Debug:Print("i: " .. i)
      end
      
      if( compass.track[i] == 1 ) then
        local catState = World:CategoryByType("hmpAlpha.W6_Compass.c2"):IsVisible()
        for k = 1, 4 do
          
          if( compass.pos[i][k] ~= nil ) then
            
            local playerXY = I:Vector3(Mumble.PlayerCharacter.Position.X, Mumble.PlayerCharacter.Position.Y, 0)
            local vector = ( compass.pos[i][k] - playerXY )
            vector = vector / vector:Length()
            local compassPos = Mumble.PlayerCharacter.Position + vector * 2
            
            if( k == 2 and i ~= 4 or k >= 3 ) then
              compass.markers[k]:SetRotZ(math.atan2(vector.Y, vector.X) - (math.pi / 2))
            end
            
            compass.markers[k]:SetPos(compassPos.X, compassPos.Y, Mumble.PlayerCharacter.Position.Z - 1.5)
            compass.markers[k].InGameVisibility = true
          else
            compass.markers[k].InGameVisibility = false
            break
          end
          
        end
      end
    end
  end
end

Event:OnTick(Tick_LargosCompass)