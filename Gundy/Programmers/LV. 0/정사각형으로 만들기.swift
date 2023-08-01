func solution(_ arr:[[Int]]) -> [[Int]] {
    var result = arr
    if result.count < result[0].count {
        result += Array(repeating: Array(repeating: 0, count: result[0].count), count: result[0].count - result.count)
    } else {
        result = result.map { $0 + Array(repeating: 0, count: result.count - result[0].count) }
    }
    return result
}
