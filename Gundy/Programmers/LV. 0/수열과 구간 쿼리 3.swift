func solution(_ arr:[Int], _ queries:[[Int]]) -> [Int] {
    var result = arr
    for query in queries {
        result.swapAt(query[0], query[1])
    }
    return result
}
