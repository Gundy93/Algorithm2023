let input = readLine()!.split(separator: " ").map(String.init).compactMap(Int.init)
let (numberOfNodes, numberOfquerys) = (input[0], input[1])
var distances: [[Int?]] = Array(repeating: Array(repeating: nil, count: numberOfNodes + 1), count: numberOfNodes + 1)
var links = Array(repeating: Set<Int>(), count: numberOfNodes + 1)
for node in 1...numberOfNodes {
    distances[node][node] = 0
}
for _ in 1...numberOfNodes - 1 {
    let command = readLine()!.split(separator: " ").map(String.init).compactMap(Int.init)
    distances[command[0]][command[1]] = command[2]
    distances[command[1]][command[0]] = command[2]
    links[command[0]].insert(command[1])
    links[command[1]].insert(command[0])
}
func recursion(_ start: Int, _ before: Int, _ now: Int, _ distance: Int) {
    if distances[start][now] == nil {
        distances[start][now] = distance
        distances[now][start] = distance
    }
    for next in links[now] {
        guard next != before else { continue }
        recursion(start, now, next, distance + distances[now][next]!)
    }
}
for start in 1...numberOfNodes {
    recursion(start, start, start, 0)
}
for _ in 1...numberOfquerys {
    let numbers = readLine()!.split(separator: " ").map(String.init).compactMap(Int.init)
    print(distances[numbers[0]][numbers[1]]!)
}
