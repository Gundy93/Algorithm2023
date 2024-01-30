let count = Int(readLine()!)!
let (red,green,blue) = (0,1,2)
var costs = [[Int]]()

for _ in 0..<count {
    costs.append(readLine()!.split(separator: " ").map { Int($0)! })
}

var dp = costs

for index in 1..<count {
    dp[index][red] += min(dp[index-1][green], dp[index-1][blue])
    dp[index][green] += min(dp[index-1][red], dp[index-1][blue])
    dp[index][blue] += min(dp[index-1][red], dp[index-1][green])
}

print(dp.last!.min()!)
