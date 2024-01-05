HMP.Countdown = {
  num = {--track var, compareTime, endTime, marker, orig. texture
    {0, 0, 0, nil, nil}, {0, 0, 0, nil, nil}, {0, 0, 0, nil, nil}, {0, 0, 0, nil, nil}, {0, 0, 0, nil, nil},
    {0, 0, 0, nil, nil}, {0, 0, 0, nil, nil}, {0, 0, 0, nil, nil}, {0, 0, 0, nil, nil}, {0, 0, 0, nil, nil},
  }
}

Debug:Watch("Countdown Test Variables", HMP.Countdown)
local cd = HMP.Countdown

--For manual calling and resetting
function ResetCountdown(marker)
  for i = 1, #cd.num do
    if(cd.num[i][4] == marker.Guid) then
      marker.Texture = cd.num[i][5]
      for k = 1, 5 do
        if(k < 4) then cd.num[i][k] = 0
        else cd.num[i][k] = nil end
      end
      break
    end
  end
end

--When a user interacts with a marker with a countdown, we set variables to tell the script
--that the marker wants a countdown.
function hmpCountdown(marker)
  for k = 1, #cd.num do
    --If the marker is currently in use, we deny giving it a countdown.
    if(cd.num[k][4] ~= nil and cd.num[k][4].Guid == marker.Guid ) then break end
    --If the marker is not in use, we set variables in the first available table
    if(k == 10) then
      for i = 1, #cd.num do
        if(cd.num[i][1] == 0) then
          cd.num[i][1] = 1
          cd.num[i][3] = marker.ResetLength
          cd.num[i][4] = marker
          cd.num[i][5] = marker.Texture
          break
        end
      end
    end
  end
end

local function tick_countdown(gameTime)
  local time = gameTime.TotalGameTime.TotalSeconds
  
  for i = 1, #cd.num do
    --(1) When a user interacts with a countdown marker, we set time variables, then move to the next step
    if(cd.num[i][1] == 1) then
      cd.num[i][1] = 2
      cd.num[i][2] = time
      cd.num[i][3] = time + cd.num[i][3]
    end
    
    --(2) Once we set time variables, we continually reference this statement until the
    --current time is greater than the compare time + end time(ResetLength)
    if(cd.num[i][1] == 2 and time > cd.num[i][2]) then
      cd.num[i][4]:SetTexture("Assets/Numbers/" .. math.floor(cd.num[i][3]) - math.floor(time) .. ".png")
      cd.num[i][2] = cd.num[i][2] + 1
    end
    
    --(3) Once the current time surpasses the end time, we reset the marker and table back to default
    if(cd.num[i][1] == 2 and time > cd.num[i][3]) then
      cd.num[i][4].Texture = cd.num[i][5]
      for k = 1, #cd.num[i] do
        if(k <= 4) then
          cd.num[i][k] = 0
        else
          cd.num[i][k] = nil
        end
      end
    end
  end
end

Event:OnTick(tick_countdown)