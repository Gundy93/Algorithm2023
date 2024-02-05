let count = Int(readLine()!)!
var result = ""

for _ in 0..<count {
    let length = Int(readLine()!)!
    let stickers = readLine()!.split(separator: " ").map { Int($0)! } + readLine()!.split(separator: " ").map { Int($0)! }
    var dp = Array(repeating: (0,0), count: length + 2)
    
    for index in 0..<length {
        let maxValue = max(dp[index].0, dp[index].1)
        
        dp[index+2].0 = max(maxValue, dp[index+1].1) + stickers[index]
        dp[index+2].1 = max(maxValue, dp[index+1].0) + stickers[index+length]
    }
    
    result += String(max(dp[length+1].0, dp[length+1].1)) + "\n"
}

print(result)
