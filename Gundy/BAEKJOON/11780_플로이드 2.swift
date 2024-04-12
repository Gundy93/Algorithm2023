func solution() {
    let numberOfCities = Int(readLine()!)!
    let numberOfBuses = Int(readLine()!)!
    var costs = Array(
        repeating: Array(
            repeating: (Int.max, [Int]()),
            count: numberOfCities
        ), count: numberOfCities
    )

    for _ in 0..<numberOfBuses {
        let bus = readLine()!.split(separator: " ").map { Int($0)! }
        let (first, second, cost) = (bus[0] - 1, bus[1] - 1, bus[2])
        
        if costs[first][second].0 > cost {
            costs[first][second] = (cost, [first+1])
        }
    }

    for mid in 0..<numberOfCities {
        costs[mid][mid] = (0, [mid])
        
        for start in 0...numberOfCities - 1 where start != mid {
            guard costs[start][mid].0 < Int.max else { continue }
            
            for end in 0...numberOfCities - 1 where end != start {
                guard costs[mid][end].0 < Int.max else { continue }
                
                if costs[start][end].0 > costs[start][mid].0 + costs[mid][end].0 {
                    costs[start][end] = (costs[start][mid].0 + costs[mid][end].0, costs[start][mid].1 + costs[mid][end].1)
                }
            }
        }
    }
    
    var costText = ""
    var pathText = ""
    
    for city in costs {
        for (detination, (cost, path)) in city.enumerated() {
            costText += [0, Int.max].contains(cost) ? "0 " : String(cost) + " "
            pathText += [0, Int.max].contains(cost) ? "0\n" : ( [path.count+1] + path + [detination+1]).map(String.init).joined(separator: " ") + "\n"
        }
        
        costText += "\n"
    }
    
    print(costText + pathText)
}

solution()
