func solution(_ a:Int, _ b:Int, _ g:[Int], _ s:[Int], _ w:[Int], _ t:[Int]) -> Int64 {
    var start = 0
    var end = 10000000000000000
    while start < end {
        let half = (start + end) / 2
        var canGoldWeight = 0
        var canSilverWeight = 0
        var canUseWeight = 0
        for index in 0...g.count - 1 {
            let truck = w[index]
            let count = (half / t[index] + 1) / 2
            let weight = truck * count
            canGoldWeight += min(g[index], weight)
            canSilverWeight += min(s[index], weight)
            canUseWeight += min(g[index] + s[index], weight)
            if canGoldWeight >= a, canSilverWeight >= b, canUseWeight >= a + b {
                break
            }
        }
        if canGoldWeight >= a, canSilverWeight >= b, canUseWeight >= a + b {
            end = half
        } else {
            start = half + 1
        }
    }
    return Int64(start)
}
