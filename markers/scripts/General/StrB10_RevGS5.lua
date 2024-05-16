--Dependencies
Pack:Require("scripts/Utility/Math")

HMP.StrB10_RevGS5 = {
  Marker = World:MarkerByGuid("DcF/YAFiqkCqPMFkqKPl2A=="),
  --Real, RedLine, Center
  EdgeCat = World:CategoryByType("HMP.strikeB10_c1.sc3"):IsVisible(),
  Textures = { "Rev GS5-Edge", "Rev GS5" },
  Area = {
    { 12.98, 9.143, 36.9 } --RedLine GS5 Max, GS5 Radius, Center Radius
  },
  Real = {
    Hitbox = I:Vector3(19.511, -552.495, 391.723),
    Vector = I:Vector3(0, 0, 0),
    Radius = { 10.4, 17.2 }
  },
  Redline = {
    Hitbox = I:Vector3(15.555, -554.495, 391.723),
    Vector = I:Vector3(0, 0, 0),
    Radius = { 6.2, 14.5 },
    OverlapArea = 0,
    Lune1 = 0
  },
  Center = {
    Hitbox = I:Vector3(15.359, -518.036, 391.723),
    Vector = I:Vector3(0, 0, 0),
    Radius = { 22.5, 37.5 },
    OverlapArea = 0,
    Lune1 = 0
  }
}

local RevGS5, Player = HMP.StrB10_RevGS5, Mumble.PlayerCharacter

--Updates the category track variable and sets the marker's texture based on user preference
local function UpdateCat()
  if( World:CategoryByType("HMP.strikeB10_c1.sc2"):IsVisible() ) then
    RevGS5.EdgeCat = true
    RevGS5.Marker:SetTexture("Assets/Shapes/" .. RevGS5.Textures[1] .. ".png")
  else
    RevGS5.EdgeCat = false
    RevGS5.Marker:SetTexture("Assets/Shapes/" .. RevGS5.Textures[2] .. ".png")
  end
end

UpdateCat() --Ensures the marker gets a texture

local function tick_RevGS5_Area(gameTime)
  --Allows the script to do stuff if the user has its category enabled
  if( World:CategoryByType("HMP.strikeB10_c99.sc3"):IsVisible() ) then
    --Changes texture based on user preference when needed
    if( World:CategoryByType("HMP.strikeB10_c1.sc2"):IsVisible() ~= RevGS5.EdgeCat ) then UpdateCat() end
    
    --Initializes and tracks relevant vector lengths
    RevGS5.Real.Vector = (Player.Position - RevGS5.Real.Hitbox):Length()
    RevGS5.Redline.Vector = (Player.Position - RevGS5.Redline.Hitbox):Length()
    
    --Displays the marker when it becomes relevant
    if( RevGS5.Real.Vector < RevGS5.Real.Radius[1] or RevGS5.Redline.Vector > RevGS5.Redline.Radius[2] ) then
      RevGS5.Marker.InGameVisibility = false
    else
      RevGS5.Marker.InGameVisibility = true
    end
    
    --When the marker is visible, we begin to care about changing it's color
    if( RevGS5.Marker.InGameVisibility ) then
      -- M A T H
      RevGS5.Redline.OverlapArea = HMPutility.math.OverlapArea(9.143, 12.98, RevGS5.Redline.Vector)
      RevGS5.Redline.Lune1 = HMPutility.math.Lune1(9.143, 12.98, RevGS5.Redline.Vector)
      RevGS5.Center.Vector = (Player.Position - RevGS5.Center.Hitbox):Length()
      RevGS5.Center.OverlapArea = HMPutility.math.OverlapArea(9.143, 36.9, RevGS5.Center.Vector)
      RevGS5.Center.Lune1 = HMPutility.math.Lune1(9.143, 36.9, RevGS5.Center.Vector)
      local percent = RevGS5.Redline.OverlapArea / (RevGS5.Redline.OverlapArea + RevGS5.Redline.Lune1)
      
      --If the probability is high enough for GS5 to get 5 or more random impacts, we give the marker a gradient green.
      if( percent > 0.555 ) then
        local color1 = 275 * percent
        RevGS5.Marker.Tint = I:Color(0, color1, 0, 255)
      else --If the probability is not high enough, we make the marker red.
        RevGS5.Marker.Tint = I:Color(255, 0, 0, 255)
      end
    else --If anything were to go wrong, we set the marker's color to White.
      RevGS5.Marker.Tint = I:Color(255, 255, 255, 255)
    end
  end
end

Event:OnTick(tick_RevGS5_Area)