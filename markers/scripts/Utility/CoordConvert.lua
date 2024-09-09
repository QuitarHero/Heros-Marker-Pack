Pack:Require("scripts/Continents/MapInfo.lua")
Pack:Require("scripts/Utility/Math.lua")
Utility.Coordinates = {
  --Takes Mumble coordinates
  MumbleToMap = function(coordinate)
    local newCoord = coordinate
    newCoord.X = newCoord.X * 39.3701
    newCoord.Y = newCoord.Y * 39.3701
    newCoord.Z = newCoord.Z * 39.3701
    return newCoord
  end,
  --Takes Map Cordinates
  MapToMumble = function(coordinate)
    local newCoord = coordinate
    newCoord.X = newCoord.X / 39.3701
    newCoord.Y = newCoord.Y / 39.3701
    newCoord.Z = newCoord.Z / 39.3701
    return newCoord
  end,
  --Requires X/Z Map Coordinates to work. Use a previous function if needed.
  MapToWorld = function(coordinate, map)
    local cRect, mRect, result = HMP.Continents.Info[map].Continent, HMP.Continents.Info[map].Map, coordinate
    result.X = cRect.TL[1] + ( 1 * ( coordinate.X - mRect.TL[1] ) / ( mRect.BR[1] - mRect.TL[1] ) * ( cRect.BR[1] - cRect.TL[1] ) )
    result.Y = cRect.TL[2] + (-1 * ( coordinate.Y - mRect.BR[2] ) / ( mRect.BR[2] - mRect.TL[2] ) * ( cRect.BR[2] - cRect.TL[2] ) )
    return result
  end,
  --Requires X/Z World Coordinates. Use a previous function if needed.
  WorldToMap = function(coordinate, map)
    local cRect, mRect, result = HMP.Continents.Info[map].Continent, HMP.Continents.Info[map].Map, coordinate
    result.X =  ( mRect.TL[1] + ( coordinate.X - cRect.TL[1] ) / cRect.Size[1] * mRect.Size[1] )
    result.Y = -( mRect.TL[2] + ( coordinate.Y - cRect.TL[2] ) / cRect.Size[2] * mRect.Size[2] )
    return result
  end,
  --Requires Mumble coords, returns Mumble Coords
  GetOffsetWorldCoords = function(coordinate, map)
    local coords = coordinate
    coords = Utility.Coordinates.MumbleToMap(coords)
    coords = Utility.Coordinates.MapToWorld(coords, map)
    coords.X = Utility.Math.Round(coords.X)
    coords.Y = Utility.Math.Round(coords.Y)
    coords.Z = Utility.Math.Round(coords.Z)
    coords = Utility.Coordinates.WorldToMap(coords, map)
    coords = Utility.Coordinates.MapToMumble(coords)
    return coords
  end
}