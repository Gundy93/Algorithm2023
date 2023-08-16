func solution(_ stones:[Int], _ k:Int) -> Int {
    var start = 1
    var end = 200000000
    while start < end {
        let mid = (start + end) / 2
        var count = 0
        for index in 0...stones.count - 1 {
            if stones[index] - mid <= 0 {
                count += 1
                if count == k {
                    break
                }
            } else {
                count = 0
            }
        }
        if count == k {
            end = mid
        } else {
            start = mid + 1
        }
    }
    return start
}
