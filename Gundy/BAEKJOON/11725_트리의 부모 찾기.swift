let count = Int(readLine()!)!
var links = [Int : Set<Int>]()

for _ in 0..<count-1 {
    let nodes = readLine()!.split(separator: " ").map { Int($0)! }
    
    links[nodes[0], default: []].insert(nodes[1])
    links[nodes[1], default: []].insert(nodes[0])
}

var parents = Array(repeating: 0, count: count+1)
var nodes = [1]
var index = 0

parents[1] = 1

while index < nodes.count {
    let node = nodes[index]
    
    index += 1
    
    for next in links[node, default: []] {
        guard parents[next] == 0 else { continue }
        
        nodes.append(next)
        parents[next] = node
    }
}

print((2...count).map { String(parents[$0]) }.joined(separator: "\n"))
