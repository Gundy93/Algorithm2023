import Foundation

func solution(_ n:Int, _ s:Int, _ a:Int, _ b:Int, _ fares:[[Int]]) -> Int {
    var dp = Array(repeating: Array(repeating: n*100000, count: n+1), count: n+1)
    
    for fare in fares {
        dp[fare[0]][fare[1]] = fare[2]
        dp[fare[1]][fare[0]] = fare[2]
    }
    
    for mid in 1...n {
        dp[mid][mid] = 0
        
        for start in 1...n where mid != start {
            for end in 1...n where mid != end && start != end {
                dp[start][end] = min(dp[start][end], dp[start][mid] + dp[mid][end])
            }
        }
    }
    
    var result = Int.max
    
    for mid in 1...n {
        result = min(result, dp[s][mid] + dp[mid][a] + dp[mid][b])
    }
    
    return result
}
