let count = Int(readLine()!)!
var points = [(x: Int, y: Int)]()

for _ in 1...count {
    let point = readLine()!.split(separator: " ").map { Int($0)! }
    
    points.append((point[0], point[1]))
}

points.sort { left, right in
    return left.y == right.y ? left.x < right.x : left.y < right.y
}

for point in points {
    print(point.x, point.y)
}
