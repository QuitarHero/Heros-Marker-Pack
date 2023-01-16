function getDaily2UtcTimeRemainder(interval)
  local delay = 64
  local addTime = 27000 --7.5 hours
  
  local Year, Month, Day, Hour, Min, Sec = tonumber(os.date("!%Y")), tonumber(os.date("!%m")), tonumber(os.date("!%d")), tonumber(os.date("!%H")), tonumber(os.date("!%M")), tonumber(os.date("!%S"))
  local utcTime   = os.time{year=Year, month=Month, day=Day, hour=Hour, min=Min, sec=Sec}
  local totalDays = math.floor((utcTime - addTime + delay) / 86400)
  local remainder = math.fmod(totalDays, interval)
  return remainder
end

local function tick_weeklyW6Event(gameTime)
  --Time Variable
  local remain = getDaily2UtcTimeRemainder(14)
  
  
  Debug:Watch("GameTime in MS", gameTime.TotalGameTime.TotalMilliseconds)
  
  
  --If the current map the player is in is Lion's Arch Aerodome
  if(currentMap == 1155 and World:CategoryByType("HMP.raidT.c99.sc1"):IsVisible()) then
    --Get the Text Marker by Mythwright Gambit's Entrance
    HMP.weeklyW6Event = {
      text = World:MarkerByGuid("DpbZ61s3rECdYVslcrYx4Q==")
    }
    --Decide what shows based on week
    if(remain > 3 and remain < 11) then
      HMP.weeklyW6Event.text:SetTexture("Data/MegaSingle.png")
    else
      HMP.weeklyW6Event.text:SetTexture("Data/EctosSingle.png")
    end
  end
  
  --If the current map the player is in is Mythwright Gambit
  if(currentMap == 1303 and World:CategoryByType("HMP.raidT.c99.sc1"):IsVisible()) then
    HMP.weeklyW6Event = {
      --Megapet Markers
      megaText1  = World:MarkerByGuid("HKnlvaGii0qeDwWPQvqLgQ=="),
      megaText2  = World:MarkerByGuid("9B6j0wFla0yd8xecg3o0rQ=="),
      megaArrow1 = World:MarkerByGuid("YmzZVOWjBkewMs9gN58S7Q=="),
      megaArrow2 = World:MarkerByGuid("CNdxwIXkMk6OPNty6hgMyA=="),
      megaArrow3 = World:MarkerByGuid("3ldQ/QN9Nke/CSqSFy7Llg=="),
      --Ectoplasm Markers
      ectoText1  = World:MarkerByGuid("kj8/tdwUJEm4i4i3tIdw9Q=="),
      ectoText2  = World:MarkerByGuid("QS4CkmE8+0aefDX6VV7DbQ=="),
      ectoArrow1 = World:MarkerByGuid("va7kuZUX6USeuCZlMMctEg=="),
      ectoArrow2 = World:MarkerByGuid("iKlfIu6Zy0CqfQbl9m86Ew=="),
      ectoArrow3 = World:MarkerByGuid("P74oTRMlAEuJ+wHzd2JGEQ==")
    }
    --Decide what shows based on week
    if(remain > 3 and remain < 11) then
      HMP.weeklyW6Event.megaText1:SetTexture("Data/MegaSingle.png")
      HMP.weeklyW6Event.megaText2:SetTexture("Data/MegaSingle.png")
      HMP.weeklyW6Event.megaArrow1:SetTexture("Data/991944-G.png")
      HMP.weeklyW6Event.megaArrow2:SetTexture("Data/991944-G.png")
      HMP.weeklyW6Event.megaArrow3:SetTexture("Data/991944-G.png")
    else
      HMP.weeklyW6Event.ectoText1:SetTexture("Data/EctosSingle.png")
      HMP.weeklyW6Event.ectoText2:SetTexture("Data/EctosSingle.png")
      HMP.weeklyW6Event.ectoArrow1:SetTexture("Data/991944-G.png")
      HMP.weeklyW6Event.ectoArrow2:SetTexture("Data/991944-G.png")
      HMP.weeklyW6Event.ectoArrow3:SetTexture("Data/991944-G.png")
    end
  end
end

Event:OnTick(tick_weeklyW6Event)