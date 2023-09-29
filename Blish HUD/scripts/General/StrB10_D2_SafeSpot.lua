HMP.StrB10_PrimordusSafeSpot = {
  marker = World:MarkerByGuid("jWwX9IzYeEWK/6ItALBYTw=="),
  center = I:Vector3(15.555, -554.495, 391.713),
  color = { I:Color(64, 255, 54, 255), I:Color(255, 54, 54, 255), I:Color(255, 247, 0, 255) },
}

local SafeSpot, player = HMP.StrB10_PrimordusSafeSpot, Mumble.PlayerCharacter

local function Tick_Primordus_SafeSpot(gameTime)
  Debug:Watch("Vector", (player.Position - SafeSpot.center ):Length() )
  
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