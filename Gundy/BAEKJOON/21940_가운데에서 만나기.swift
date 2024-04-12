func solution() {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    var times = Array(repeating: Array(repeating: Int.max, count: input[0]+1), count: input[0]+1)
    
    for _ in 0..<input[1] {
        let road = readLine()!.split(separator: " ").map { Int($0)! }
        
        times[road[0]][road[1]] = min(times[road[0]][road[1]], road[2])
    }
    
    for mid in 1...input[0] {
        times[mid][mid] = 0
        
        for start in 1...input[0] where times[start][mid] != .max {
            for end in 1...input[0] where times[mid][end] != .max {
                times[start][end] = min(times[start][end], times[start][mid] + times[mid][end])
            }
        }
    }
    
    _ = readLine()
    let friends = readLine()!.split(separator: " ").map { Int($0)! }
    var result = (Int.max, [Int]())
    
    for city in 1...input[0] {
        var maximum = 0
        
        for friend in friends {
            maximum = max(maximum, times[friend][city] + times[city][friend])
        }
        
        switch maximum {
        case ..<result.0:
            result = (maximum, [city])
        case result.0:
            result.1.append(city)
        default:
            break
        }
    }
    
    print(result.1.map(String.init).joined(separator: " "))
}

solution()
