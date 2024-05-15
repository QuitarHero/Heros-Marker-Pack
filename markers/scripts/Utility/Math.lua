HMPutility.math = {
  --Gets the Lune1 sectioned 'area' of 2 overlapping circles
  Lune1 = function(r1, r2, d)
    local P1 = 0.5 * math.sqrt( (r1+r2+d) * (r2+d-r1) * (d+r1-r2) * (r1+r2-d) )
    local P2 = P1 + r1^2 * math.acos( (r2^2-r1^2-d^2) / (2*r1*d) )
    local P3 = P2 - r2^2 * math.acos( (r2^2+d^2-r1^2) / (2*r2*d) )
    return P3
  end,
  --Gets the Overlap Area of 2 overlapping circles
  OverlapArea = function(r1, r2, d)
    local Lune1 = HMPutility.math.Lune1(r1, r2, d)
    local OverlapArea = math.pi * r1^2 - Lune1
    return OverlapArea
  end,
  --Gets the Lune2 sectioned 'area' of 2 overlapping circles
  Lune2 = function(r1, r2, d)
    local OverlapArea = HMPutility.math.OverlapArea(r1, r2, d)
    local Lune2 = math.pi * r2^2 - OverlapArea
    return Lune2
  end
}