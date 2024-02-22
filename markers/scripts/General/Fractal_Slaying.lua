HMP.Fractal_Slaying = {
  names = { --Table references to each fractal's MapID and type abbreviation
    { 956,  "AB" }, { 951,  "AR" }, { 960,  "CMT" }, { 1164, "CI" },  { 952,  "CS" },
    { 1290, "DS" }, { 959,  "MB" }, { 955,  "MF" },  { 1177, "NM" },  { 1205, "ShO" },
    { 1309, "SR" }, { 948,  "SB" },  { 958,  "SoO" }, { 1384, "SP" }, --{ 1500, "SS" }, Silent Surf not supported yet.
    { 949,  "SL" }, { 957,  "TR" }, { 1267, "TO" },  { 947,  "UC" },  { 953,  "UF" },
    { 950,  "UB" }, { 954,  "VO" }
  },
  markers = nil
}

local slaying, map = HMP.Fractal_Slaying, Mumble.CurrentMap.Id

local function DisplaySlaying()
  if( map ~= 872 and map ~= 1500 ) then --If the map we're on is *not* Mistlock Observatory nor Silent Surf
    
    for _,v in ipairs(slaying.names) do
      if( map == v[1] ) then
        --We get all (nested) markers in the fractal's Slaying category, then stop the loop
        slaying.markers = World:CategoryByType("HMP.F_" .. v[2] .. "_sy"):GetMarkers(true)
        break
      end
    end
    
    for _,v in ipairs(slaying.markers) do
      local attr = {
        MapId = map,
        xpos = v.Position.X,
        ypos = v.Position.Z,
        zpos = v.Position.Y,
        type = v.Category.Namespace,
        MapDisplaySize = 24,
        InGameVisibility = false,
        MapVisibility = true,
        MinimapVisibility = true,
      }
      --We create and set the texture of our new map markers.
      --There is no need to reference these markers ever again,
      --so we don't save them in the initial object.
      local mapMarker = Pack:CreateMarker(attr)
      mapMarker:SetTexture("Assets/Fracs/MapSlaying.png")
    end
  end
end

--We only want this function to run once
DisplaySlaying()