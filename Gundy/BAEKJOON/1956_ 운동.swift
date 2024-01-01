let maxCost = Int.max / 2
let input = readLine()!.split(separator: " ").map { Int($0)! }
var roads = [(Int, Int, Int)]()

for _ in 1...input[1] {
    let road = readLine()!.split(separator: " ").map { Int($0)! }
    
    roads.append((road[0], road[1], road[2]))
}

var costs = Array(repeating: Array(repeating: maxCost, count: input[0] + 1), count: input[0] + 1)

for (start, end, cost) in roads {
    costs[start][end] = min(costs[start][end], cost)
}

for mid in 1...input[0] {
    for start in 1...input[0] {
        guard start != mid else { continue }
        
        for end in 1...input[0] {
            guard end != mid else { continue }
            
            costs[start][end] = min(costs[start][end], costs[start][mid] + costs[mid][end])
        }
    }
}

var result = maxCost

for city in 1...input[0] {
    result = min(result, costs[city][city])
}

print(result == maxCost ? -1 : result)
