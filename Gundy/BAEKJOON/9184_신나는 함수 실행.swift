var dp = Array(repeating: Array(repeating: Array(repeating: 1, count: 21), count: 21), count: 21)

func w(a: Int, b: Int, c: Int) {
    guard a > 0, b > 0, c > 0 else { return }
    
    guard a <= 20, b <= 20, c <= 20 else {
        w(a: 20, b: 20, c: 20)
        
        return
    }
    
    guard dp[a][b][c] == 1 else { return }
    
    if a < b, b < c {
        w(a: a, b: b, c: c - 1)
        w(a: a, b: b - 1, c: c - 1)
        w(a: a, b: b - 1, c: c)
        dp[a][b][c] = dp[a][b][c - 1] + dp[a][b - 1][c - 1] - dp[a][b - 1][c]
    } else {
        w(a: a - 1, b: b, c: c)
        w(a: a - 1, b: b - 1, c: c)
        w(a: a - 1, b: b, c: c - 1)
        w(a: a - 1, b: b - 1, c: c - 1)
        dp[a][b][c] = dp[a - 1][b][c] + dp[a - 1][b - 1][c] + dp[a - 1][b][c - 1] - dp[a - 1][b - 1][c - 1]
    }
}

var result = String()

while let input = readLine(),
      input != "-1 -1 -1" {
    let numbers = input.split(separator: " ").map { Int($0)! }
    let (a, b, c) = (numbers[0], numbers[1], numbers[2])
    var wResult = 0
    
    w(a: a, b: b, c: c)
    
    if a <= 0 || b <= 0 || c <= 0 {
        wResult = 1
    } else if a > 20 || b > 20 || c > 20 {
        wResult = dp[20][20][20]
    } else {
        wResult = dp[a][b][c]
    }
    result += "w(\(a), \(b), \(c)) = \(wResult)\n"
}

print(result)
