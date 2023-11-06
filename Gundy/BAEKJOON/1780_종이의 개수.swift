var papers = [[Int]]()

for _ in 1...Int(readLine()!)! {
    papers.append(readLine()!.split(separator: " ").compactMap({ Int($0) }))
}

let result = recursion(x: 0, y: 0, size: papers.count)
print(result.negative, result.zero, result.positive, separator: "\n")

func recursion(x: Int, y: Int, size: Int) -> (negative: Int, zero: Int, positive: Int) {
    guard size > 1 else {
        switch papers[x][y] {
        case -1:
            return (1, 0, 0)
        case 0:
            return (0, 1, 0)
        default:
            return (0, 0, 1)
        }
    }
    let xPoints = [x, x + size / 3, x + size / 3 * 2,
                   x, x + size / 3, x + size / 3 * 2,
                   x, x + size / 3, x + size / 3 * 2]
    let yPoints = [y, y, y,
                   y + size / 3, y + size / 3, y + size / 3,
                   y + size / 3 * 2, y + size / 3 * 2, y + size / 3 * 2]
    let result = zip(xPoints, yPoints).map({ recursion(x: $0.0, y: $0.1, size: size / 3) })
    if result[0].negative + result[0].zero + result[0].positive == 1,
       result.filter({ result[0] == $0 }).count == result.count {
        return result[0]
    } else {
        var partialResult = (0, 0, 0)
        result.forEach({
            partialResult.0 += $0.negative
            partialResult.1 += $0.zero
            partialResult.2 += $0.positive
        })
        return partialResult
    }
}
