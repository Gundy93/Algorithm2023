func solution(_ n:Int, _ weak:[Int], _ dist:[Int]) -> Int {
    var weaks = Array(repeating: false, count: n * 2)
    let dist = dist.sorted(by: >)
    for index in weak {
        weaks[index] = true
        weaks[index + n] = true
    }
    var start = 0
    var end = 0
    var log = [Int: [Int]]()
    var minimum = weaks.count
    var count = weaks[0] ? 1 : 0
    var result = Int.max
    while start <= end {
        while end < n * 2 - 1, count < weak.count {
            end += 1
            if weaks[end] {
                count += 1
            }
        }
        if count == weak.count {
            log[end - start, default: []].append(start)
            if minimum > end - start {
                minimum = end - start
            }
        }
        if weaks[start] {
            count -= 1
        }
        start += 1
    }
    func recursion(_ index: Int, _ count: Int, _ numbers: [Int]) {
        guard count < weak.count else {
            result = min(result, numbers.count)
            return
        }
        var index = index
        var number = numbers[numbers.count - 1]
        var count = count
        while weaks[index] == false {
            index += 1
        }
        let start = index
        while index < start + dist[number] + 1, count < weak.count {
            if weaks[index] {
                count += 1
            }
            index += 1
        }
        if count < weak.count {
            for next in 0...dist.count - 1 {
                guard numbers.contains(next) == false else { continue }
                recursion(index, count, numbers + [next])
            }
        } else {
            result = min(result, numbers.count)
        }
    }
    for startIndex in log[minimum]! {
        for number in 0...dist.count - 1 {
            recursion(startIndex, 0, [number])
        }
    }
    return result == Int.max ? -1 : result
}
