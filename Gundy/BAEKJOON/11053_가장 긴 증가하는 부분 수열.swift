let count = Int(readLine()!)!
let numbers = readLine()!.split(separator: " ").map { Int($0)! }
var dp = numbers.map { [$0] }

for right in 0..<count {
    for left in 0..<right {
        if numbers[left] < numbers[right],
           dp[right].count < dp[left].count + 1 {
            dp[right] = dp[left] + [numbers[right]]
        }
    }
}

print(dp.map { $0.count }.max()!)
