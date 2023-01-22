local function tick_weeklyW6Event(gameTime)
  --Time Variable
  local remain = HMP.publicFunctions.getUtcTime(14, 27000)
  
  --If the current map the player is in is Lion's Arch Aerodome
  if(currentMap == 1155 and World:CategoryByType("HMP.raidT.c99.sc1"):IsVisible()) then
    --Get the Text Marker by Mythwright Gambit's Entrance
    HMP.weeklyW6Event = {
      text = World:MarkerByGuid("DpbZ61s3rECdYVslcrYx4Q==")
    }
    --Decide what shows based on week
    if(remain > 3 and remain < 11) then
      HMP.weeklyW6Event.text:SetTexture("Data/Raids/w6-megapets.png")
    else
      HMP.weeklyW6Event.text:SetTexture("Data/Raids/w6-ectoplasms.png")
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
      HMP.weeklyW6Event.megaText1:SetTexture("Data/Raids/w6-megapets.png")
      HMP.weeklyW6Event.megaText2:SetTexture("Data/Raids/w6-megapets.png")
      HMP.weeklyW6Event.megaArrow1:SetTexture("Data/General/ArrowG.png")
      HMP.weeklyW6Event.megaArrow2:SetTexture("Data/General/ArrowG.png")
      HMP.weeklyW6Event.megaArrow3:SetTexture("Data/General/ArrowG.png")
    else
      HMP.weeklyW6Event.ectoText1:SetTexture("Data/Raids/w6-ectoplasms.png")
      HMP.weeklyW6Event.ectoText2:SetTexture("Data/Raids/w6-ectoplasms.png")
      HMP.weeklyW6Event.ectoArrow1:SetTexture("Data/General/ArrowG.png")
      HMP.weeklyW6Event.ectoArrow2:SetTexture("Data/General/ArrowG.png")
      HMP.weeklyW6Event.ectoArrow3:SetTexture("Data/General/ArrowG.png")
    end
  end
end

Event:OnTick(tick_weeklyW6Event)
Debug:Print("HMP: Sorting and Appraisal Script Loaded.")