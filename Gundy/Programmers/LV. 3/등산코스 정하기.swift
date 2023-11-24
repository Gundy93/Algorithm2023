func solution(_ n:Int, _ paths:[[Int]], _ gates:[Int], _ summits:[Int]) -> [Int] {
    let gates = Set(gates)
    let summits = Set(summits)
    var links = [Int: [(point: Int, intensity: Int)]]()
    
    for path in paths {
        links[path[0], default: []].append((path[1], path[2]))
        links[path[1], default: []].append((path[0], path[2]))
    }
    
    var intensities = Array(repeating: Int.max, count: n + 1)
    
    for gate in gates {
        intensities[gate] = 0
        
        var needVisit = Set([gate])
        
        while needVisit.isEmpty == false {
            let current = needVisit.removeFirst()
            
            guard summits.contains(current) == false else { continue }
            
            for link in links[current, default: []] {
                let intensity = max(intensities[current], link.intensity)
                
                guard gates.contains(link.point) == false,
                      intensities[link.point] > intensity else { continue }
                
                intensities[link.point] = intensity
                needVisit.insert(link.point)
            }
        }
    }
    
    var result = [-1, Int.max]
    
    for summit in summits.sorted() {
        guard result[1] > intensities[summit] else { continue }
        
        result = [summit, intensities[summit]]
    }
    
    return result
}
