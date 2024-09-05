-- Dependencies
Pack:Require("scripts/Utility/Animate.lua")
Pack:Require("scripts/Utility/Position.lua")

HMP_PoolPractice = {
  TriggerMarkers = { "2WSjZ55ZTEGiblHUjfkh+A==", "Gdotxh/ZiEWBO9d6+120uQ==" },
  Markers = {},
  ErrorMarkers = {},
  Track = 0,
  StartTime = 0,
  Latency = {
    Lag = {
      PollIndex = 0
    },
    Throttle = {
      Threshold = {0, 1, 2, 5, 10},
      Percent = 0,
      TimePool = 0,
      Interval = 0,
      LastTime = 0
    }
  },
  rPos = {},
  dPools = {
    Size = { {2.97, 2.88, 3.04}, {5.94, 5.76, 6.09} }, --0.9769736842 | 0.9473684211 | 1
    Type = 1,
    Amount = 1,
  },
  Poll = {
    Pos = {},
    Time = {},
    fVector = {},
    Interval = 0,
  },
  Dur = {
    AoE_FadeIn = 1.2,
    Orb_FadeIn = 0.4,
    Orb_Start  = 4,
    Orb_Lower1 = 0.6,
    Orb_Lower2 = 0.2, --0.35
  },
  Alpha = {0.9, 0.35},
  Dodge = {
    Direction = 0,
    Text = {"Backwards", "Back-Right", "Right", "Up-Right", "Forwards", "Up-Left", "Left", "Back-Left", "Backwards"},
  },
  Result = {
    Threshold = {1, 0.66, 0.33, 0},
    Text = {"Early-Dodge", "Good!", "Great!", "Perfect!", "Late-Dodge"},
  },
  Description = {
    Threshold = {2, 1, 0.66, 0.33, 0},
    Text = {"Really-Early-Dodge", "Early-Dodge", "Good!", "Great!", "Perfect!", "Late-Dodge"}
  }
}

local Pools, Player = HMP_PoolPractice, Mumble.PlayerCharacter
Debug:Watch("Pool Variables", HMP_PoolPractice)

--Identical to the Utility Function, but put here in case I need to make changes to it specific for Despair Pools
local function PoolSizeGrow(time, start, duration, minSize, maxSize, marker)
  if( time > start and time <= start + duration ) then
    marker.Size = minSize + ((maxSize - minSize) * (time - start) / duration)
  end
end

--Resets relevant Despair Pool variables
local function ResetPoolPractice()
  local cBoardMarkers = World:CategoryByType("HMP.StrB13_c90.sc2.curr.asc2"):GetMarkers()
  for _,v in ipairs(Pools.Markers) do if( v ~= nil ) then v:Remove() else break end end
  for _,v in ipairs(Pools.ErrorMarkers) do if( v ~= nil ) then v:Remove() else break end end
  for _,v in ipairs(cBoardMarkers) do if( v ~= nil ) then v:Remove() else break end end
  
  Pools.Markers = {}
  Pools.ErrorMarkers = {}
  Pools.Latency.Throttle.Interval = 0
  Pools.Latency.Throttle.LastTime = 0
  Pools.rPos = {}
  Pools.Track = 0
  Pools.StartTime = 0
  Pools.Poll.Pos = {}
  Pools.Poll.Time = {}
  Pools.Poll.fVector = {}
  Pools.Poll.Interval = 0
end

--Inverts the InGameVisibility of the Trigger Markers and Moves Positions
local function InvertVisibility(GUIDtable)
  for _,v in ipairs(GUIDtable) do
    if( World:MarkerByGuid(v).InGameVisibility ) then
      World:MarkerByGuid(v).InGameVisibility = false
      World:MarkerByGuid(v):SetPos(0, 0, 0)
    else
      World:MarkerByGuid(v).InGameVisibility = true
      World:MarkerByGuid(v):SetPos(-6.52568, -231.7983, 205.6108)
    end
  end
end

--Script-Trigger functions
function StartPoolPractice() InvertVisibility(Pools.TriggerMarkers) ResetPoolPractice() Pools.Track = 1 end
function RedisplayPoolPractice() InvertVisibility(Pools.TriggerMarkers) ResetPoolPractice() end

local function CreatePool(amt)
  --Global attributes for all markers, regardless of purpose
  local attr = {
    MapID = Mumble.CurrentMap.Id,
    iconSize = 0,
    type = "HMP.StrB13_c90.sc99",
    alpha = 0,
  }
  
  --Gets Pool Size (Normal vs Empowered)
  for i = 1, 2 do
    if( World:CategoryByType("HMP.StrB13_c90.sc4.asc" .. i):IsVisible()) then
      Pools.dPools.Type = i
    elseif( i == 2 ) then
      Pools.dPools.Type = 1
    end
  end
  attr.iconSize = Pools.dPools.Size[Pools.dPools.Type][1]
  
  for i = 1, amt*5 do
    -- If we are only making 1 Pool, or this is the last pool in the set...
    if( i > (amt*5)-5 ) then
      Pools.Markers[i] = Pack:CreateMarker(attr)
      Pools.Markers[i]:SetPos(Player.Position)
      
    -- If we are making more than 1 Pool and it is not the last one in the set...
    else
      -- If 'i' == 1 (when we create a new Pool), we get a random position around the Player.
      -- We only want to do this for every individual Pool we make; not every loop iteration.
      if( i % 5 == 1 ) then
        Pools.rPos[math.ceil(i/5)] = Utility.Position.randomXZ(Player.Position, 2)
        Pools.rPos[math.ceil(i/5)] = (Pools.rPos[math.ceil(i/5)] - Player.Position)
      end
      Pools.Markers[i] = Pack:CreateMarker(attr)
      Pools.Markers[i]:SetPos(Player.Position + Pools.rPos[math.ceil(i/5)])
    end
    
    -- Setting the Texture Alpha, Rotate, Size, and Color
    if( i % 5 == 4 or i % 5 == 2 ) then
      Pools.Markers[i]:SetTexture("Assets/Shapes/CircleFill.png")
      Pools.Markers[i]:SetRotX(0)
      Pools.Markers[i].Tint = I:Color(217, 140, 59, 255)
    elseif( i % 5 == 3 or i % 5 == 1 ) then
      Pools.Markers[i]:SetTexture("Assets/Shapes/Orb5.png")
      Pools.Markers[i]:SetRotX(0)
      Pools.Markers[i].Tint = I:Color(217, 140, 59, 255)
    elseif( i % 5 == 0 ) then
      Pools.Markers[i]:SetTexture("Assets/Strikes/Orb.png")
      Pools.Markers[i].Size = 1.2
    end
  end
end

local function CreateDots()
  local attr = {
    MapID = Mumble.CurrentMap.Id,
    iconSize = 0.15,
    type = "HMP.StrB13_c90.sc5.asc1",
    alpha = 0.9,
  }
  for i = 1, 2 do
    Pools.ErrorMarkers[i] = Pack:CreateMarker(attr)
    Pools.ErrorMarkers[i]:SetRotX(3.14)
    Pools.ErrorMarkers[i]:SetTexture("Assets/General/dot.png")
  end
  Pools.ErrorMarkers[1]:SetPos(Pools.Poll.Pos[1] - I:Vector3(0, 0, 1.55))
  Pools.ErrorMarkers[2]:SetPos(Pools.Poll.Pos[#Pools.Poll.Pos - Pools.Latency.Lag.PollIndex] - I:Vector3(0, 0, 1.55))
end

local function CreateErrorCircle()
  local attr = {
    MapID = Mumble.CurrentMap.Id,
    iconSize = 3.048,
    type = "HMP.StrB13_c90.sc5.asc2",
    alpha = 2,
  }
  Pools.ErrorMarkers[3] = Pack:CreateMarker(attr)
  Pools.ErrorMarkers[3]:SetTexture("Assets/Shapes/Orb5.png")
  Pools.ErrorMarkers[3]:SetRotX(3.14)
  Pools.ErrorMarkers[3]:SetPos(Pools.Poll.Pos[1] - I:Vector3(0, 0, 1.55))
end

local function DisplayNumbers(Position, Number, Attributes, Size)
  local digitAmt = #tostring(Number)
  local markers = {}
  local offset = 0.09
  
  for i = 1, digitAmt do
    local digit = string.sub(Number, (digitAmt + 1 - i), (digitAmt + 1 - i))
    
    markers[i] = Pack:CreateMarker(Attributes)
    markers[i].Size = Size
    markers[i]:SetRot(1.5708, 0, 4.71239)
    markers[i]:SetPos(Position + I:Vector3(0, -((offset) * (i-1)), 0))
    
    if( digit == "%" ) then
      markers[i]:SetTexture("Assets/Strikes/DP_Adventure/Numbers/percent.png")
    else
      markers[i]:SetTexture("Assets/Strikes/DP_Adventure/Numbers/" .. tonumber(digit) .. ".png")
    end
  end
  
  return markers
end

local function DisplayText(Position, Text, Attributes, Size, Alignment)
  local marker = Pack:CreateMarker(Attributes)
  marker:SetPos(Position)
  marker:SetRot(1.5708, 0, 4.71239)
  marker.Size = Size
  marker:SetTexture("Assets/Strikes/DP_Adventure/Text/" .. Alignment .. "/" .. Text .. ".png")
  
  return marker
end

local function DisplayHistory()
  local height = {209.012, 208.7145, 208.417, 208.1195, 207.822, 207.5245, 207.227, 206.9295, 206.6325} -- 0.2975 offset
  local HistoryBoard = {
    Number = {},
    Result = {},
    Direction = {},
    Distance = {},
    Amount = {},
    Empowered = {},
    Ping = {},
    LagSpike = {}
  }
  
  local attr = {
    MapID = Mumble.CurrentMap.Id,
    type = "HMP.StrB13_c90.sc2.hist.asc2",
    iconSize = 1,
    alpha = 0.75,
  }
  
  --Displaying Information to the History Board
  for i = 1, 9 do
    local curStorage = Storage:ReadValue("hmp", "Pool" .. i)
    HistoryBoard.Number = DisplayNumbers(I:Vector3(-14.0683, -228.70, height[i]), i, attr, 0.12)
    
    if( curStorage ~= nil ) then
      local temp, value = "", 0
      
      --We get the Result from the Stored Value
      for k = value, value+15 do
        if( string.sub(curStorage, k, k) == "_" ) then
          temp = string.sub(curStorage, value, k-1)
          value = k+1
          break
        end
      end
      HistoryBoard.Result = DisplayText(I:Vector3(-14.0683, -228.009, height[i]), temp, attr, 0.55, "CenterAlign")
              
      --We get the Direction from the Stored Value
      for k = value, value+15 do
        if( string.sub(curStorage, k, k) == "_" ) then
          temp = string.sub(curStorage, value, k-1)
          value = k+1
          break
        end
      end
      HistoryBoard.Direction = DisplayText(I:Vector3(-14.0683, -227.143, height[i]), temp, attr, 0.55, "CenterAlign")
              
      --We get the Distance from the Stored Value
      for k = value, value+6 do --only supports 5 digits
        if( string.sub(curStorage, k, k) == "_" ) then
          temp = string.sub(curStorage, value, k-1)
          value = k+1
          break
        end
      end
      HistoryBoard.Distance = DisplayNumbers(I:Vector3(-14.0683, -226.165, height[i]), tonumber(temp), attr, 0.09)
              
      --We get the Amount from the Stored Value
      for k = value, value+3 do
        if( string.sub(curStorage, k, k) == "_" ) then
          temp = string.sub(curStorage, value, k-1)
          value = k+1
          break
        end
      end
      HistoryBoard.Amount = DisplayNumbers(I:Vector3(-14.0683, -225.537, height[i]), tonumber(temp), attr, 0.09)
              
      --We get the Pool Size from the Stored Value
      for k = value, value+4 do
        if( string.sub(curStorage, k, k) == "_" ) then
          temp = string.sub(curStorage, value, k-1)
          value = k+1
          break
        end
      end
      HistoryBoard.Empowered = DisplayText(I:Vector3(-14.0683, -225.049, height[i]), temp, attr, 0.55, "CenterAlign")
    
      if( string.sub(curStorage, value, value) ~= "" ) then
        --We get the Ping from the Stored Value
        for k = value, value+4 do
          if( string.sub(curStorage, k, k) == "_" ) then
            temp = string.sub(curStorage, value, k-1)
            value = k+1
            break
          end
        end
        HistoryBoard.Ping = DisplayNumbers(I:Vector3(-14.0683, -224.41, height[i]), temp, attr, 0.09)
        
        --We get the Lag Spike / Throttle from the Stored Value
      for k = value, value+5 do
        if( string.sub(curStorage, k, k) == "_" ) then
          temp = string.sub(curStorage, value, k-1)
          value = k+1
          break
        end
      end
      HistoryBoard.LagSpike = DisplayNumbers(I:Vector3(-14.0683, -223.690, height[i]), tostring(temp .. "%"), attr, 0.09)
      end
    else
      break
    end
  end
end

local function ChangeMinimapIcon()
  local minimapMarker = World:MarkerByGuid("zcrtjfTr9EG7sUMxTtO91g==")
  minimapMarker:SetTexture("Assets/Strikes/DP_Adventure/961368.png")
  minimapMarker.TipDescription = ""
end

local function LagAmount()
  local amount = 1
  for i = 1, 11 do
    if( World:CategoryByType("HMP.StrB13_c90.sc6.asc1." .. i):IsVisible() == true ) then
      if( i < 11 ) then
        Debug:Print("hi: " .. i )
        amount = i
      else
        amount = math.random(i, 20)
      end
      break
    end
  end
  return amount
end

local function GetThrottlePercent()
  for i = 1, 7 do
    if( World:CategoryByType("HMP.StrB13_c90.sc6.asc2." .. i):IsVisible() == true ) then
      Pools.Latency.Throttle.Percent = Pools.Latency.Throttle.Threshold[i]
      break
    end
  end
end

local function ThrottleCheck()
  local percent = 0
  percent = (math.random(0, 10) * 10) + math.random(0, 10)
  percent = percent + ( ((math.random(0, 10) * 10) + math.random(0, 10)) / 100 )
  if( percent <= Pools.Latency.Throttle.Percent ) then
    Pools.Latency.Throttle.TimePool = Pools.Latency.Throttle.TimePool + 1
  end
end

ChangeMinimapIcon()
DisplayHistory()

local time = 0

local function tick_PoolPractice(gameTime)
  -- When the script begins, we create markers
  if( Pools.Track == 1 ) then
    for i = 1, 10 do
      if( World:CategoryByType("HMP.StrB13_c90.sc3." .. i):IsVisible() == true ) then
        Pools.dPools.Amount = i
        break
      end
    end
    CreatePool(Pools.dPools.Amount)
    for i = 1, #Pools.Markers do if( i % 5 == 4 or i % 5 == 3 ) then Pools.Markers[i].InGameVisibility = false end end
    
    Pools.Latency.Lag.PollIndex = LagAmount() --Gets Lag value for Polling Index
    GetThrottlePercent() --Gets Percent Chance to Throttle
    Pools.StartTime = gameTime.TotalGameTime.TotalSeconds
    time = gameTime.TotalGameTime.TotalSeconds - Pools.StartTime
    Pools.Track = 2
  end
  
  if( Pools.Track == 2 ) then
    local lagTime = gameTime.TotalGameTime.TotalSeconds - Pools.StartTime
    --Checks for Throttling every 5ms
    if( lagTime >= Pools.Latency.Throttle.LastTime + (0.005 * Pools.Latency.Throttle.Interval) ) then
      ThrottleCheck()
      Pools.Latency.Throttle.LastTime = gameTime.TotalGameTime.TotalSeconds - Pools.StartTime
      Pools.Latency.Throttle.Interval = Pools.Latency.Throttle.Interval + 1
    end
    if( time + Pools.Latency.Throttle.TimePool <= lagTime ) then
      --Real time variable
      time = gameTime.TotalGameTime.TotalSeconds - Pools.StartTime
      Debug:Watch("Pool Time", time)
      Pools.Latency.Throttle.TimePool = 0
    end
    
    -- Polls the Player's position, time, and forward vector
    if( lagTime > (5 - 1) + (0.05 * Pools.Poll.Interval) and lagTime <= 5 ) then
      Pools.Poll.Time[(1 + Pools.Poll.Interval)] = lagTime
      Pools.Poll.Pos[(1 + Pools.Poll.Interval)] = Player.Position
      Pools.Poll.fVector[(1 + Pools.Poll.Interval)] = Player.Forward
      Pools.Poll.Interval = Pools.Poll.Interval + 1
    end
    
    for i = 1, #Pools.Markers do
      if( time + Pools.Latency.Throttle.TimePool >= lagTime ) then --Only modifies positions when allowed
        --If the markers we're looking at are for the player (last Pool set in the Marker table), we set them to follow the player.
        if( i > #Pools.Markers - 5 ) then
          if( i % 5 ~= 0 ) then
            Pools.Markers[i]:SetPos(Player.Position.X, Player.Position.Y, 205.052) --205.052
          elseif( i % 5 == 0 ) then
            Pools.Markers[i]:SetPosX(Player.Position.X)
            Pools.Markers[i]:SetPosY(Player.Position.Y)
            if( time < 3.5 ) then
              Pools.Markers[i]:SetPosZ(205.052 + 8.1) --212.052
            end
          end
        --If the markers we're looking at are not for the player, we only modify the height value
        else
          if( time < 4 and i <= #Pools.Markers - 5 ) then
            if( i % 5 ~= 0 ) then
              Pools.Markers[i]:SetPos(Player.Position + Pools.rPos[math.ceil(i/5)])
            elseif( i % 5 == 0 ) then
              Pools.Markers[i]:SetPosX(Player.Position.X + Pools.rPos[math.ceil(i/5)].X)
              Pools.Markers[i]:SetPosY(Player.Position.Y + Pools.rPos[math.ceil(i/5)].Y)
              if( time < 3.5 ) then
                Pools.Markers[i]:SetPosZ(205.052 + 8.1)
              end
            end
          end
        end
      end
      
      --Fade-In Markers
      if( i % 5 == 4 or i % 5 == 2 ) then
        Utility.Animate.FadeIn(time, 0, Pools.Dur.AoE_FadeIn, 0.25, Pools.Markers[i])
      elseif( i % 5 == 3 or i % 5 == 1) then
        Utility.Animate.FadeIn(time, 0, Pools.Dur.AoE_FadeIn, 0.9, Pools.Markers[i])
      elseif( i % 5 == 0 ) then
        Utility.Animate.FadeIn(time, Pools.Dur.AoE_FadeIn, Pools.Dur.Orb_FadeIn, 0.9, Pools.Markers[i])
      end
      
      --Showing the Inner AoE markers when it's time to expand them
      -- (Yes this is a hack)
      if( time >= Pools.Dur.AoE_FadeIn and time < 4 ) then
        Pools.Markers[i].InGameVisibility = true
        if( i % 5 == 4 or i % 5 == 2 ) then
          Pools.Markers[i].Alpha = 0.25
        else
          Pools.Markers[i].Alpha = 0.9
        end
      end
      
      --Inner AoE
      if( i % 5 == 2 or i % 5 == 1 ) then
        PoolSizeGrow(time, Pools.Dur.AoE_FadeIn, (5 - Pools.Dur.AoE_FadeIn), 0, Pools.dPools.Size[Pools.dPools.Type][2], Pools.Markers[i])
      end
      --Outer AoE
      if( i % 5 == 4 or i % 5 == 3 ) then
        Utility.Animate.SizeShrink(time, Pools.Dur.AoE_FadeIn, (5 - Pools.Dur.AoE_FadeIn), Pools.dPools.Size[Pools.dPools.Type][2], Pools.dPools.Size[Pools.dPools.Type][1], Pools.Markers[i])
      end
      
      -- ========== THE IMPACTING ORB ==========
      if( i % 5 == 0 ) then
        Utility.Animate.Descend(time, Pools.Dur.Orb_Start, Pools.Dur.Orb_Lower1, Player.Position.Z + 7.1119, Player.Position.Z + 8.1, Pools.Markers[i])
        Utility.Animate.Descend(time, (Pools.Dur.Orb_Start + Pools.Dur.Orb_Lower1), Pools.Dur.Orb_Lower2, Player.Position.Z, Player.Position.Z + 7.1119, Pools.Markers[i])
        if( time >= Pools.Dur.Orb_Start + Pools.Dur.Orb_Lower1 + Pools.Dur.Orb_Lower2 ) then
          Pools.Markers[i].InGameVisibility = false
        end
      end
      
      --When the damaging AoE needs to spawn, we change its color and size.
      if( time >= 5 ) then
        if( i % 5 ~= 0 ) then
          Pools.Markers[i].Tint = I:Color(214, 19, 19, 255)
          Pools.Markers[i].Size = Pools.dPools.Size[Pools.dPools.Type][3]
          
          if( i % 5 == 3 or i % 5 == 1 ) then
            Pools.Markers[i].Alpha = 0.9
          else
            Pools.Markers[i].Alpha = 0.1
          end
          
          if( i > #Pools.Markers - 5 ) then Pools.Markers[i]:SetPos(Pools.Poll.Pos[#Pools.Poll.Pos - Pools.Latency.Lag.PollIndex]) end
        else
          Pools.Markers[i].InGameVisibility = false
        end
        if( i == #Pools.Markers ) then
          Pools.Track = 3
        end
      end
    end
  end
  
  if( Pools.Track == 3 ) then
    local fRef = Pools.Poll.fVector[#Pools.Poll.fVector - Pools.Latency.Lag.PollIndex] --Getting the last relevant Forward Vector
    local fAngle = math.atan2(fRef.Y, fRef.X) --Converting the fVector into radians
    if( fAngle < 0 ) then fAngle = fAngle + (math.pi * 2) end
    
    -- ===== Getting Dodge Direction =====
    --Getting the player's position at the 4s mark, and the 4.95s - Lag Pool Index mark.
    local center, poolPos = Pools.Poll.Pos[1], Pools.Poll.Pos[#Pools.Poll.Pos - Pools.Latency.Lag.PollIndex]
    local mAngle = math.atan2((center.Y - poolPos.Y), (center.X - poolPos.X))
    if( mAngle < 0 ) then mAngle = mAngle + (math.pi * 2) end
    local modAngle = mAngle + fAngle
    if( modAngle < 0 ) then modAngle = modAngle + (math.pi * 2) elseif( modAngle > (math.pi * 2)) then modAngle = modAngle - (math.pi * 2) end
    for i = 0, 8 do
      if( modAngle >= ((math.pi/4) * i) - 0.3925 and modAngle < ((math.pi/4) * i) + 0.3925 ) then
        Pools.Dodge.Direction = i+1
        break
      end
    end
    
    --Creating Markers
    CreateDots()
    CreateErrorCircle()
    Pools.Track = 4
  end
  
  if( Pools.Track == 4 ) then
    local playerError = math.floor((Pools.Poll.Pos[1] - Pools.Poll.Pos[#Pools.Poll.Pos - Pools.Latency.Lag.PollIndex]):Length() * 39.3701)
    local errorRange = math.floor(Pools.ErrorMarkers[3].Size * 39.3701)
    
    local attr = {
      MapID = Mumble.CurrentMap.Id,
      type = "HMP.StrB13_c90.sc2.curr.asc2",
      iconSize = 1,
      alpha = 0.75,
    }
    
    local CurrentStorage = ""
    local CurrentBoard = {
      Result = {},
      Description = {},
      Distance = {},
      Amount = {},
      Direction = {},
      Empowered = {},
      Ping = {},
      LagSpike = {}
    }
    
    --Result and Description
    if( playerError == 0 ) then
      CurrentBoard.Result = DisplayText(I:Vector3(-14.0685, -224.944, 209.035), Pools.Result.Text[5], attr, 1, "CenterAlign")
      attr.alpha = 1
      CurrentBoard.Description = DisplayText(I:Vector3(-14.0683, -225.954, 208.34), Pools.Description.Text[6], attr, 4, "Descriptions")
      attr.alpha = 0.75
      CurrentStorage = Pools.Result.Text[5] .. "_"
    else
      for _,v in ipairs(Pools.Result.Threshold) do
        if( playerError > errorRange * v ) then
          CurrentBoard.Result = DisplayText(I:Vector3(-14.0685, -224.944, 209.035), Pools.Result.Text[_], attr, 1, "CenterAlign")
          CurrentStorage = Pools.Result.Text[_] .. "_"
          break
        end
      end
      for _,v in ipairs(Pools.Description.Threshold) do
        if( playerError > errorRange * v ) then
          attr.alpha = 1
          CurrentBoard.Description = DisplayText(I:Vector3(-14.0683, -225.954, 208.34), Pools.Description.Text[_], attr, 4, "Descriptions")
          attr.alpha = 0.75
          break
        end
      end
    end
    
    --Distance, Pool Amount
    CurrentBoard.Distance  = DisplayNumbers(I:Vector3(-14.0685, -227.698, 206.265), playerError, attr, 0.09)
    CurrentBoard.Amount    = DisplayNumbers(I:Vector3(-14.0685, -227.328, 205.966), Pools.dPools.Amount, attr, 0.09)
    --Direction, Empowered
    CurrentBoard.Direction = DisplayText(I:Vector3(-14.0685, -225.836, 206.269), Pools.Dodge.Text[Pools.Dodge.Direction], attr, 0.55, "RightAlign")
    CurrentBoard.Empowered = DisplayText(I:Vector3(-14.0685, -225.836, 205.97), World:CategoryByType("HMP.StrB13_c90.sc4.asc" .. Pools.dPools.Type).DisplayName, attr, 0.55, "RightAlign")
    --Ping, Lag Spike
    CurrentBoard.Ping      = DisplayNumbers(I:Vector3(-14.0685, -223.637, 206.265), Pools.Latency.Lag.PollIndex * 50, attr, 0.09)
    CurrentBoard.LagSpike  = DisplayNumbers(I:Vector3(-14.0685, -223.432, 205.966), tostring(Pools.Latency.Throttle.Percent .. "%"), attr, 0.09)
    CurrentStorage = CurrentStorage .. Pools.Dodge.Text[Pools.Dodge.Direction] .. "_" .. tostring(playerError) .. "_" .. tostring(Pools.dPools.Amount) .. "_" .. World:CategoryByType("HMP.StrB13_c90.sc4.asc" .. Pools.dPools.Type).DisplayName .. "_" .. Pools.Latency.Lag.PollIndex * 50 .. "_" .. Pools.Latency.Throttle.Percent .. "_"
    
    
    
    local hBoardMarkers = World:CategoryByType("HMP.StrB13_c90.sc2.hist.asc2"):GetMarkers()
    for _,v in ipairs(hBoardMarkers) do if( v ~= nil ) then v:Remove() else break end end
    
    -- ========== STORAGE ==========
    --We only support the past 9 attempts, so if a 9th attempt already exists, we delete it
    if( Storage:ReadValue("hmp", "Pool9") ~= nil ) then Storage:DeleteValue("hmp", "Pool9") end
    
    --We increment each Stored Value's namespace by 1
    for i = 9, 1, -1 do
      local value = Storage:ReadValue("hmp", "Pool" .. i)
      if( value ~= nil ) then
        Storage:UpsertValue("hmp", "Pool" .. i+1, value)
      end
    end
    --After all existing Stored Values have been incremented, we add the Current Attempt to Storage
    Storage:UpsertValue("hmp", "Pool1", CurrentStorage)
    
    DisplayHistory()
    
    Pools.Track = 5
  end
end

Event:OnTick(tick_PoolPractice)