let length = Int(readLine()!)!
var paper = [[Int]]()

for _ in 1...length {
    paper.append(readLine()!.split(separator: " ").map { Int($0)! })
}

func cutPaper(at point: (Int, Int), size: Int) -> (white: Int, blue: Int) {
    let (row, column) = point
    
    guard size > 1 else { return paper[row][column] == 0 ? (1, 0) : (0, 1) }
    
    let halfSize = size / 2
    let leftUp = cutPaper(at: point, size: halfSize)
    var isWholePaper = leftUp.white + leftUp.blue == 1
    var count = leftUp
    
    for (deltaRow, deltaColumn) in [(0, halfSize), (halfSize, 0), (halfSize, halfSize)] {
        let nextRow = row + deltaRow
        let nextColumn = column + deltaColumn
        let next = cutPaper(at: (nextRow, nextColumn), size: halfSize)
        
        if isWholePaper {
            isWholePaper = leftUp == next
        }
        
        count.white += next.white
        count.blue += next.blue
    }
    
    return isWholePaper ? leftUp : count
}

let result = cutPaper(at: (0, 0), size: length)

print("\(result.white)\n\(result.blue)")
