func solution() {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    var links = [Int : Set<Int>]()
    
    for _ in 0..<input[1] {
        let link = readLine()!.split(separator: " ").map { Int($0)! }
        
        links[link[0], default: []].insert(link[1])
        links[link[1], default: []].insert(link[0])
    }
    
    var visited = Array(repeating: false, count: input[0]+1)
    var result = -1
    
    for node in 1...input[0] where visited[node] == false {
        result += 1
        
        var stack = [(node, node)]
        
        while let (current, previous) = stack.popLast() {
            guard visited[current] == false else { continue }
            
            visited[current] = true
            
            for next in links[current, default: []] {
                if visited[next] == false {
                    stack.append((next, current))
                } else if next != previous {
                    result += 1
                    links[current]?.remove(next)
                    links[next]?.remove(current)
                }
            }
        }
    }
    
    print(result)
}

solution()
