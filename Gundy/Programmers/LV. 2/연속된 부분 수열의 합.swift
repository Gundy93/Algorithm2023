func solution(_ sequence:[Int], _ k:Int) -> [Int] {
    var start = 0
    var end = 0
    var total = sequence[0]
    guard total != k else { return [0, 0] }
    var result = [0, sequence.count - 1]
    while end < sequence.count - 1 {
        if total >= k, start < end {
            total -= sequence[start]
            start += 1
        } else {
            end += 1
            total += sequence[end]
        }
        if total == k, end - start < result[1] - result[0] {
            result = [start, end]
        }
    }
    while start < end, total >= k {
        total -= sequence[start]
        start += 1
        if total == k, end - start < result[1] - result[0] {
            result = [start, end]
        }
    }
    return result
}
