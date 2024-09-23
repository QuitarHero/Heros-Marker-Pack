Pack:Require("scripts/Utility/CoordConvert.lua")

HMP.GatheringIcons = {
  Markers = World:CategoryByType("HMP.openWorld"):GetMarkers(true),
  Map = Mumble.CurrentMap.Id,
}

Debug:Watch("Gathering Icons", HMP.GatheringIcons)
local gIcons = HMP.GatheringIcons

local function AddTexture(marker)
  local parentCat = marker.Category.Parent
  if(parentCat == World:CategoryByType("HMP.openWorld.harvesting")) then
    if( marker.Category.Namespace == World:CategoryByType("HMP.openWorld.harvesting.honeyFlower").Namespace) then
      marker:SetTexture("Assets/OpenWorld/Harvesting/Honey Flower.png")
    else 
      marker:SetTexture("Assets/OpenWorld/Harvesting/Herbs.png")
    end
    marker.Tint = I:Color(167, 255, 166, 255)
  elseif(parentCat == World:CategoryByType("HMP.openWorld.mining")) then
    if( marker.Category.Namespace == World:CategoryByType("HMP.openWorld.mining.chargedTitan").Namespace) then
      marker:SetTexture("Assets/OpenWorld/Mining/Charged Titan.png")
    elseif( marker.Category.Namespace == World:CategoryByType("HMP.openWorld.mining.rottedAmber").Namespace) then
      marker:SetTexture("Assets/OpenWorld/Mining/Rotted Amber.png")
    else
      marker:SetTexture("Assets/OpenWorld/Mining/Ores.png")
    end
    marker.Tint = I:Color(207, 207, 207, 255)
  elseif(parentCat == World:CategoryByType("HMP.openWorld.lumber")) then
    if( marker.Category.Namespace == World:CategoryByType("HMP.openWorld.lumber.lowlandPine").Namespace) then
      marker:SetTexture("Assets/OpenWorld/Circle.png")
      marker.Tint = I:Color(255, 255, 255, 255)
    else
      marker:SetTexture("Assets/OpenWorld/Logging/Wood.png")
      marker.Tint = I:Color(255, 218, 133, 255)
    end
  elseif(parentCat == World:CategoryByType("HMP.openWorld.chestFarm")) then
    marker:SetTexture("Assets/OpenWorld/Chest.png")
    marker.Tint = I:Color(255, 255, 255, 255)
  else
    marker.MiniMapVisibility = false
    marker.MapVisibility = false
  end
end

local function MakeMinimapMarkers()
  for _,v in ipairs(gIcons.Markers) do
    local newCoords = Utility.Coordinates.GetOffsetWorldCoords(gIcons.Markers[_].Position, gIcons.Map)
    local attr = {
      MapID = gIcons.Map,
      xpos = newCoords.X,
      ypos = newCoords.Z,
      zpos = newCoords.Y + 2,
      type = gIcons.Markers[_].Category.Namespace,
      guid = gIcons.Markers[_].Guid,
      InGameVisibility = false,
      MinimapVisibility = true,
      MapVisibility = true,
      MapDisplaySize = 32,
      alpha = 2,
    }
    local marker = Pack:CreateMarker(attr)
    AddTexture(marker)
  end
end

MakeMinimapMarkers()