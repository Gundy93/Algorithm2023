import Foundation

func solution(_ edges:[[Int]]) -> [Int] {
    var next = [Int : [Int]]()
    var previous = [Int : [Int]]()
    
    for edge in edges {
        next[edge[0], default: []].append(edge[1])
        previous[edge[1], default: []].append(edge[0])
    }
    
    var donut = 0
    var bar = 0
    var eight = 0
    var points = Set<Int>()
    
    loop: for point in previous.keys {
        guard points.contains(point) == false else { continue }
        
        if next[point] == nil,
           previous[point] == nil {
            break
        }
        
        var visited = Set<Int>()
        var needVisit = [point]
        var isEight = false
        var isDonut = false
        
        while let current = needVisit.popLast() {
            
            if next[current, default: []].count > 1,
               points.contains(current) == false {
                points.insert(current)
                isEight = true
                break
            }
            
            if visited.contains(current) {
                points.insert(current)
                isDonut = true
                break
            }
            
            if points.contains(current) {
                continue loop
            }
            
            visited.insert(current)
            points.insert(current)
            needVisit += next[current, default: []]
        }
        
        if isEight {
            eight += 1
        } else if isDonut {
            donut += 1
        } else {
            bar += 1
        }
    }
    
    let start = next.keys.first { points.contains($0) == false && next[$0]!.count > 1 }!
    
    return [start, donut, bar, eight]
}
