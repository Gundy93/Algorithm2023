func solution(_ n:Int, _ t:Int, _ m:Int, _ timetable:[String]) -> String {
    let isSlow: ([Int], [Int]) -> Bool = { $0[0] == $1[0] ? $0[1] >= $1[1] : $0[0] > $1[0] }
    var timetable = timetable.map({ $0.split(separator: ":").compactMap({ Int($0) }) }).sorted(by: isSlow)
    func makeTime(_ time: [Int]) -> String {
        let time = time.map(String.init)
        return "\(time[0].count == 1 ? "0" + time[0] : time[0]):\(time[1].count == 1 ? "0" + time[1] : time[1])"
    }
    var con = String()
    var number = 1
    var lastBus = [9, 0]
    var stack = [[Int]]()
    while number < n {
        while let last = timetable.last, stack.count < m {
            guard isSlow(lastBus, last) else { break }
            stack.append(timetable.removeLast())
        }
        stack.removeAll()
        number += 1
        lastBus[1] += t
        lastBus = [lastBus[0] + lastBus[1] / 60, lastBus[1] % 60]
    }
    while let last = timetable.last, stack.count < m {
        guard isSlow(lastBus, last) else { break }
        stack.append(timetable.removeLast())
    }
    if stack.count == m {
        var lastTime = stack.removeLast()
        lastTime[1] -= 1
        if lastTime[1] < 0 {
            lastTime[0] -= 1
            lastTime[1] += 60
        }
        con = makeTime(lastTime)
    } else {
        con = makeTime(lastBus)
    }
    return con
}
