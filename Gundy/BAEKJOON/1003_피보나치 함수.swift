let count = Int(readLine()!)!
var dp = [(1, 0), (0, 1)]
var result = String()

(0..<count)
    .forEach { _ in
        let index = Int(readLine()!)!
        
        guard dp.count <= index else {
            result += "\(dp[index].0) \(dp[index].1)\n"
            
            return
        }
        
        while dp.count <= index {
            let first = dp[dp.count - 2]
            let second = dp[dp.count - 1]
            dp.append((first.0 + second.0, first.1 + second.1))
        }
        
        result += "\(dp[index].0) \(dp[index].1)\n"
    }

print(result)
