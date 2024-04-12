func solution() {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    let items = [0] + readLine()!.split(separator: " ").map { Int($0)! }
    var costs = Array(repeating: Array(repeating: Int.max, count: input[0]+1), count: input[0]+1)
    
    for _ in 0..<input[2] {
        let path = readLine()!.split(separator: " ").map { Int($0)! }
        
        costs[path[0]][path[1]] = min(costs[path[0]][path[1]], path[2])
        costs[path[1]][path[0]] = min(costs[path[1]][path[0]], path[2])
    }
    
    for mid in 1...input[0] {
        costs[mid][mid] = 0
        
        for start in 1...input[0] where costs[start][mid] != .max {
            for end in 1...input[0] where costs[mid][end] != .max {
                costs[start][end] = min(costs[start][end], costs[start][mid] + costs[mid][end])
            }
        }
    }
    
    var result = 0
    
    for start in 1...input[0] {
        var sum = 0
        
        for end in 1...input[0] where costs[start][end] <= input[1] {
            sum += items[end]
        }
        
        result = max(result, sum)
    }
    
    print(result)
}

solution()
