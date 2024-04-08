import Foundation

func solution(_ n:Int, _ edge:[[Int]]) -> Int {
    var distances = Array(repeating: -1, count: n+1)
    var links = [Int : Set<Int>]()
    
    for edge in edge {
        links[edge[0], default: []].insert(edge[1])
        links[edge[1], default: []].insert(edge[0])
    }
    
    var queue = [(1, 0)]
    var index = 0
    
    while index < queue.count {
        let (node, distance) = queue[index]
        
        index += 1
        
        guard distances[node] == -1 else { continue }
        
        distances[node] = distance
        
        for next in links[node, default: []] {
            queue.append((next, distance+1))
        }
    }
    
    var result = 0
    var max = 0
    
    for node in 2...n {
        switch distances[node] {
        case ..<max:
            continue
        case max:
            result += 1
        default:
            result = 1
            max = distances[node]
        }
    }
    
    return result
}
