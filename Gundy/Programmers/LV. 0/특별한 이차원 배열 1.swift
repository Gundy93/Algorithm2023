func solution(_ n:Int) -> [[Int]] {
    var result = Array(repeating: Array(repeating: 0, count: n), count: n)
    for index in 0...n - 1 {
        result[index][index] = 1
    }
    return result
}
