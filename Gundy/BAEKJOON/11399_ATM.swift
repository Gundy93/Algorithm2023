let count = Int(readLine()!)!
let costs = readLine()!.split(separator: " ").map { Int($0)! }

print(costs.sorted(by: >).enumerated().reduce(0) { partialResult, cost in
    partialResult + cost.element * (cost.offset+1)
})
