let input = readLine()!.split(separator: " ").map { Int($0)! }
let count = input[0]
let limit = input[1]
var weights = [0]
var values = [0]

for _ in 1...count {
    let item = readLine()!.split(separator: " ").map { Int($0)! }
    
    weights.append(item[0])
    values.append(item[1])
}

var dp = Array(repeating: 0, count: limit + 1)

for index in 1...count {
    for weight in stride(from: limit, to: 0, by: -1) {
        if weight >= weights[index] {
            dp[weight] = max(dp[weight], dp[weight - weights[index]] + values[index])
        }
    }
}

print(dp.max()!)
