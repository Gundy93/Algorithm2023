let input = readLine()!.split(separator: " ").map { Int($0)! }
var links = [Int : Set<Int>]()

for _ in 0..<input[1] {
    let link = readLine()!.split(separator: " ").map { Int($0)! }
    
    links[link[0], default: []].insert(link[1])
    links[link[1], default: []].insert(link[0])
}

var result = Array(repeating: [String](), count: 2)
var visited = Array(repeating: false, count: input[0]+1)
var nodes = [input[2]]

while let last = nodes.popLast() {
    guard visited[last] == false else { continue }
    
    visited[last] = true
    result[0].append(String(last))
    nodes += links[last, default: []].sorted(by: >)
}

visited = Array(repeating: false, count: input[0]+1)
nodes = [input[2]]
var index = 0

while index < nodes.count {
    let node = nodes[index]
    index += 1
    
    guard visited[node] == false else { continue }
    
    visited[node] = true
    result[1].append(String(node))
    nodes += links[node, default: []].sorted()
}

print(result.map { $0.joined(separator: " ") }.joined(separator: "\n"))
