let numberOfMarbles = Int(readLine()!)!
var minX = Int.max
var maxX = Int.min
var minY = Int.max
var maxY = Int.min

for _ in 1...numberOfMarbles {
    let point = readLine()!.split(separator: " ").compactMap { Int($0) }
    
    minX = min(point[0], minX)
    maxX = max(point[0], maxX)
    minY = min(point[1], minY)
    maxY = max(point[1], maxY)
}

print((maxX - minX) * (maxY - minY))
