let dueDay = Int(readLine()!)!
var consultings = [[Int]]()

for _ in 0..<dueDay {
    consultings.append(readLine()!.split(separator: " ").map { Int($0)! })
}

var dp = Array(repeating: 0, count: dueDay+1)

for day in 0..<dueDay {
    dp[day+1] = max(dp[day+1], dp[day])
    
    guard day + consultings[day][0] <= dueDay else { continue }
    
    dp[day + consultings[day][0]] = max(dp[day + consultings[day][0]], dp[day] + consultings[day][1])
}

print(dp.max()!)
