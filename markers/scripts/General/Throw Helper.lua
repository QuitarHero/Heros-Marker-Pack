HMP.revHammer = {
  HTreg = World:MarkerByGuid("n5G47G5qp0e2f1U4sGUn1A=="),
  HTcm  = World:MarkerByGuid("hfVys/oWMkKoUtb/032zWw==")
}

local function tick_revHammer(gameTime)
  --Variables
  local playerPos     = Mumble.PlayerCharacter.Position
  local forwardPlayer = Mumble.PlayerCharacter.Forward
  local HTreg = HMP.revHammer.HTreg
  local HTcm  = HMP.revHammer.HTcm
  --Putting the picture around the player
   HTcm:SetPos(playerPos.X, playerPos.Y, 390.113)
  HTreg:SetPos(playerPos.X, playerPos.Y, 390.113)
  --Rotating the picture so it's always accurate
   HTcm:SetRot(0, 0, math.atan2(forwardPlayer.Y, forwardPlayer.X)-(3.14/2))
  HTreg:SetRot(0, 0, math.atan2(forwardPlayer.Y, forwardPlayer.X)-(3.14/2))
end

Event:OnTick(tick_revHammer)
--Thanks to Noro.2879 for assisting me in the rotation math