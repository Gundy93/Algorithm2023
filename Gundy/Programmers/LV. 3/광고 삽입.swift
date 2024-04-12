import Foundation

func convertToSecond(_ time: String) -> Int {
    let time = time.split(separator: ":").map(String.init).compactMap(Int.init)
    
    return time[0] * 3600 + time[1] * 60 + time[2]
}

func solution(_ play_time:String, _ adv_time:String, _ logs:[String]) -> String {
    guard play_time != adv_time else { return "00:00:00" }
    
    let playTime = convertToSecond(play_time)
    let advTime = convertToSecond(adv_time)
    var timeline = Array(repeating: 0, count: playTime+1)
    
    for log in logs {
        let times = log.split(separator: "-").map { convertToSecond(String($0)) }
        
        timeline[times[0]] += 1
        timeline[times[1]] -= 1
    }
    
    for index in 0..<playTime {
        timeline[index+1] += timeline[index]
    }
    
    var start = 0
    var partialSum = timeline[0..<advTime].reduce(0, +)
    var result = (0, partialSum)
    
    while start + advTime < playTime {
        partialSum -= timeline[start]
        partialSum += timeline[start + advTime]
        start += 1
        
        if result.1 < partialSum {
            result = (start, partialSum)
        }
    }
    
    var hour = String(result.0 / 3600)
    
    if hour.count == 1 {
        hour = "0" + hour
    }
    
    result.0 %= 3600
    
    var minute = String(result.0 / 60)
    
    if minute.count == 1 {
        minute = "0" + minute
    }
    
    result.0 %= 60
    
    var second = String(result.0)
    
    if second.count == 1 {
        second = "0" + second
    }
    
    return hour + ":" + minute + ":" + second
}
