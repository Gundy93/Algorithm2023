let input = readLine()!.split(separator: " ").map { Int($0)! }
var links = [Int: Set<Int>]()

for _ in 1...input[1] {
    let link = readLine()!.split(separator: " ").map { Int($0)! }
    
    links[link[0], default: []].insert(link[1])
    links[link[1], default: []].insert(link[0])
}

var visited = Array(repeating: "0", count: input[0])
var count = 1

func dfs(_ node: Int) {
    visited[node - 1] = String(count)
    count += 1
    
    for next in links[node, default: []].sorted() {
        guard visited[next - 1] == "0" else { continue }
        
        dfs(next)
    }
}

dfs(input[2])

print(visited.joined(separator: "\n"))
