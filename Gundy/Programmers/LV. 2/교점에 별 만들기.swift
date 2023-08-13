func solution(_ line:[[Int]]) -> [String] {
    var points = [Int: [Int]]()
    var minimumX = Int.max
    var maximumX = Int.min
    var minimumY = Int.max
    var maximumY = Int.min
    for index in 0...line.count - 2 {
        let origin = line[index]
        let (a, b, e) = (origin[0], origin[1], origin[2])
        for other in index + 1...line.count - 1 {
            let target = line[other]
            let (c, d, f) = (target[0], target[1], target[2])
            guard a * d - b * c != 0 else { continue }
            let numeratorX = b * f - e * d
            let numeratorY = e * c - a * f
            let denominator = a * d - b * c
            let x = numeratorX / denominator
            let y = numeratorY / denominator
            guard Double(numeratorX) / Double(denominator) == Double(x), Double(numeratorY) / Double(denominator) == Double(y) else { continue }
            points[y, default: []].append(x)
            if x < minimumX {
                minimumX = x
            }
            if x > maximumX {
                maximumX = x
            }
            if y < minimumY {
                minimumY = y
            }
            if y > maximumY {
                maximumY = y
            }
        }
    }
    var result = Array(repeating: Array(repeating: ".", count: maximumX - minimumX + 1), count: maximumY - minimumY + 1)
    for y in points.keys.sorted() {
        let xs = points[y]!
        for x in xs {
            result[maximumY - y][x - minimumX] = "*"
        }
    }
    return result.map { $0.joined() }
}
