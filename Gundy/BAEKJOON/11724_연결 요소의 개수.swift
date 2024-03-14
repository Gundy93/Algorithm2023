let input = readLine()!.split(separator: " ").map { Int($0)! }
var links = [Int : [Int]]()

for _ in 0..<input[1] {
    let link = readLine()!.split(separator: " ").map { Int($0)! }
    
    links[link[0], default: []].append(link[1])
    links[link[1], default: []].append(link[0])
}

var visited = Array(repeating: false, count: input[0]+1)
var result = 0

for node in 1...input[0] {
    guard visited[node] == false else { continue }
    
    var nodes = [node]
    
    while let last = nodes.popLast() {
        guard visited[last] == false else { continue }
        
        visited[last] = true
        nodes += links[last, default: []]
    }
    
    result += 1
}

print(result)
