let number = Int(readLine()!)!
var nodes = Array(repeating: Set<Int>(), count: number + 1)
for _ in 1...number - 1 {
    let link = readLine()!.split(separator: " ").map(String.init).compactMap(Int.init)
    nodes[link[0]].insert(link[1])
    nodes[link[1]].insert(link[0])
}
var parent = Array(repeating: 0, count: number + 1)
var visited = Set<Int>()
var needVisit = nodes[1].map({ ($0, 1) })
while needVisit.isEmpty == false {
    let now = needVisit.removeLast()
    guard visited.contains(now.0) == false else { continue }
    visited.insert(now.0)
    parent[now.0] = now.1
    needVisit += nodes[now.0].map({ ($0, now.0) })
}
for node in 2...number {
    print(parent[node])
}
