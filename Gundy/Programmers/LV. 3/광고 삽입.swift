func convertToSecond(_ time: String) -> Int {
    let time = time.split(separator: ":").map(String.init).compactMap(Int.init)
    return time[0] * 3600 + time[1] * 60 + time[2]
}

func convertToString(_ second: Int) -> String {
    var second = second
    let hour = second / 3600
    second %= 3600
    let minute = second / 60
    second %= 60
    var time = String()
    time += hour < 10 ? "0" + String(hour) + ":" : String(hour) + ":"
    time += minute < 10 ? "0" + String(minute) + ":" : String(minute) + ":"
    time += second < 10 ? "0" + String(second) : String(second)
    return time
}

func solution(_ play_time:String, _ adv_time:String, _ logs:[String]) -> String {
    let advTime = convertToSecond(adv_time)
    let playTime = convertToSecond(play_time)
    guard advTime < playTime else { return "00:00:00" }
    var times = Array(repeating: 0, count: playTime + 1)
    for log in logs {
        let time = log.split(separator: "-").map(String.init).map(convertToSecond)
        times[time[0]] += 1
        times[time[1]] -= 1
    }
    var index = 1
    while index < times.count {
        times[index] += times[index - 1]
        index += 1
    }
    var result = 0
    var start = 0
    var max = times[start...advTime - 1].reduce(0, +)
    var total = max
    while start + advTime < playTime {
        total -= times[start]
        total += times[start + advTime]
        start += 1
        if max < total {
            max = total
            result = start
        }
    }
    return convertToString(result)
}
