HMP.PathingVersionCheck = {
  {1, 9, 0}, --Stable
  {1, 10, 4} --Daily Fractal Script Requirement
}

local moduleCheck = HMP.PathingVersionCheck

function HMP_GetPathingVersion(checkRef)
  local version = tostring(PathingVersion)
  local userVersion, value = {}, 0
  --We get the 1st number of the version
  for i = value, 50 do
    if( string.sub(version, i, i) == "." ) then
      table.insert(userVersion, tonumber(string.sub(version, value, i-1)))
      value = i+1
      break
    end
  end
  --We get the 2nd number of the version
  for i = value, 50 do
    if( string.sub(version, i, i) == "." ) then
      table.insert(userVersion, tonumber(string.sub(version, value, i-1)))
      value = i+1
      break
    end
  end
  --We get the 3rd number of the version
  for i = value, 50 do
    if( string.sub(version, i, i) == "" ) then
      table.insert(userVersion, tonumber(string.sub(version, value, i-1)))
      value = i+1
      break
    end
  end
  
  --Checking version
  for i = 1, #moduleCheck[checkRef] do
    if( userVersion[i] < moduleCheck[checkRef][i] ) then
      return false
    end
  end
  
  return true
end

function HMP_NotifyUser(version)
  local ver = "v" .. moduleCheck[version][1] .. "." .. moduleCheck[version][2] .. "." .. moduleCheck[version][3]
  local attr = {
    MapID = Mumble.CurrentMap.Id,
    xpos = Mumble.PlayerCharacter.Position.X,
    ypos = Mumble.PlayerCharacter.Position.Z,
    zpos = Mumble.PlayerCharacter.Position.Y,
    type = "HMP.Daily_Fractals",
    TriggerRange = 10000,
    AutoTrigger = true,
    Info = "Hero's Pack: The Daily Fractal features of the marker pack requires a Pathing Module version of " .. ver .. " or above. Please update your Pathing Module. You may need to enable Preview Releases in Blish HUD."
  }
  local marker = Pack:CreateMarker(attr)
  marker:SetTexture("Assets/General/empty.png")
end