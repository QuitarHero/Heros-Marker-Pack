HMP.dailyCycle = {
  incompleteDaily = World:MarkerByGuid("SBNx62U+Wk+R/HzTuahvRg=="),
  completeDaily   = World:MarkerByGuid("St08I1dXk0uOpOmNAsPDwg=="),
  upcomingDaily   = World:MarkerByGuid("sV2IORDNeEWW4HXb3PY5bw=="),
  textOfDaily     = World:MarkerByGuid("WAiviQ9nnE+Qi1+vLXem4Q=="),
  textOfNextDaily = World:MarkerByGuid("MJ79TNqau0G8rrfFvnW+jg=="),
  textOfDailyTime = World:MarkerByGuid("3GUG2QUyskm9MXz366R18g=="),
  textOfResetTime = World:MarkerByGuid("UA8kgqnmaUqvV7jdeKmdmQ=="),
  ---
  titleDaily       = World:MarkerByGuid("r4PNILi5GkGaY6vsPUbBeg=="),
  titleReset       = World:MarkerByGuid("s4N9z1PQQUu+BqXsONAm8g=="),
  incompleteBorder = World:MarkerByGuid("qYsyfNVwuUGMG/zcKMEkPg=="),
  completeBorder   = World:MarkerByGuid("vO6PxN4zfU2WsWXrz3BGuw=="),
  resetBorder      = World:MarkerByGuid("Jg/58iiYuEOh+8kIiDGz8A=="),
  curTime = 0,
}
HMP.dailyEodMarkers = {
  B7_1  = World:MarkerByGuid("1PmCxJRILU+yl+W1q/3CZQ=="),
  B7_2  = World:MarkerByGuid("izkIPFHs1EaLjdryA6UkUw=="),
  B7_3  = World:MarkerByGuid("26StaSazpU62MjG6E36Bjg=="),
  B8_1  = World:MarkerByGuid("B/nAAmq6e0CjnhklDGKULQ=="),
  B8_2  = World:MarkerByGuid("dfZCy6Ijv0m9/RXxKOhjSQ=="),
  B8_3  = World:MarkerByGuid("+F/P0X7h9EaJ3muNBmUqSw=="),
  B9_1  = World:MarkerByGuid("LcaQS9gJzE2ZglZoJCmaBQ=="),
  B9_2  = World:MarkerByGuid("vGrXHfva6kqJVh4/gOskFw=="),
  B9_3  = World:MarkerByGuid("Z8yMRvRmAUWR27fDfVTCGg=="),
  B10_1 = World:MarkerByGuid("snQTyBzM80K4qQOuqn3vHw=="),
  B10_2 = World:MarkerByGuid("F8aXXCKYPE6LtBGZChX0Mg=="),
  B10_3 = World:MarkerByGuid("mGZjMOjlkUS8OZNn8qvScQ=="),
  B11_1 = World:MarkerByGuid("ot6D59Lht0qfEVWWHjgz0w=="),
  B11_2 = World:MarkerByGuid("3KDgFNk7WUCTwj8XSc8e/g=="),
  B11_3 = World:MarkerByGuid("t7PJnF8FO0GNxmIK5BO09Q==")
}
HMP.EodMiscMarkers = {
  weeklyTitle = World:MarkerByGuid("fP+Ru6kS8E+xlLqR810Tjg==")
}

local cycle, markers, misc = HMP.dailyCycle, HMP.dailyEodMarkers, HMP.EodMiscMarkers

--Removes the Weekly Clear text if the feature is turned off
function removeEoDWeeklyTitle(marker)
  if(World:CategoryByType("HMP.strikeT.c8"):IsVisible() or World:CategoryByType("HMP.strikeT.c9"):IsVisible()) then
    marker.InGameVisibility = true
  else
    marker.InGameVisibility = false
  end
end

--Moves the Daily markers down when the Weekly Tracking Feature is turned off
function moveDailyMarkers()
  --Incomplete Daily
  cycle.incompleteDaily:SetPosZ(-1.450)
  cycle.incompleteBorder:SetPosZ(-1.450)
  --Complete Daily
  cycle.completeDaily:SetPosZ(-1.450)
  cycle.completeBorder:SetPosZ(-1.450)
  --Both Daily
  cycle.textOfDaily:SetPosZ(12.55)
  cycle.textOfDailyTime:SetPosZ(11.45)
  cycle.titleDaily:SetPosZ(13.8)
  --Reset Daily
  cycle.textOfNextDaily:SetPosZ(12.55)
  cycle.upcomingDaily:SetPosZ(-1.450)
  cycle.textOfResetTime:SetPosZ(11.45)
  cycle.resetBorder:SetPosZ(-1.450)
  cycle.titleReset:SetPosZ(13.8)
end

--Moves the Daily markers back up when the Weekly Tracking Feature is turned back on
function returnDailyMarkers()
  --Incomplete Daily
  cycle.incompleteDaily:SetPosZ(2.450)
  cycle.incompleteBorder:SetPosZ(2.450)
  --Complete Daily
  cycle.completeDaily:SetPosZ(2.450)
  cycle.completeBorder:SetPosZ(2.450)
  --Both Daily
  cycle.textOfDaily:SetPosZ(16.45)
  cycle.textOfDailyTime:SetPosZ(15.35)
  cycle.titleDaily:SetPosZ(17.7)
  --Reset Daily
  cycle.textOfNextDaily:SetPosZ(16.45)
  cycle.upcomingDaily:SetPosZ(2.450)
  cycle.textOfResetTime:SetPosZ(15.35)
  cycle.resetBorder:SetPosZ(2.450)
  cycle.titleReset:SetPosZ(17.7)
end

function SetEOD_StrikeTextures()
  local remain, currentMap = HMPtime.GetUtcTime(5), Mumble.CurrentMap.Id
  --Easy access to time markers
  local noDaily, yesDaily, nextDaily = cycle.incompleteDaily, cycle.completeDaily, cycle.upcomingDaily
  local curText, nextText, dailyTimeText, resetTimeText = cycle.textOfDaily, cycle.textOfNextDaily, cycle.textOfDailyTime, cycle.textOfResetTime
  
  --Giving textures to daily-specific Arborstone markers so the feature is a full on/off if scripts are enabled or disabled
  if(currentMap == 1428) then
    cycle.titleDaily:SetTexture("Assets/Strikes/Track/daily-title.png")
    cycle.titleReset:SetTexture("Assets/Strikes/Track/reset-title.png")
    cycle.incompleteBorder:SetTexture("Assets/General/dot-border.png")
    cycle.completeBorder:SetTexture("Assets/General/dot-border.png")
    cycle.resetBorder:SetTexture("Assets/General/dot-border.png")
  end
  
  --Kaineng Overlook Daily
  if(remain == 5) then
    noDaily:SetTexture("Assets/Strikes/Track/B9g.png")
    yesDaily:SetTexture("Assets/Strikes/Track/B9c.png")
    curText:SetTexture("Assets/Strikes/Track/B9-text.png")
    dailyTimeText:SetTexture("Assets/Strikes/Track/always-night.png")
    nextDaily:SetTexture("Assets/Strikes/Track/B10c.png")
    nextText:SetTexture("Assets/Strikes/Track/B10-text.png")
    resetTimeText:SetTexture("Assets/Strikes/Track/always-night.png")
  end
  --Harvest Temple Daily
  if(remain == 1) then
    noDaily:SetTexture("Assets/Strikes/Track/B10g.png")
    yesDaily:SetTexture("Assets/Strikes/Track/B10c.png")
    curText:SetTexture("Assets/Strikes/Track/B10-text.png")
    dailyTimeText:SetTexture("Assets/Strikes/Track/always-night.png")
    nextDaily:SetTexture("Assets/Strikes/Track/B11c.png")
    nextText:SetTexture("Assets/Strikes/Track/B11-text.png")
    resetTimeText:SetTexture("Assets/Strikes/Track/tyrian-night.png")
  end
  --Old Lion's Court Daily
  if(remain == 2) then
    noDaily:SetTexture("Assets/Strikes/Track/B11g.png")
    yesDaily:SetTexture("Assets/Strikes/Track/B11c.png")
    curText:SetTexture("Assets/Strikes/Track/B11-text.png")
    dailyTimeText:SetTexture("Assets/Strikes/Track/tyrian-night.png")
    nextDaily:SetTexture("Assets/Strikes/Track/B7c.png")
    nextText:SetTexture("Assets/Strikes/Track/B7-text.png")
    resetTimeText:SetTexture("Assets/Strikes/Track/always-day.png")
  end
  --Aetherblade Hideout Daily
  if(remain == 3) then
    noDaily:SetTexture("Assets/Strikes/Track/B7g.png")
    yesDaily:SetTexture("Assets/Strikes/Track/B7c.png")
    curText:SetTexture("Assets/Strikes/Track/B7-text.png")
    dailyTimeText:SetTexture("Assets/Strikes/Track/always-day.png")
    nextDaily:SetTexture("Assets/Strikes/Track/B8c.png")
    nextText:SetTexture("Assets/Strikes/Track/B8-text.png")
    resetTimeText:SetTexture("Assets/Strikes/Track/canthan-night.png")
  end
  --Xunlai Jade Junkyard Daily
  if(remain == 4) then
    noDaily:SetTexture("Assets/Strikes/Track/B8g.png")
    yesDaily:SetTexture("Assets/Strikes/Track/B8c.png")
    curText:SetTexture("Assets/Strikes/Track/B8-text.png")
    dailyTimeText:SetTexture("Assets/Strikes/Track/canthan-night.png")
    nextDaily:SetTexture("Assets/Strikes/Track/B9c.png")
    nextText:SetTexture("Assets/Strikes/Track/B9-text.png")
    resetTimeText:SetTexture("Assets/Strikes/Track/always-night.png")
  end
end

local function tick_eodStrikeSch(gameTime)
  local remain, currentMap = HMPtime.GetUtcTime(5), Mumble.CurrentMap.Id
  
  --Kaineng Overlook Daily
  if(remain == 5 and currentMap == 1451) then
    markers.B9_1.InGameVisibility = true
    markers.B9_2.InGameVisibility = true
    markers.B9_3.InGameVisibility = true
    markers.B9_3.TriggerRange     = 3
  end
  --Harvest Temple Daily
  if(remain == 1 and currentMap == 1437) then
    markers.B10_1.InGameVisibility = true
    markers.B10_2.InGameVisibility = true
    markers.B10_3.InGameVisibility = true
    markers.B10_3.TriggerRange     = 4
  end
  --Old Lion's Court Daily
  if(remain == 2 and currentMap == 1485) then
    markers.B11_1.InGameVisibility = true
    markers.B11_2.InGameVisibility = true
    markers.B11_3.InGameVisibility = true
    markers.B11_3.TriggerRange     = 4
  end
  --Aetherblade Hideout Daily
  if(remain == 3 and currentMap == 1432) then
    markers.B7_1.InGameVisibility = true
    markers.B7_2.InGameVisibility = true
    markers.B7_3.InGameVisibility = true
    markers.B7_3.TriggerRange     = 3
  end
  --Xunlai Jade Junkyard Daily
  if(remain == 4 and currentMap == 1450) then
    markers.B8_1.InGameVisibility = true
    markers.B8_2.InGameVisibility = true
    markers.B8_3.InGameVisibility = true
    markers.B8_3.TriggerRange     = 4
  end
  
  if(currentMap == 1428 and World:CategoryByType("HMP.strikeT.c8"):IsVisible() == false and World:CategoryByType("HMP.strikeT.c9"):IsVisible() == false) then
    moveDailyMarkers()
  elseif(currentMap == 1428) then
    returnDailyMarkers()
  end
end

Event:OnTick(tick_eodStrikeSch)