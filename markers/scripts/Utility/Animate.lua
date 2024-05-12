local function GetVelocity(a1, a2, duration, time)
  local v = a1 - ( ( a1 - a2 ) / duration ) * time
  return v
end

HMPphysics.animate = {
  --Increases the size of a marker from 'minSize' to 'maxSize' over 'duration'
SizeGrow = function (gameTime, startTime, duration, minSize, maxSize, marker)
  marker.Size = minSize + ((maxSize-minSize) * ((gameTime-startTime) / duration))
end,

--Decreases the size of a marker from 'maxSize' to 'minSize' over 'duration'
SizeShrink = function (gameTime, startTime, duration, minSize, maxSize, marker)
  marker.Size = maxSize - ((maxSize-minSize) * ((gameTime-startTime) / duration))
end,

--Fades out a marker from 'maxAlpha' to 0 over 'duration'
FadeOut = function(gameTime, startTime, duration, maxAlpha, marker)
  marker.Alpha = maxAlpha * (1 - ((gameTime-startTime) / duration))
end,

--Fades in a marker from 0 to 'maxAlpha' over duration
FadeIn = function(gameTime, startTime, duration, maxAlpha, marker)
  marker.Alpha = maxAlpha * ((gameTime-startTime) / duration)
end,

--Do not use, does not work
Pulse = function(gameTime, startTime, duration, interval, maxAlpha, minAlpha, marker)
  Debug:Print("Why did you use the Pulse function?")
end,

--Raises the height of a marker from 'minHeight' to 'maxHeight' over 'duration'
Elevate = function(gameTime, startTime, duration, maxHeight, minHeight, marker)
  marker:SetPosZ(minHeight + ((maxHeight-minHeight) * ((startTime-gameTime) / duration)))
end,

Descend = function(gameTime, startTime, duration, maxHeight, minHeight, marker)
  
  marker:SetPosZ(maxHeight - ( (startTime-gameTime) * (minHeight-maxHeight) ) / duration )
  
  --marker:SetPosZ(maxHeight - ( ( maxHeight - minHeight ) * ( ( startTime - gameTime ) / duration ) ) )
end,

--Moves a marker from 'startVector' to 'endVector' over 'duration'
--Type: '1' is static height, '2' is 90 degree, '3' is 180 degree with peak
MoveMarker = function(startVector, endVector, duration, time, type, peak)
  local x = GetVelocity(startVector.X, endVector.X, duration, time)
  local y = GetVelocity(startVector.Y, endVector.Y, duration, time)
  local z = 0
  if(type == 1) then
    z = GetVelocity(startVector.Z, endVector.Z, duration, time)
  elseif(type == 2) then
    z = - ( ( ( startVector.Z - endVector.Z ) / ( duration ^ 2 ) ) * time ^ 2 ) + startVector.Z
  elseif(type == 3) then
    local t = 1 - math.min( time / duration, 1 )
    local h = math.sin( t * math.pi ) * ( peak - endVector.Z )
    z = endVector.Z + h
  end
  return I:Vector3(x, y, z)
end,

--Moves a marker from 'startVector' 180 degrees, clockwise
MoveCircle = function(startVector, centerVector, duration, time, mod)
  local radius = (startVector - centerVector):Length()
  local t = 1 - math.min( time / duration, 1 )
  local x = centerVector.X + ( math.sin( (t * math.pi) + mod) * radius )
  local y = centerVector.Y + ( math.cos( (t * math.pi) + mod) * radius )
  local z = startVector.Z
  return I:Vector3(x, y, z)
end,

MoveOrb = function(startVector, centerVector, duration, time, mod, direction)
  local r = (startVector - centerVector):Length()
  local t = ( ( time / duration ) * ( math.pi * 2 ) ) + mod
  local x, y, sine, cosine = 0, 0, math.sin(t)*r, math.cos(t)*r
  if(direction) then
    x = centerVector.X + cosine
    y = centerVector.Y + sine
  else
    x = centerVector.X + sine
    y = centerVector.Y + cosine
  end
  return I:Vector3(x, y, startVector.Z)
end



}

Utility.Math = {
  --Gets the velocity from 'start' to 'finish'.
  --Assumes start/finish to be Vector3 coordinate (vector.X for example)
  GetVelocity = function(time, duration, start, finish)
    return start - ((start - finish) / duration) * time
  end,
  
}

Utility.Animate = {
  --Increases the size of a marker from 'minSize' to 'maxSize' over 'duration' while 'time' is between 'start' and 'start + duration'
  SizeGrow = function(time, start, duration, minSize, maxSize, marker)
    if(time > start and time <= start + duration) then
      marker.Size = minSize + ((maxSize - minSize) * (time - start) / duration)
    end
  end,
  
  --Decreases the size of a marker from 'maxSize' to 'minSize' over 'duration' while 'time' is between 'start' and 'start + duration'
  SizeShrink = function(time, start, duration, minSize, maxSize, marker)
    if(time > start and time <= start + duration) then
      marker.Size = maxSize - ((maxSize - minSize) * (time - start) / duration)
    end
  end,
  
  --Fades in a marker from 0 to 'maxAlpha' over 'duration' while 'time' is between 'start' and 'start + duration'
  FadeIn = function(time, start, duration, maxAlpha, marker)
    if(time > start and time <= start + duration) then
      marker.Alpha = maxAlpha * ((time - start) / duration)
    end
  end,
  
  --Fades out a marker from 0 to 'maxAlpha' over 'duration' while 'time' is between 'start' and 'start + duration'
  FadeOut = function(time, start, duration, maxAlpha, marker)
    if(time > start and time <= start + duration) then
      marker.Alpha = maxAlpha * (1 - ((time - start) / duration))
    end
  end,
  
  --Raises the height of a marker from 'minHeight' to 'maxHeight' over 'duration' while 'time' is between 'start' and 'start + duration'
  Elevate = function(time, start, duration, minHeight, maxHeight, marker)
    if(time > start and time <= start + duration) then
      marker:SetPosZ(minHeight + ((maxHeight - minHeight) * ((time - start) / duration)))
    end
  end,
  
  --Lowers the height of a marker from 'minHeight' to 'maxHeight' over 'duration' while 'time' is between 'start' and 'start + duration'
  Descend = function(time, start, duration, minHeight, maxHeight, marker)
    if(time > start and time <= start + duration) then
      marker:SetPosZ(maxHeight - ((maxHeight - minHeight) * ((time - start) / duration)))
    end
  end,
  
  --Moves a marker from 'startVector' to 'endVector' over 'duration' while 'time' is between 'start' and 'start + duration'
  --Type '1' is straight line, '2' arcs marker 90 degrees, '3' arcs marker 180 degrees
  MoveStraight = function(time, start, duration, startVector, endVector, type, peak)
    if(time > start and time <= start + duration) then
      local currentTime = time - start
      --Getting velocity
      local x = Utility.Math.GetVelocity(currentTime, duration, startVector.X, endVector.X)
      local y = Utility.Math.GetVelocity(currentTime, duration, startVector.Y, endVector.Y)
      local z = 0
      --If type is '1', we move in a straight line
      if(type == 1) then
        z = Utility.Math.GetVelocity(currentTime, duration, startVector.Z, endVector.Z)
      --If type is '2', we arc the marker 90 degrees in a straight line
      elseif(type == 2) then
        z = -(((startVector.Z - endVector.Z) / (duration ^2)) * currentTime ^ 2) + startVector.Z
      --If type is '3', we arc the marker 180 degrees in a straight line
      elseif(type == 3) then
        local t = 1 - math.min(currentTime / duration, 1)
        local h = math.sin(t * math.pi) * (peak - endVector.Z)
        z = endVector.Z + h
      end
      return I:Vector3(x, y, z)
    end
  end,
  
  
  MoveCircle = function(time, start, duration, radius, startAngle, centerVector, direction)
    if(time > start and time <= start + duration) then
      local currentTime = time - start
      local angle = startAngle * math.pi / 180
      
      
      
      --local mod = math.atan2((startVector.Y - centerVector.Y), (startVector.X - centerVector.X)) - math.atan2((centerVector.Y - radius), (centerVector.X - radius))
      local t = ((currentTime / duration) * (math.pi * 2)) + angle
      local x, y, sine, cosine = 0, 0, math.sin(t)*radius, math.cos(t)*radius
      if(direction) then
        x = centerVector.X + cosine
        y = centerVector.Y + sine
      else
        x = centerVector.X + sine
        y = centerVector.Y + cosine
      end
      return I:Vector3(x, y, centerVector.Z)
    end
  end
}






