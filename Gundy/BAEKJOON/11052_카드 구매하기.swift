let target = Int(readLine()!)!
var costs = [0] + readLine()!.split(separator: " ").map { Int($0)! }

for index in 2..<target + 1 {
    var maximum = costs[index]
    
    for number in 1...index/2 {
        maximum = max(maximum, costs[number] + costs[index - number])
    }
    
    costs[index] = maximum
}

print(costs[target])
