func solution(_ s:String) -> Int {
    let words = Array(s)
    var result = 1
    for start in 0...words.count - 1 {
        if words.count - start < result {
            break
        }
        for length in stride(from: words.count - start, to: 1, by: -1) {
            var left = start
            var right = start + length - 1
            while words[left] == words[right], left <= right {
                left += 1
                right -= 1
            }
            if left > right, result < length { result = length }
        }
    }
    return result
}
