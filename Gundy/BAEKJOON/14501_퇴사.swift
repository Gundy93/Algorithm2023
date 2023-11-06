let days = Int(readLine()!)!
let quests: [[Int]] = {
    var quests = [[Int]]()

    for _ in 1...days {
        quests.append(readLine()!.split(separator: " ").compactMap({ Int($0) }))
    }

    return quests
}()
var points = [Int: Set<Int>]()

for currentDay in 0..<days {
    let dDay = currentDay + quests[currentDay][0]
    if dDay <= days {
        let currentPoint = points[currentDay, default: [0]].sorted().last!
        for day in dDay...days {
            points[day, default: []].insert(currentPoint + quests[currentDay][1])
        }
    }
}

print(points[days, default: [0]].sorted().last!)
