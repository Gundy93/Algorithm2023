let input = readLine()!.split(separator: " ").map { Int($0)! }
var links = [Int : [(Int, Int)]]()

for _ in 1..<input[0] {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    
    links[input[0], default: []].append((input[1], input[2]))
    links[input[1], default: []].append((input[0], input[2]))
}

var dp = Array(
    repeating: Array(
        repeating: Int.max,
        count: input[0]+1
    ),
    count: input[0]+1
)

for start in 1...input[0] {
    var needVisit = [(start, 0)]
    
    while let (node, distance) = needVisit.popLast() {
        guard dp[start][node] > distance else { continue }
        
        dp[start][node] = distance
        
        for next in links[node]! {
            needVisit.append((next.0, distance + next.1))
        }
    }
}

var result = ""

for _ in 0..<input[1] {
    let nodes = readLine()!.split(separator: " ").map { Int($0)! }
    
    result += String(dp[nodes[0]][nodes[1]]) + "\n"
}

print(result)
