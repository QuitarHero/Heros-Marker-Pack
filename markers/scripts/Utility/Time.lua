HMPtime = {
  --Gets the remainder of the total day amount since epoch and the provided interval.
  --"minusTime" is optional
  GetUtcTime = function (interval, minusTime)
    if(minusTime == nil) then minusTime = 0 end
    local time = os.time( os.date("!*t") ) - minusTime
    local TotalDays = math.floor( (time / 86400) )
    local remainder = math.fmod(TotalDays, interval)
    
    return remainder
  end
}