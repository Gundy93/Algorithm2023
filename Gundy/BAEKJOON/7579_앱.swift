let input = readLine()!.split(separator: " ").map { Int($0)! }
let memories = readLine()!.split(separator: " ").map { Int($0)! }
let costs = readLine()!.split(separator: " ").map { Int($0)! }
let maximum = costs.reduce(0, +)
var dp = Array(repeating: 0, count: maximum + 1)

for index in 0...input[0] - 1 {
    for cost in stride(from: maximum, through: costs[index], by: -1) {
        dp[cost] = max(dp[cost], dp[cost - costs[index]] + memories[index])
    }
}

var start = 0
var end = maximum

while start < end {
    let mid = (start + end) / 2
    
    if dp[mid] >= input[1] {
        end = mid
    } else {
        start = mid + 1
    }
}

print(start)
