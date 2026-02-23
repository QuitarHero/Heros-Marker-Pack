HMP.StrB10_HitboxRanges = {
  --Mines / Traps / Marks
  { {false, false}, {"pwy1EhjUZE+AspfyuMG8rw==", "R6Qp1ZPj6Eq64trrAobSYA==", "rkutxEcMXEeoDK3QmCw/aw=="} },
  { {false, false}, {"ncYLuIE5E0KLYhbHyUuodw==", "HpfKnTZ7CkK1oO+Jiz8Cdg==", "X6GiFGgLDkq4cnsqG2ur5Q=="} },
  { {false, false}, {"nZMOvufdGU+xS3Pyz6aL3w==", "3sivNbIgN0iJ1j9AZyCQ7w==", "mn73out29Ue39XZn/Z2EDw=="} }
}

local HitboxRanges = HMP.StrB10_HitboxRanges

local function UpdateCategoryStates(category, hitbox, catState)
  HitboxRanges[category][1][hitbox] = catState
  if( HitboxRanges[category][1][1] and HitboxRanges[category][1][2] ) then
    for _,v in ipairs(HitboxRanges[category][2]) do
      if( _ < 3 ) then
        World:TrailByGuid(v).InGameVisibility = false
      else
        World:TrailByGuid(v).InGameVisibility = true
      end
    end
  else
    --This goes backwards in an attempt for a more controlled and pleasing visibility swap.
    for i = 3, 1, -1 do
      if( i < 3 ) then
        World:TrailByGuid(HitboxRanges[category][2][i]).InGameVisibility = true
      else
        World:TrailByGuid(HitboxRanges[category][2][i]).InGameVisibility = false
      end
    end
  end
end

local function Tick_HitboxRanges(gameTime)
  for i = 1, 3 do
    for j = 1, 2 do
      local catState = World:CategoryByType("HMP.strikeB10_c1.sc5.asc" .. i .. ".yasc" .. j):IsVisible()
      if( catState ~= HitboxRanges[i][1][j] ) then
        UpdateCategoryStates(i, j, catState)
      end
    end
  end
end

Event:OnTick(Tick_HitboxRanges)