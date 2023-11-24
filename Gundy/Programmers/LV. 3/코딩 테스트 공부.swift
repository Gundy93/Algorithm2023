func solution(_ alp:Int, _ cop:Int, _ problems:[[Int]]) -> Int {
    var targetAlp = alp
    var targetCop = cop
    
    for problem in problems {
        targetAlp = max(targetAlp, problem[0])
        targetCop = max(targetCop, problem[1])
    }
    
    var dp = Array(repeating: Array(repeating: Int.max, count: targetCop + 2), count: targetAlp + 2)
    
    dp[alp][cop] = 0
    
    for row in stride(from: alp, through: targetAlp, by: 1) {
        for column in stride(from: cop, through: targetCop, by: 1) {
            dp[row + 1][column] = min(dp[row + 1][column], dp[row][column] + 1)
            dp[row][column + 1] = min(dp[row][column + 1], dp[row][column] + 1)
            
            for problem in problems {
                guard row >= problem[0],
                      column >= problem[1] else { continue }
                
                dp[min(row + problem[2], targetAlp)][min(column + problem[3], targetCop)] = min(dp[row][column] + problem[4], dp[min(row + problem[2], targetAlp)][min(column + problem[3], targetCop)])
            }
        }
    }
    
    return dp[targetAlp][targetCop]
}
