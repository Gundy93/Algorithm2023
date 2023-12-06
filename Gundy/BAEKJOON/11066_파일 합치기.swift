let count = Int(readLine()!)!
var result = String()

for _ in 1...count {
    let size = Int(readLine()!)!
    let numbers = readLine()!.split(separator: " ").map { Int($0)! }
    var prefixSum = [0] + numbers
    
    for index in 1...numbers.count {
        prefixSum[index] += prefixSum[index - 1]
    }
    
    var dp = Array(repeating: Array(repeating: Int.max / 2 - prefixSum.last!, count: size), count: size)
    
    for index in 0...size - 1 {
        dp[index][index] = 0
    }
    
    for length in 1...size - 1 {
        for start in 0...size - length - 1 {
            for point in start...start + length - 1 {
                dp[start][start + length] = min(dp[start][start + length], dp[start][point] + dp[point + 1][start + length] + prefixSum[start + length + 1] - prefixSum[start])
            }
        }
    }
    
    result += "\(dp[0][size - 1])\n"
}

print(result)
