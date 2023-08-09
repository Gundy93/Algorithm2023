func solution(_ k:Int, _ ranges:[[Int]]) -> [Double] {
    var yValues = [k]
    var areas = [Double]()
    while let last = yValues.last, last != 1 {
        yValues.append(last % 2 == 0 ? last / 2 : last * 3 + 1)
        areas.append(Double(last + yValues.last!) / 2)
    }
    var result = [Double]()
    for range in ranges {
        if areas.count + range[1] == range[0] {
            result.append(0)
        } else if areas.count + range[1] < range[0] {
            result.append(-1)
        } else {
            result.append(areas[range[0]...areas.count - 1 + range[1]].reduce(0, +))
        }
    }
    return result
}
