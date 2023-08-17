func solution(_ n:Int, _ times:[Int]) -> Int64 {
    var start = 1
    var end = Int.max - 1
    while start < end {
        let half = (start + end) / 2
        var count = 0
        for time in times {
            count += half / time
            if count >= n {
                break
            }
        }
        if count >= n {
            end = half
        } else {
            start = half + 1
        }
    }
    return Int64(start)
}
