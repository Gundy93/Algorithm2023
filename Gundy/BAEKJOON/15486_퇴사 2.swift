let dueDay = Int(readLine()!)!
var consultings = [[Int]]()

for _ in 0..<dueDay {
    consultings.append(readLine()!.split(separator: " ").map { Int($0)! })
}

var dp = Array(repeating: 0, count: dueDay+1)
var result = 0

for day in 0..<dueDay {
    let completedDay = day + consultings[day][0]
    
    dp[day+1] = max(dp[day+1], dp[day])
    
    guard completedDay <= dueDay else { continue }
    
    dp[completedDay] = max(dp[completedDay], dp[day] + consultings[day][1])
    result = max(result, dp[completedDay])
}

print(result)
