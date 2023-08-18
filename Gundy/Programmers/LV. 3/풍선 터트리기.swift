func solution(_ a:[Int]) -> Int {
    var result = 0
    var minimums = Array(repeating: [Int.max, Int.max], count: a.count)
    for index in 0...a.count - 2 {
        let balloon = a[index]
        minimums[index + 1][0] = min(minimums[index][0], balloon)
    }
    for index in stride(from: a.count - 1, to: 0, by: -1) {
        let balloon = a[index]
        minimums[index - 1][1] = min(minimums[index][1], balloon)
    }
    for index in 0...a.count - 1 {
        let balloon = a[index]
        switch index {
        case 0, a.count - 1:
            result += 1
        default:
            let leftMin = minimums[index][0]
            let rightMin = minimums[index][1]
            if (leftMin < balloon && rightMin < balloon) == false {
                result += 1
            }
        }
    }
    return result
}
