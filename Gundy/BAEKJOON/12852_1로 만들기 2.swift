let target = Int(readLine()!)!
var dp = [[], [1]]

while dp.count <= target {
    let number = dp.count
    var value = dp[number - 1]
    
    if number % 2 == 0,
       value.count > dp[number / 2].count {
        value = dp[number / 2]
    }
    
    if number % 3 == 0,
       value.count > dp[number / 3].count {
        value = dp[number / 3]
    }
    
    dp.append(value + [number])
}

print("\(dp.last!.count - 1)\n\(dp.last!.reversed().map(String.init).joined(separator: " "))")
