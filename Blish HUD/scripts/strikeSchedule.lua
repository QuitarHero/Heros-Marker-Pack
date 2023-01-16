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
  resetBorder      = World:MarkerByGuid("Jg/58iiYuEOh+8kIiDGz8A==")
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

local currentMap = Mumble.CurrentMap.Id

function removeEoDWeeklyTitle(marker)
  if(World:CategoryByType("HMP.strikeT.c8"):IsVisible() or World:CategoryByType("HMP.strikeT.c9"):IsVisible()) then
    marker.InGameVisibility = true
  else
    marker.InGameVisibility = false
  end
end

function getDaily1UtcTimeRemainder(interval)
  local delay = 63
  local Year, Month, Day, Hour, Min, Sec = tonumber(os.date("!%Y")), tonumber(os.date("!%m")), tonumber(os.date("!%d")), tonumber(os.date("!%H")), tonumber(os.date("!%M")), tonumber(os.date("!%S"))
  local utcTime    = os.time{year=Year, month=Month, day=Day, hour=Hour, min=Min, sec=Sec}
  local currentDay = math.floor((utcTime - delay) / 86400)
  local remainder  = math.fmod(currentDay, interval)
  return remainder
end

function moveDailyMarkers()
  --Incomplete Daily
  HMP.dailyCycle.incompleteDaily:SetPosZ(-1.450)
  HMP.dailyCycle.incompleteBorder:SetPosZ(-1.450)
  --Complete Daily
  HMP.dailyCycle.completeDaily:SetPosZ(-1.450)
  HMP.dailyCycle.completeBorder:SetPosZ(-1.450)
  --Both Daily
  HMP.dailyCycle.textOfDaily:SetPosZ(12.55)
  HMP.dailyCycle.textOfDailyTime:SetPosZ(11.45)
  HMP.dailyCycle.titleDaily:SetPosZ(13.8)
  --Reset Daily
  HMP.dailyCycle.textOfNextDaily:SetPosZ(12.55)
  HMP.dailyCycle.upcomingDaily:SetPosZ(-1.450)
  HMP.dailyCycle.textOfResetTime:SetPosZ(11.45)
  HMP.dailyCycle.resetBorder:SetPosZ(-1.450)
  HMP.dailyCycle.titleReset:SetPosZ(13.8)
end

function returnDailyMarkers()
  --Incomplete Daily
  HMP.dailyCycle.incompleteDaily:SetPosZ(2.450)
  HMP.dailyCycle.incompleteBorder:SetPosZ(2.450)
  --Complete Daily
  HMP.dailyCycle.completeDaily:SetPosZ(2.450)
  HMP.dailyCycle.completeBorder:SetPosZ(2.450)
  --Both Daily
  HMP.dailyCycle.textOfDaily:SetPosZ(16.45)
  HMP.dailyCycle.textOfDailyTime:SetPosZ(15.35)
  HMP.dailyCycle.titleDaily:SetPosZ(17.7)
  --Reset Daily
  HMP.dailyCycle.textOfNextDaily:SetPosZ(16.45)
  HMP.dailyCycle.upcomingDaily:SetPosZ(2.450)
  HMP.dailyCycle.textOfResetTime:SetPosZ(15.35)
  HMP.dailyCycle.resetBorder:SetPosZ(2.450)
  HMP.dailyCycle.titleReset:SetPosZ(17.7)
end

local function tick_strikeSch(gameTime)
  --Time Variables
  local remain = getDaily1UtcTimeRemainder(5)
  --Easy access to time markers
  local noDaily, yesDaily, nextDaily = HMP.dailyCycle.incompleteDaily, HMP.dailyCycle.completeDaily, HMP.dailyCycle.upcomingDaily
  local curText, nextText, dailyTimeText, resetTimeText = HMP.dailyCycle.textOfDaily, HMP.dailyCycle.textOfNextDaily, HMP.dailyCycle.textOfDailyTime, HMP.dailyCycle.textOfResetTime
  
  --Kaineng Overlook Daily
  if(remain == 0) then
    if(currentMap == 1428) then
      noDaily:SetTexture("Schedule/B9g.png")
      yesDaily:SetTexture("Schedule/B9c.png")
      curText:SetTexture("Schedule/B9-text.png")
      dailyTimeText:SetTexture("Schedule/always-night.png")
      nextDaily:SetTexture("Schedule/B10c.png")
      nextText:SetTexture("Schedule/B10-text.png")
      resetTimeText:SetTexture("Schedule/always-night.png")
    elseif(currentMap == 1451) then
      HMP.dailyEodMarkers.B9_1.InGameVisibility = true
      HMP.dailyEodMarkers.B9_2.InGameVisibility = true
      HMP.dailyEodMarkers.B9_3.InGameVisibility = true
      HMP.dailyEodMarkers.B9_3.TriggerRange     = 3
    end
  end
  --Harvest Temple Daily
  if(remain == 1) then
    if(currentMap == 1428) then
      noDaily:SetTexture("Schedule/B10g.png")
      yesDaily:SetTexture("Schedule/B10c.png")
      curText:SetTexture("Schedule/B10-text.png")
      dailyTimeText:SetTexture("Schedule/always-night.png")
      nextDaily:SetTexture("Schedule/B11c.png")
      nextText:SetTexture("Schedule/B11-text.png")
      resetTimeText:SetTexture("Schedule/tyrian-night.png")
    elseif(currentMap == 1437) then
      HMP.dailyEodMarkers.B10_1.InGameVisibility = true
      HMP.dailyEodMarkers.B10_2.InGameVisibility = true
      HMP.dailyEodMarkers.B10_3.InGameVisibility = true
      HMP.dailyEodMarkers.B10_3.TriggerRange     = 4
    end
  end
  --Old Lion's Court Daily
  if(remain == 2) then
    if(currentMap == 1428) then
      noDaily:SetTexture("Schedule/B11g.png")
      yesDaily:SetTexture("Schedule/B11c.png")
      curText:SetTexture("Schedule/B11-text.png")
      dailyTimeText:SetTexture("Schedule/tyrian-night.png")
      nextDaily:SetTexture("Schedule/B7c.png")
      nextText:SetTexture("Schedule/B7-text.png")
      resetTimeText:SetTexture("Schedule/always-day.png")
    elseif(currentMap == 1485) then
      HMP.dailyEodMarkers.B11_1.InGameVisibility = true
      HMP.dailyEodMarkers.B11_2.InGameVisibility = true
      HMP.dailyEodMarkers.B11_3.InGameVisibility = true
      HMP.dailyEodMarkers.B11_3.TriggerRange     = 4
    end
  end
  --Aetherblade Hideout Daily
  if(remain == 3) then
    if(currentMap == 1428) then
      noDaily:SetTexture("Schedule/B7g.png")
      yesDaily:SetTexture("Schedule/B7c.png")
      curText:SetTexture("Schedule/B7-text.png")
      dailyTimeText:SetTexture("Schedule/always-day.png")
      nextDaily:SetTexture("Schedule/B8c.png")
      nextText:SetTexture("Schedule/B8-text.png")
      resetTimeText:SetTexture("Schedule/canthan-night.png")
    elseif(currentMap == 1432) then
      HMP.dailyEodMarkers.B7_1.InGameVisibility = true
      HMP.dailyEodMarkers.B7_2.InGameVisibility = true
      HMP.dailyEodMarkers.B7_3.InGameVisibility = true
      HMP.dailyEodMarkers.B7_3.TriggerRange     = 3
    end
  end
  --Xunlai Jade Junkyard Daily
  if(remain == 4) then
    if(currentMap == 1428) then
      noDaily:SetTexture("Schedule/B8g.png")
      yesDaily:SetTexture("Schedule/B8c.png")
      curText:SetTexture("Schedule/B8-text.png")
      dailyTimeText:SetTexture("Schedule/canthan-night.png")
      nextDaily:SetTexture("Schedule/B9c.png")
      nextText:SetTexture("Schedule/B9-text.png")
      resetTimeText:SetTexture("Schedule/always-night.png")
    elseif(currentMap == 1450) then
      HMP.dailyEodMarkers.B8_1.InGameVisibility = true
      HMP.dailyEodMarkers.B8_2.InGameVisibility = true
      HMP.dailyEodMarkers.B8_3.InGameVisibility = true
      HMP.dailyEodMarkers.B8_3.TriggerRange     = 4
    end
  end
  
  if(World:CategoryByType("HMP.strikeT.c8"):IsVisible() == false and World:CategoryByType("HMP.strikeT.c9"):IsVisible() == false) then
    moveDailyMarkers()
  else
    returnDailyMarkers()
  end
end

Event:OnTick(tick_strikeSch)