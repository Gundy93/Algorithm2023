let input = readLine()!.split(separator: " ").map { Int($0)! }
var links = [Int: Set<Int>]()

for _ in stride(from: 1, through: input[1], by: 1) {
    let link = readLine()!.split(separator: " ").map { Int($0)! }
    
    links[link[0], default: []].insert(link[1])
    links[link[1], default: []].insert(link[0])
}

func dfs(_ node: Int) -> String {
    var visited = [Int]()
    var stack = [node]
    
    while let current = stack.popLast() {
        guard visited.contains(current) == false else { continue }
        
        visited.append(current)
        
        for node in links[current, default: []].sorted(by: >) {
            stack.append(node)
        }
    }
    
    return visited.map(String.init).joined(separator: " ")
}

func bfs(_ node: Int) -> String {
    var visited = [Int]()
    var queue = [node]
    var index = 0
    
    while queue.count > index {
        let current = queue[index]
        
        index += 1
        
        guard visited.contains(current) == false else { continue }
        
        visited.append(current)
        
        for node in links[current, default: []].sorted() {
            queue.append(node)
        }
    }
    
    return visited.map(String.init).joined(separator: " ")
}

print("\(dfs(input[2]))\n\(bfs(input[2]))")
