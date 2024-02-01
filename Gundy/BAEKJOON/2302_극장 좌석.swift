let n = Int(readLine()!)!
let count = Int(readLine()!)!
var fixed = [0]
var dp = [1,1,2,3,5,8]
var index = 6

for _ in 0..<count {
    fixed.append(Int(readLine()!)!)
}

fixed.append(n+1)

func countWays(for number: Int) -> Int {
    while index <= number {
        dp.append(dp[index - 2] + dp[index - 1])
        index += 1
    }
    
    return dp[number]
}

var result = 1

for index in 0...count {
    result *= countWays(for: fixed[index + 1] - fixed[index] - 1)
}

print(result)
