let input = readLine()!.split(separator: " ").map{Int(String($0))!}
var coins = [Int]()

for _ in 0..<input[0]{
    let coin = Int(readLine()!)!
    
    guard coin <= input[1] else { continue }
    
    coins.append(coin)
}

var dp = Array(repeating: 0, count: input[1] + 1)

dp[0] = 1

for coin in coins {
    for index in coin..<input[1] + 1 {
        guard dp[index] < Int.max - dp[index - coin] else { continue }
        
        dp[index] += dp[index - coin]
    }
}

print(dp[input[1]])
