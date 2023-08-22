HMPtime = {
  GetUtcTime = function (interval, addTime)
    local delay = 64
    local Year, Month, Day, Hour, Min, Sec = tonumber(os.date("!%Y")), tonumber(os.date("!%m")), tonumber(os.date("!%d")), tonumber(os.date("!%H")), tonumber(os.date("!%M")), tonumber(os.date("!%S"))
    local utcTime   = os.time{year=Year, month=Month, day=Day, hour=Hour, min=Min, sec=Sec}
    local totalDays = math.floor((utcTime - addTime + delay) / 86400)
    local remainder = math.fmod(totalDays, interval)
    return remainder
  end,
}