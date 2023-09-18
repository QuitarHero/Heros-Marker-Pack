HMP.W6B2_Aide = {
  curMarkers = {},
  previewMarkers = World:CategoryByType("HMPscripts.W6_B2.c0"):GetMarkers(),
  check = { {false, false, false}, {false, false, false} },
  centerPos = { --Nikare P1-3, Kenut P1-3
    I:Vector3(366.862, -82.811, 33.557), I:Vector3(295.256, 39.582, 33.557), I:Vector3(294.817, 125.677, 33.557),
    I:Vector3(366.792, 1.175, 33.557),   I:Vector3(440.029, 40.765, 33.557), I:Vector3(439.923, 125.515, 33.557)
  },
  centerPoint = I:Vector3(367.5189, 39.95331, 33.557),
  track = { 0, 0, 0, 0, 0, 0 },
  time = 0,
  duration = 115000,
  height = {33.55, 0},
  size = {1, 3, 1.25, 0.75},
  color = { I:Color(255, 0, 0, 255), I:Color(255, 255, 255, 255) },
  path = "Data/Raids/W6B2/",
  icons = {
    { "Icon1.png", "Icon2.png" },
    { "nikare.png", "kenut.png" },
    { "n.png", "k.png" },
    "Geyser.png",
    "Data/General/empty.png"
  },
  b1_GUID = { "h/UIEZo4hkKJ+8geDOZCkA==", "TJThngoYGkm/+qATogAwkw==", "q7NIQqoIkkK/jYSRHkWzlw==" },
  b2_GUID = { "uFMjTyXW3ka5eDy0NoHhxA==", "5Af4bCPaHEmnE4iqPo2OkA==", "wu3qFb1RE0Gg3GrNIFaaIg==", "7aXiDzTU60yBBhlDKe8TZg==" }
}

Debug:Watch("TL Aide Variables", HMP.W6B2_Aide)
local TL, player = HMP.W6B2_Aide, Mumble.PlayerCharacter

--Determines which Twin Largos Platform the player is currently on
local function changeTrack(index) for i = 1, #TL.track do if(i == index) then TL.track[i] = 1 else TL.track[i] = 0 end end end

--Gets the current platform's markers
local function GetMarkers(index)
  TL.curMarkers = {}
  
  if( index == 2 or index == 5 ) then
    TL.curMarkers = World:GetClosestMarkers(2)
  else
    TL.curMarkers = World:GetClosestMarkers(4)
  end
end

--Changes Boss Icon based on user preference
local function changeIcon(index)
  local check = {false, false}
  --If the platform the player is on can lead to Nikare...
  if( index % 2 == 0 ) then
    for i = 1, #TL.curMarkers do
      TL.curMarkers[i].Texture = TL.previewMarkers[1].Texture
      TL.curMarkers[i].Size = TL.previewMarkers[1].Size
      if( not check[1] ) then
        for k = 1, #TL.b1_GUID do
          if(TL.curMarkers[i].Guid:ToBase64() == TL.b1_GUID[k]) then
            TL.curMarkers[i].Texture = TL.previewMarkers[2].Texture
            if( index == 6 and not TL.check[1][2] or not TL.check[2][1] and not TL.check[2][2] and not TL.check[2][3] ) then
              TL.curMarkers[i].Tint = TL.color[1]
              TL.curMarkers[i].Size = TL.size[4]
            else
              TL.curMarkers[i].Tint = TL.color[2]
              TL.curMarkers[i].Size = TL.previewMarkers[2].Size
            end
            check[1] = true
            break
          end
        end
      end
      if( index == 4 and not check[2] ) then
        for k = 1, #TL.b2_GUID do
          if(TL.curMarkers[i].Guid:ToBase64() == TL.b2_GUID[k]) then
            TL.curMarkers[i].Texture = TL.previewMarkers[3].Texture
            TL.curMarkers[i].Size = TL.previewMarkers[3].Size
            check[2] = true
            break
          end
        end
      end
    end
    
  --If the platform the player is on can lead to Kenut...
  else
    for i = 1, #TL.curMarkers do
      TL.curMarkers[i].Texture = TL.previewMarkers[1].Texture
      TL.curMarkers[i].Size = TL.previewMarkers[1].Size
      if( not check[1] ) then
        for k = 1, #TL.b2_GUID do
          if(TL.curMarkers[i].Guid:ToBase64() == TL.b2_GUID[k]) then
            TL.curMarkers[i].Texture = TL.previewMarkers[3].Texture
            if( index == 3 and not TL.check[1][3] or not TL.check[2][1] and not TL.check[2][2] and not TL.check[2][3] ) then
              TL.curMarkers[i].Tint = TL.color[1]
              TL.curMarkers[i].Size = TL.size[4]
            else
              TL.curMarkers[i].Tint = TL.color[2]
              TL.curMarkers[i].Size = TL.previewMarkers[3].Size
            end
            check[1] = true
            break
          end
        end
      end
    end
  end
end

--Updates the Preview Icons when the Category changes
local function UpdatePreviewIcon()
  local catStates = { {}, {} }
  for i = 1, 2 do
    for k = 1, 3 do
      table.insert(catStates[i], World:CategoryByType("HMPscripts.W6_B2.c" .. i .. ".sc" .. k):IsVisible())
    end
  end
  
  for k1, cat in ipairs(catStates[1]) do
    if( cat ) then
      TL.check[1][k1] = true
      if( k1 > 1 ) then
        for k2, icon in ipairs(catStates[2]) do
          if( icon ) then
            TL.previewMarkers[k1]:SetTexture(TL.path .. TL.icons[k2][(k1-1)])
            TL.previewMarkers[k1].Size = TL.size[k2]
            break
          end
          if( k2 == #catStates[2] and not icon ) then
            TL.previewMarkers[k1].Size = TL.size[4]
            if( catStates[1][1] ) then
              TL.previewMarkers[k1]:SetTexture(TL.path .. TL.icons[4])
            else
              TL.previewMarkers[k1]:SetTexture(TL.icons[5])
            end
          end
        end
      else
        TL.check[1][k1] = true
        TL.previewMarkers[1]:SetTexture(TL.path .. TL.icons[4])
        TL.previewMarkers[1].Size = TL.size[4]
      end
    else
      TL.check[1][k1] = false
      TL.previewMarkers[k1].Size = TL.size[4]
      if( catStates[1][1] ) then
        TL.previewMarkers[k1]:SetTexture(TL.path .. TL.icons[4])
      else
        TL.previewMarkers[k1]:SetTexture(TL.icons[5])
      end
    end
  end
  
  for v, icon in ipairs(catStates[2]) do
    if( icon ) then
      TL.check[2][v] = true
    else
      TL.check[2][v] = false
    end
  end
end

UpdatePreviewIcon()

local function Tick_LargosDirections(gameTime)
  --We always check if the user has changed their category preferences, and only update when something's been changed.
  for i = 1, #TL.check do
    for k = 1, #TL.check[i] do
      if( World:CategoryByType("HMPscripts.W6_B2.c" .. i .. ".sc" .. k):IsVisible() ~= TL.check[i][k]) then
        UpdatePreviewIcon()
      end
    end
  end
  --We only begin this script when the player is in combat.
  if( player.IsInCombat and (player.Position - TL.centerPoint):Length() <= 200 and World:CategoryByType("HMPscripts.W6_B2"):IsVisible() ) then
    for i = 1, #TL.centerPos do
      
      --When the player enters a new platform, we decide what shows.
      if( ( player.Position - TL.centerPos[i] ):Length() <= 20 and TL.track[i] ~= 1 ) then
        if(TL.curMarkers ~= nil) then for _, marker in ipairs(TL.curMarkers) do marker.InGameVisibility = false end end
        TL.time = gameTime.TotalGameTime.TotalMilliseconds
        changeTrack(i) GetMarkers(i) changeIcon(i)
        for _, marker in ipairs(TL.curMarkers) do marker.InGameVisibility = true end
      end
      
      --When a platform is activated, we begin animating each marker's descent
      if( TL.track[i] == 1 ) then
        for k = 1, #TL.curMarkers do
          HMPphysics.animate.Descend(gameTime.TotalGameTime.TotalMilliseconds, TL.time, TL.duration, TL.height[1], TL.height[2], TL.curMarkers[k])
        end
        
        --When we reach the bottom of the platform, we reset the markers and platform.
        if( TL.curMarkers[1].Position.Z < 0 ) then
          for k = 1, #TL.curMarkers do TL.curMarkers[k].InGameVisibility = false end
          TL.track[i] = 0
        end
      end
    end
  else
    --If the player is not in combat, we ensure nothing shows and "reset" the script.
    if( TL.curMarkers ~= nil ) then
      for _, marker in ipairs(TL.curMarkers) do marker.InGameVisibility = false end
      for i = 1, #TL.track do TL.track[i] = 0 end
      TL.curMarkers = {}
    end
  end
end

Event:OnTick(Tick_LargosDirections)