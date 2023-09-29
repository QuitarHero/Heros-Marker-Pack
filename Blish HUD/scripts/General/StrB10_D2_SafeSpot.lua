HMP.StrB10_PrimordusSafeSpot = {
  marker = World:MarkerByGuid("jWwX9IzYeEWK/6ItALBYTw=="),
  center = I:Vector3(15.555, -554.495, 391.713),
  color = { I:Color(64, 255, 54, 255), I:Color(255, 54, 54, 255), I:Color(255, 255, 0, 255) },
  catCheck = { false, false, false, false },
  textures = {
    "SafeSpot_300r_and_Edge", "SafeSpot_Max_and_Edge",
    "SafeSpot_300r", "SafeSpot_Max"
  },
}

local SafeSpot, player = HMP.StrB10_PrimordusSafeSpot, Mumble.PlayerCharacter

local function UpdateTexture()
  local getCatStates = {
    World:CategoryByType("HMP.strikeB10_c1.sc1"):IsVisible(), World:CategoryByType("HMP.strikeB10_c1.sc1.asc1"):IsVisible(),
    World:CategoryByType("HMP.strikeB10_c1.sc1.asc3"):IsVisible(), World:CategoryByType("HMP.strikeB10_c1.sc2"):IsVisible()
  }
  for i = 1, #SafeSpot.catCheck do
    SafeSpot.catCheck[i] = getCatStates[i]
  end
  
  if( SafeSpot.catCheck[1] == false or SafeSpot.catCheck[2] == false ) then
    SafeSpot.marker:SetTexture("Data/General/empty.png")
  else
    SafeSpot.marker.InGameVisibility = true
    if( SafeSpot.catCheck[3] == false and SafeSpot.catCheck[4] == false ) then
      SafeSpot.marker:SetTexture("Data/Shapes/" .. SafeSpot.textures[4] .. ".png")
    elseif( SafeSpot.catCheck[3] == true and SafeSpot.catCheck[4] == false ) then
      SafeSpot.marker:SetTexture("Data/Shapes/" .. SafeSpot.textures[3] .. ".png")
    elseif( SafeSpot.catCheck[3] == false and SafeSpot.catCheck[4] == true ) then
      SafeSpot.marker:SetTexture("Data/Shapes/" .. SafeSpot.textures[2] .. ".png")
    else
      SafeSpot.marker:SetTexture("Data/Shapes/" .. SafeSpot.textures[1] .. ".png")
    end
  end
end

UpdateTexture()

local function Tick_Primordus_SafeSpot(gameTime)
  Debug:Watch("Vector", (player.Position - SafeSpot.center ):Length() )
  
  if( World:CategoryByType("HMP.strikeB10_c1.sc1"):IsVisible() ~= SafeSpot.catCheck[1] ) then
    Debug:Print("1")
    UpdateTexture()
  elseif( World:CategoryByType("HMP.strikeB10_c1.sc1.asc1"):IsVisible() ~= SafeSpot.catCheck[2] ) then
    Debug:Print("2")
    UpdateTexture()
  elseif( World:CategoryByType("HMP.strikeB10_c1.sc1.asc3"):IsVisible() ~= SafeSpot.catCheck[3] ) then
    UpdateTexture()
   elseif( World:CategoryByType("HMP.strikeB10_c1.sc2"):IsVisible() ~= SafeSpot.catCheck[4] ) then
    UpdateTexture()
  end
  
  if( ( player.Position - SafeSpot.marker.Position ):Length() > SafeSpot.marker.Size + 0.1) then
    if( ( player.Position - SafeSpot.center ):Length() <= 14.44 ) then
      SafeSpot.marker.Tint = SafeSpot.color[1]
    else
      SafeSpot.marker.Tint = SafeSpot.color[3]
    end
  elseif( ( player.Position - SafeSpot.marker.Position ):Length() <= SafeSpot.marker.Size + 0.1) then
    SafeSpot.marker.Tint = SafeSpot.color[2]
  end
  
  if( player.Position.X > 19 and player.Position.X < 34 and player.Position.Y < -541 ) then
    SafeSpot.marker.InGameVisibility = true
  else
    SafeSpot.marker.InGameVisibility = false
  end
end

Event:OnTick(Tick_Primordus_SafeSpot)