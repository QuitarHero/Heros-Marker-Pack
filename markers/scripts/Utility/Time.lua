HMPtime = {
  GetUtcTime = function (interval, addTime)
    if(addTime == nil) then addTime = 0 end
    local currentTime = os.time( os.date("!*t") ) - addTime
    local totalDays = math.floor( ( currentTime / 86400) )
    local remainder = math.fmod(totalDays, interval)
    return remainder
  end,
}