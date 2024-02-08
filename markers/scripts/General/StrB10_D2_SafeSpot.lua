HMP.StrB10_PrimordusSafeSpot = {
  marker = World:MarkerByGuid("jWwX9IzYeEWK/6ItALBYTw=="),
  center = I:Vector3(15.555, -554.495, 391.713),
  color = { I:Color(64, 255, 54, 255), I:Color(255, 54, 54, 255), I:Color(255, 255, 0, 255) },
  catCheck = { false, false, false, false },
  categories = { "HMP.strikeB10_c1.sc1", "HMP.strikeB10_c1.sc1.asc1", "HMP.strikeB10_c1.sc1.asc3", "HMP.strikeB10_c1.sc2" },
  textures = { "SafeSpot_300r_and_Edge", "SafeSpot_Max_and_Edge", "SafeSpot_300r", "SafeSpot_Max" },
}

local SS, player = HMP.StrB10_PrimordusSafeSpot, Mumble.PlayerCharacter

local function UpdateTexture()
  for i = 1, #SS.catCheck do SS.catCheck[i] = World:CategoryByType(SS.categories[i]):IsVisible() end
  
  --No Max Melee or No Boundary
  if( SS.catCheck[1] == false or SS.catCheck[2] == false ) then
    SS.marker:SetTexture("Assets/General/empty.png")
  else
    --No 300r and No Edge
    if(     SS.catCheck[3] == false and SS.catCheck[4] == false ) then SS.marker:SetTexture("Assets/Shapes/" .. SS.textures[4] .. ".png")
    --Yes 300r and No Edge
    elseif( SS.catCheck[3] == true  and SS.catCheck[4] == false ) then SS.marker:SetTexture("Assets/Shapes/" .. SS.textures[3] .. ".png")
    --No 300r and Yes Edge
    elseif( SS.catCheck[3] == false and SS.catCheck[4] == true )  then SS.marker:SetTexture("Assets/Shapes/" .. SS.textures[2] .. ".png")
    --Yes 300r and Yes Edge
    else SS.marker:SetTexture("Assets/Shapes/" .. SS.textures[1] .. ".png") end
  end
end

UpdateTexture() --This ensures the marker always has a texture

local function Tick_Primordus_SafeSpot(gameTime)
  --If the user changes their category settings, we change the texture displayed
  for i = 1, #SS.catCheck do if( World:CategoryByType(SS.categories[i]):IsVisible() ~= SS.catCheck[i] ) then UpdateTexture() end end
  
  --Depending on the player's distance from the hitbox and Primy's Lava Slam, we change the texture's color
  if( ( player.Position - SS.marker.Position ):Length() > SS.marker.Size + 0.1) then
    if( ( player.Position - SS.center ):Length() <= 14.44 ) then
      SS.marker.Tint = SS.color[1]
    else
      SS.marker.Tint = SS.color[3]
    end
  elseif( ( player.Position - SS.marker.Position ):Length() <= SS.marker.Size + 0.05) then
    SS.marker.Tint = SS.color[2]
  end
  
  --When the player moves too far away, we hide the marker
  if( player.Position.X > 19 and player.Position.X < 34 and player.Position.Y < -541 ) then
    SS.marker.InGameVisibility = true
  else
    SS.marker.InGameVisibility = false
  end
end

Event:OnTick(Tick_Primordus_SafeSpot)