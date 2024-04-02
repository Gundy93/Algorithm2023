import Foundation

func solution(_ n:Int, _ roads:[[Int]], _ sources:[Int], _ destination:Int) -> [Int] {
    var dp = Array(repeating: Int.max, count: n+1)
    var next = [Int : [Int]]()
    
    for road in roads {
        next[road[0], default: []].append(road[1])
        next[road[1], default: []].append(road[0])
    }
    
    var queue = [(destination, 0)]
    var index = 0

    while index < queue.count {
        let (location, distance) = queue[index]
        
        index += 1
        
        guard distance < dp[location] else { continue }

        dp[location] = distance

        for next in next[location, default: []] {
            queue.append((next, distance+1))
        }
    }
    
    return sources.map { dp[$0] == Int.max ? -1 : dp[$0] }
}
