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
    marker:SetTexture("MyStuff/Better Gathering Markers/Herbs.png")
    marker.Tint = I:Color(167, 255, 166, 255)
  elseif(parentCat == World:CategoryByType("HMP.openWorld.mining")) then
    marker:SetTexture("MyStuff/Better Gathering Markers/Ores.png")
    marker.Tint = I:Color(207, 207, 207, 255)
  elseif(parentCat == World:CategoryByType("HMP.openWorld.lumber")) then
    if( marker.Category.Namespace == World:CategoryByType("HMP.openWorld.lumber.lowlineSapling")) then
      marker:SetTexture("MyStuff/Better Gathering Markers/LowlineSapling.png")
    else
      marker:SetTexture("MyStuff/Better Gathering Markers/Wood.png")
    end
    marker.Tint = I:Color(255, 218, 133, 255)
  elseif(parentCat == World:CategoryByType("HMP.openWorld.miscFarm")) then
    marker:SetTexture("MyStuff/Better Gathering Markers/Chest.png")
    marker.Tint = I:Color(153, 153, 153, 255)
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
      InGameVisibility = false,
      MinimapVisibility = true,
      MapVisibility = true,
      MapDisplaySize = 32,
    }
    local marker = Pack:CreateMarker(attr)
    AddTexture(marker)
  end
end

MakeMinimapMarkers()