func solution() {
    let numberOfCities = Int(readLine()!)!
    let numberOfBuses = Int(readLine()!)!
    var costs = Array(
        repeating: Array(
            repeating: Int.max,
            count: numberOfCities
        ), count: numberOfCities
    )

    for _ in 0..<numberOfBuses {
        let bus = readLine()!.split(separator: " ").map { Int($0)! }
        let (first, second, cost) = (bus[0] - 1, bus[1] - 1, bus[2])
        
        costs[first][second] = min(costs[first][second], cost)
    }

    for mid in 0..<numberOfCities {
        costs[mid][mid] = 0
        
        for start in 0...numberOfCities - 1 where start != mid {
            guard costs[start][mid] < Int.max else { continue }
            
            for end in 0...numberOfCities - 1 where end != start {
                guard costs[mid][end] < Int.max else { continue }
                
                costs[start][end] = min(costs[start][end], costs[start][mid] + costs[mid][end])
            }
        }
    }

    print(costs.map { $0.map { $0 == .max ? "0" : String($0) }.joined(separator: " ") }.joined(separator: "\n"))
}

solution()
