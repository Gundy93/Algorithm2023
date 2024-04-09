func solution() {
    let count = Int(readLine()!)!
    var planets = [(number: Int, x: Int, y: Int, z: Int)]()
    
    for index in 0..<count {
        let planet = readLine()!.split(separator: " ").map { Int($0)! }
        
        planets.append((index, planet[0], planet[1], planet[2]))
    }
    
    var links = [(Int, Int, Int)]()
    
    planets.sort { $0.x < $1.x }
    
    (0..<count-1).forEach {
        let left = planets[$0]
        let right = planets[$0+1]
        let cost = abs(left.x - right.x)
        
        links.append((left.number, right.number, cost))
    }
    
    planets.sort { $0.y < $1.y }
    
    (0..<count-1).forEach {
        let left = planets[$0]
        let right = planets[$0+1]
        let cost = abs(left.y - right.y)
        
        links.append((left.number, right.number, cost))
    }
    
    planets.sort { $0.z < $1.z }
    
    (0..<count-1).forEach {
        let left = planets[$0]
        let right = planets[$0+1]
        let cost = abs(left.z - right.z)
        
        links.append((left.number, right.number, cost))
    }
    
    links.sort { $0.2 < $1.2 }
    
    var parents = Array(0..<count)
    
    func root(_ node: Int) -> Int {
        let parent = parents[node]
        
        guard parent != node else { return node }
        
        parents[node] = root(parent)
        
        return parents[node]
    }
    
    var index = 0
    var size = 0
    var result = 0
    
    while index < links.count,
          size < count-1 {
        let link = links[index]
        let left = root(link.0)
        let right = root(link.1)
        
        index += 1
        
        guard left != right else { continue }
        
        parents[left] = right
        size += 1
        result += link.2
    }
    
    print(result)
}

solution()
