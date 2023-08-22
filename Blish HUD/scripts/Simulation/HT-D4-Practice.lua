HMP.SimStrB10cmD4_P = {
  track = 0,
  curTime = 0,
  check = {false, false},
  jump = {
    markers = World:CategoryByType("hmpSim.htcm_c1.sc6.d4_playerPos"):GetMarkers(),
    track = 0,
    time = 0
  }
}

--Debug:Watch("Mordy's Practice Variables", HMP.SimStrB10cmD4_P)
local d4p = HMP.SimStrB10cmD4_P

--The script-trigger function that "begins" the script
function triggerD4_Practice() d4p.track = 1 end

--Resets notable variables that aren't (easily) reset otherwise
local function resetD4p()
  for i = 1, #HMP.HTcmSim.Mordremoth.shockWaves.markers do HMP.HTcmSim.Mordremoth.shockWaves.markers[i].InGameVisibility = false end
  --for i = 1, #HMP.HTcmSim.Mordremoth.shockWaves.track do HMP.HTcmSim.Mordremoth.shockWaves.track[i] = 5 end
  for i = 1, #d4p.jump.markers do d4p.jump.markers[i].InGameVisibility = false end
  d4p.check[1] = false
  d4p.track = 0
end

local function jumpMarkers(curTime, table, index)
  if(not table[index]) then
    for i = 1, #d4p.jump.markers do d4p.jump.markers[i].InGameVisibility = false end
    d4p.jump.track = 0
    table[index] = true
  end
  if(Mumble.PlayerCharacter.Position.Z > 391.725 and d4p.jump.track == 0) then
    d4p.jump.markers[1].InGameVisibility = true
    d4p.jump.markers[1]:SetPos(Mumble.PlayerCharacter.Position)
    d4p.jump.track = 1
    d4p.jump.time = curTime
  end
  if(Mumble.PlayerCharacter.Position.Z <= 391.725 and d4p.jump.track == 1) then
    d4p.jump.markers[2].InGameVisibility = true
    d4p.jump.markers[2]:SetPos(Mumble.PlayerCharacter.Position)
    d4p.jump.track = 0
    d4p.jump.time = curTime
  end
end

--Main section of the script
local function tick_d4_practice(gameTime)
  --When the script needs to end, we reset variables again
  if(d4p.track ~= 0 and World:CategoryByType("hmpSim.htcm_wave"):IsVisible() == false or d4p.track == 3) then resetD4p() end
  
  if(d4p.track == 1) then resetD4p() d4p.curTime = gameTime.TotalGameTime.TotalMilliseconds d4p.track = 2 end
  local time = (gameTime.TotalGameTime.TotalMilliseconds - d4p.curTime)
  
  if(d4p.track == 2) then
    HTcm_D4_ShockWaves(time, 2500, 10000, d4p.check, 1)
    jumpMarkers(time, d4p.check, 2)
    --Once an amount of time elapses, we end the script
    if(d4p.track ~= 0 and time >= 600000) then d4p.track = 3 end
  end
end

Event:OnTick(tick_d4_practice)