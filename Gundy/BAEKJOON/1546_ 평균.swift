let _ = readLine()
var points = readLine()!.split(separator: " ").compactMap { Double($0) }
let max = points.max()!

points.enumerated().forEach { value in
    points[value.offset] = value.element / max * 100
}
print(points.reduce(0, +) / Double(points.count))
