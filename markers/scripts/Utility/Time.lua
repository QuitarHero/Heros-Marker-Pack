HMPtime = {
  GetUtcTime = function (interval, addTime)
    if(addTime == nil) then addTime = 0 end
    local LeapDayAmt = HMPtime.GetLeapDayAmt()
    local currentTime = os.time( os.date("!*t") ) - addTime - (LeapDayAmt * 86400)
    local totalDays = math.floor( ( currentTime / 86400) )
    local remainder = math.fmod(totalDays, interval)
    
    --Debug:Print("Leap Year Testing: " .. LeapDayAmt)
    
    return remainder
  end,
  
  GetLeapDayAmt = function()
    local LeapDayAmt, YearAmt = 0, tonumber(os.date("%Y"))
    
    for i = YearAmt, 1970, -1 do
      if( i ~= os.date("%Y") ) then
        if( i % 400 == 0 or i % 4 == 0 and i % 100 ~= 0 ) then
          LeapDayAmt = LeapDayAmt + 1
        end
      else
        if( os.date("%m") > 2 ) then
          if( i % 400 == 0 or i % 4 == 0 and i % 100 ~= 0 ) then
            LeapDayAmt = LeapDayAmt + 1
          end
        end
      end
    end
    
    return LeapDayAmt
  end
}