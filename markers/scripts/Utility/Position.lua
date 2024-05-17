Utility.Position = {
  --Returns an abs Vector3
  randomXZ = function (vector, r)
    local d, rNumX, rNumY = 0, 0, 0
    repeat
      rNumX = math.random(vector.X - r, vector.X + r) --+ math.random(1, 998)
      rNumY = math.random(vector.Y - r, vector.Y + r) --+ math.random(1, 998)
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
}