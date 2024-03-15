let count = Int(readLine()!)!
var canMove = [[Bool]]()

for _ in 0..<count {
    canMove.append(readLine()!.split(separator: " ").map { $0 == "1" })
}

var result = Array(repeating: Array(repeating: "0", count: count), count: count)

for number in 0..<count {
    var visited = Set<Int>()
    var points = (0..<count).filter { canMove[number][$0] }
    
    while let point = points.popLast() {
        guard visited.contains(point) == false else { continue }
        
        visited.insert(point)
        points += (0..<count).filter { canMove[point][$0] }
    }
    
    visited.forEach { result[number][$0] = "1" }
}

print(result.map { $0.joined(separator: " ") }.joined(separator: "\n"))
