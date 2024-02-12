let count = Int(readLine()!)!
let numbers = readLine()!.split(separator: " ").map { Int($0)! }
var dp = numbers

for right in 0..<count {
    for left in 0..<right {
        if numbers[left] < numbers[right] {
            dp[right] = max(dp[right], dp[left] + numbers[right])
        }
    }
}

print(dp.max()!)
