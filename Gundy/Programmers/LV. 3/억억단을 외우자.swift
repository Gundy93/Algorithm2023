func solution(_ e:Int, _ starts:[Int]) -> [Int] {
    let minimum = starts.min()!
    var count = Array(repeating: 1, count: e + 1)
    for divisor in stride(from: 2, through: min(e / 2 + 2, e), by: 1) {
        for number in stride(from: minimum - minimum % divisor + divisor, through: e, by: divisor) {
            count[number] += 1
        }
    }
    var dp = Array(repeating: 0, count: e + 1)
    dp[e] = e
    for index in stride(from: e - 1, through: e / 2, by: -1) {
        dp[index] = count[index] < count[dp[index + 1]] ? dp[index + 1]: index
    }
    return starts.map { $0 < e / 2 ? dp[e / 2]: dp[$0] }
}
