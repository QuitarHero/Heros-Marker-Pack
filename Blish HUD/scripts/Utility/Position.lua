HMPphysics.pos = {
  --Returns an abs Vector3
  randomXZ = function (vector, r)
    local d, rNumX, rNumY = 0, 0, 0
    repeat
      rNumX = math.random(vector.X - r, vector.X + r)
      rNumY = math.random(vector.Y - r, vector.Y + r)
      d = math.sqrt((rNumX - vector.X)^2 + (rNumY - vector.Y)^2)
    until (d <= r)
    return I:Vector3(rNumX, rNumY, vector.Z)
  end,
  
  randomXYedge = function(vector, r)
    local rNumX, rNumY, angle = 0, 0, 0
    angle = math.random(0, 360)
    rNumX = r * math.cos(angle)
    rNumY = r * math.sin(angle)
    return I:Vector3((vector.X + rNumX), (vector.Y + rNumY), vector.Z)
  end,
  
  FixedRotate = {
    --Camera is a 'boolean'; true for PlayerCamera, false for PlayerCharacter
    X = function(marker, camera)
      local mumble = nil
      if(camera) then mumble = Mumble.PlayerCamera.Forward else mumble = Mumble.PlayerCharacter.Forward end
      marker:SetRotX(math.atan2(mumble.Y, mumble.X) - (math.pi/2))
    end,
    --Camera is a 'boolean'; true for PlayerCamera, false for PlayerCharacter
    Z = function(marker, camera)
      local mumble = nil
      if(camera) then mumble = Mumble.PlayerCamera.Forward else mumble = Mumble.PlayerCharacter.Forward end
      marker:SetRotZ(math.atan2(mumble.Y, mumble.X) - (math.pi/2))
    end
  },
}