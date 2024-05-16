--Dependencies
Pack:Require("scripts/Utility/Time")

HMP.dailyCycle = {
  incompleteDaily  = World:MarkerByGuid("x1TeXAbSVE29HYpZjXraSQ=="),
  completeDaily    = World:MarkerByGuid("sE9Ta/4ooE2FtbpZZ7OqOA=="),
  upcomingDaily    = World:MarkerByGuid("zdVrClzRj0ew1nQ2kN+mRQ=="),
  ---
  titleDaily       = World:MarkerByGuid("b+kZ9capskqc0slwxLmNgg=="),
  titleReset       = World:MarkerByGuid("nP+PHzi8oUuLA5WVPPLP3A=="),
  incompleteBorder = World:MarkerByGuid("6E6V6N43DUOsptOjhhN8/A=="),
  completeBorder   = World:MarkerByGuid("uxIFdvv5MkaaDSb3o8YI5A=="),
  resetBorder      = World:MarkerByGuid("Zp3extUiQU+zegckLN5Nfg==")
}
HMP.dailyIbsMarkers = {
  B1_1 = World:MarkerByGuid("eOtgj4GupUGQFWpo4JW0UA=="),
  B2_1 = World:MarkerByGuid("iAeMyUxzwE2xGX4aPYbSlA=="),
  B2_2 = World:MarkerByGuid("MQmFdJdj90CWYnTzAk8adw=="),
  B2_3 = World:MarkerByGuid("6/MTnswzukuU95kOS38YfQ=="),
  B3_1 = World:MarkerByGuid("aC6MlFoULU2kDYF+MFS9uA=="),
  B3_2 = World:MarkerByGuid("MsXOpcvdj0CcTrnyHCLd3A=="),
  B3_3 = World:MarkerByGuid("nj/GrjOzYkiBJ/S7QJZ+OQ=="),
  B4_1 = World:MarkerByGuid("bzP3/5u1ZUinUlmQWnamZg=="),
  B4_2 = World:MarkerByGuid("hn4YeO4oLUaVXrvYmREeuw=="),
  B4_3 = World:MarkerByGuid("W69qM4nFe0q/uuoOJ/iuhQ=="),
  B5_1 = World:MarkerByGuid("ydXPxj58dUekQ4vdrs8wRA=="),
  B5_2 = World:MarkerByGuid("PBdjlGJq00OdP6tc44l2YQ=="),
  B5_3 = World:MarkerByGuid("rJIUUe4/Z0a6QUcDjxIy1A=="),
  B6_1 = World:MarkerByGuid("NGZx8ebqxkuDjn1KTqkzGQ==")
}

local cycle, markers = HMP.dailyCycle, HMP.dailyIbsMarkers

function SetIBSDaily()
  local remain, currentMap = HMPtime.GetUtcTime(6), Mumble.CurrentMap.Id
  --Easy access to time markers
  local noDaily, yesDaily, nextDaily = cycle.incompleteDaily, cycle.completeDaily, cycle.upcomingDaily
  if(currentMap == 1370) then
    cycle.titleDaily:SetTexture("Assets/Strikes/Track/daily-title.png")
    cycle.titleReset:SetTexture("Assets/Strikes/Track/reset-title.png")
    cycle.incompleteBorder:SetTexture("Assets/General/dot-border.png")
    cycle.completeBorder:SetTexture("Assets/General/dot-border.png")
    cycle.resetBorder:SetTexture("Assets/General/dot-border.png")
  end
  --Boneskinner Daily
  if(remain == 0) then
    noDaily:SetTexture("Assets/Strikes/Track/B4g.png")
    yesDaily:SetTexture("Assets/Strikes/Track/B4c.png")
    nextDaily:SetTexture("Assets/Strikes/Track/B6c.png")
  end
  --Cold War Daily
  if(remain == 1) then
    noDaily:SetTexture("Assets/Strikes/Track/B6g.png")
    yesDaily:SetTexture("Assets/Strikes/Track/B6c.png")
    nextDaily:SetTexture("Assets/Strikes/Track/B3c.png")
  end
  --Fraenir of Jormag Daily
  if(remain == 2) then
    noDaily:SetTexture("Assets/Strikes/Track/B3g.png")
    yesDaily:SetTexture("Assets/Strikes/Track/B3c.png")
    nextDaily:SetTexture("Assets/Strikes/Track/B1c.png")
  end
  --Icebrood Construct Daily
  if(remain == 3) then
    noDaily:SetTexture("Assets/Strikes/Track/B1g.png")
    yesDaily:SetTexture("Assets/Strikes/Track/B1c.png")
    nextDaily:SetTexture("Assets/Strikes/Track/B2c.png")
  end
  --Kodan Brothers Daily
  if(remain == 4) then
    noDaily:SetTexture("Assets/Strikes/Track/B2g.png")
    yesDaily:SetTexture("Assets/Strikes/Track/B2c.png")
    nextDaily:SetTexture("Assets/Strikes/Track/B5c.png")
  end
  --Whisper of Jormag Daily
  if(remain == 5) then
    noDaily:SetTexture("Assets/Strikes/Track/B5g.png")
    yesDaily:SetTexture("Assets/Strikes/Track/B5c.png")
    nextDaily:SetTexture("Assets/Strikes/Track/B4c.png")
  end
end

local function tick_ibsStrikeSch(gameTime)
  --Time Variables
  local remain, currentMap = HMPtime.GetUtcTime(6), Mumble.CurrentMap.Id
  
  --Boneskinner Daily
  if(remain == 0 and currentMap == 1339) then
    markers.B4_1.InGameVisibility = true
    markers.B4_1.TriggerRange     = 3.7
    markers.B4_2.InGameVisibility = true
    markers.B4_2.TriggerRange     = 4.9
    markers.B4_3.InGameVisibility = true
    markers.B4_3.TriggerRange     = 4.75
  end
  --Cold War Daily
  if(remain == 1 and currentMap == 1374) then
    markers.B6_1.InGameVisibility = true
    markers.B6_1.TriggerRange     = 6.35
  end
  --Fraenir of Jormag Daily
  if(remain == 2 and currentMap == 1341) then
    markers.B3_1.InGameVisibility = true
    markers.B3_1.TriggerRange     = 3.7
    markers.B3_2.InGameVisibility = true
    markers.B3_2.TriggerRange     = 4.9
    markers.B3_3.InGameVisibility = true
    markers.B3_3.TriggerRange     = 4.75
  end
  --Icebrood Construct Daily
  if(remain == 3 and currentMap == 1332) then
    markers.B1_1.InGameVisibility = true
    markers.B1_1.TriggerRange     = 25
  end
  --Kodan Brothers Daily
  if(remain == 4 and currentMap == 1346) then
    markers.B2_1.InGameVisibility = true
    markers.B2_1.TriggerRange     = 3.7
    markers.B2_2.InGameVisibility = true
    markers.B2_2.TriggerRange     = 4.9
    markers.B2_3.InGameVisibility = true
    markers.B2_3.TriggerRange     = 4.75
  end
  --Whisper of Jormag Daily
  if(remain == 5 and currentMap == 1359) then
    markers.B5_1.InGameVisibility = true
    markers.B5_1.TriggerRange     = 3.7
    markers.B5_2.InGameVisibility = true
    markers.B5_2.TriggerRange     = 4.9
    markers.B5_3.InGameVisibility = true
    markers.B5_3.TriggerRange     = 4.75
  end
end

Event:OnTick(tick_ibsStrikeSch)