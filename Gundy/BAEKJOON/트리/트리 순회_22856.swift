let numberOfNodes = Int(readLine()!)!
var nodes: [(Int?, Int?)] = Array(repeating: (nil, nil), count: numberOfNodes + 1)
for _ in 1...numberOfNodes {
    let node = readLine()!.split(separator: " ").map(String.init).compactMap(Int.init)
    nodes[node[0]].0 = node[1] == -1 ? nil : node[1]
    nodes[node[0]].1 = node[2] == -1 ? nil : node[2]
}
var result = 0
func recursion(_ node: Int, _ isLeft: Bool) {
    if nodes[node].0 == nil, nodes[node].1 == nil {
        return
    }
    if let left = nodes[node].0 {
        recursion(left, isLeft)
        result += 2
    }
    if let right = nodes[node].1 {
        recursion(right, isLeft)
        result += isLeft ? 2 : 1
    }
}
if let left = nodes[1].0 {
    recursion(left, true)
    result += 2
}
if let right = nodes[1].1 {
    recursion(right, false)
    result += 1
}
print(result)
