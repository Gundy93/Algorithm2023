let size = Int(readLine()!)!
var stars = Array(repeating: Array(repeating: "*", count: size), count: size)

func removeCenter(at point: (Int, Int), size: Int) {
    let term = size / 3
    
    for row in point.0 + term..<point.0 + term * 2 {
        for column in point.1 + term..<point.1 + term * 2 {
            stars[row][column] = " "
        }
    }
    
    guard term > 1 else { return }
    
    for (deltaRow, deltaColumn) in [(0, 0), (0, term), (0, term * 2), (term, 0), (term, term * 2), (term * 2, 0), (term * 2, term), (term * 2 , term * 2)] {
        removeCenter(at: (point.0 + deltaRow, point.1 + deltaColumn), size: term)
    }
}

removeCenter(at: (0, 0), size: size)
print(stars.map { $0.joined() }.joined(separator: "\n"))
