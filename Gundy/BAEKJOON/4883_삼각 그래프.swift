var result = [String]()

while let input = readLine(),
      let count = Int(input),
      count != 0 {
    var dp = [[Int]]()
    
    for _ in 0..<count {
        dp.append(readLine()!.split(separator: " ").map { Int($0)! })
    }
    
    dp[0][0] = Int.max
    dp[0][2] += dp[0][1]
    
    for index in 1..<count {
        dp[index][0] += min(dp[index-1][0], dp[index-1][1])
        dp[index][1] += min(dp[index-1][0], dp[index-1][1], dp[index-1][2], dp[index][0])
        dp[index][2] += min(dp[index-1][1], dp[index-1][2], dp[index][1])
    }
    
    result.append(String(result.count+1) + ". " + String(dp[count-1][1]))
}

print(result.joined(separator: "\n"))
