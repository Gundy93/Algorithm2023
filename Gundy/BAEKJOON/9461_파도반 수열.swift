var dp = Array(repeating: 1, count: 101)
var index = 4

func pado(n number: Int) -> Int {
    guard number >= index else { return dp[number] }
    
    while index <= number {
        dp[index] = dp[index - 2] + dp[index - 3]
        index += 1
    }
    
    return dp[number]
}

let count = Int(readLine()!)!
var result = String()

for _ in 1...count {
    result += "\(pado(n: Int(readLine()!)!))\n"
}

print(result)
