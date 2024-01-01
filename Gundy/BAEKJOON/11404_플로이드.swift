let maxCost = Int.max / 2
let numberOfCities = Int(readLine()!)!
let count = Int(readLine()!)!
var buses = [(Int, Int, Int)]()

for _ in 1...count {
    let bus = readLine()!.split(separator: " ").map { Int($0)! }
    
    buses.append((bus[0], bus[1], bus[2]))
}

var costs = Array(repeating: Array(repeating: maxCost, count: numberOfCities + 1), count: numberOfCities + 1)

for city in 1...numberOfCities {
    costs[city][city] = 0
}

for (start, end, cost) in buses {
    costs[start][end] = min(costs[start][end], cost)
}

for mid in 1...numberOfCities {
    for start in 1...numberOfCities {
        guard start != mid else { continue }
        
        for end in 1...numberOfCities {
            guard end != start else { continue }
            
            costs[start][end] = min(costs[start][end], costs[start][mid] + costs[mid][end])
        }
    }
}

var result = String()

for city in 1...numberOfCities {
    result += costs[city][1...numberOfCities].map { $0 == maxCost ? "0" : String($0) }.joined(separator: " ") + "\n"
}

print(result)
