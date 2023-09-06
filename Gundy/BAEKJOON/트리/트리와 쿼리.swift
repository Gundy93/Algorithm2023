let numbers = readLine()!.split(separator: " ").map(String.init).compactMap(Int.init)
let (numberOfNodes, root, query) = (numbers[0], numbers[1], numbers[2])
var links = [Int: Set<Int>]()
for _ in 1...numberOfNodes - 1 {
    let nodes = readLine()!.split(separator: " ").map(String.init).compactMap(Int.init)
    links[nodes[0], default: []].insert(nodes[1])
    links[nodes[1], default: []].insert(nodes[0])
}
var tree = [Int: Set<Int>]()
var needVisit: [(Int, Int?)] = [(root, nil)]
while needVisit.isEmpty == false {
    let current = needVisit.removeLast()
    for child in links[current.0, default: []] {
        guard child != current.1 else { continue }
        tree[current.0, default: []].insert(child)
        needVisit.append((child, current.0))
    }
}
var count = 0
var nodes = Array(repeating: 0, count: numberOfNodes + 1)
var stack = [root]
func recursion(_ node: Int) -> Int {
    guard let children = tree[node], children.isEmpty == false else {
        nodes[node] = 1
        return 1
    }
    var result = 1
    for child in children {
        result += recursion(child)
    }
    nodes[node] = result
    return result
}
let _ = recursion(root)
for _ in 1...query {
    let node = Int(readLine()!)!
    print(nodes[node])
}
