let size = Int(readLine()!)!
var screen = [[Character]]()

for _ in 1...size {
    screen.append(Array(readLine()!))
}

func compressImage(at point: (Int, Int), size: Int) -> String {
    let (row, column) = point
    
    guard size > 1 else { return String(screen[row][column]) }
    
    let halfSzie = size / 2
    let leftUp = compressImage(at: point, size: halfSzie)
    var isWholeImage = leftUp.count == 1
    var result = leftUp
    
    for (deltaRow, deltaColumn) in [(0, halfSzie), (halfSzie, 0), (halfSzie, halfSzie)] {
        let next = compressImage(at: (row + deltaRow, column + deltaColumn),
                                 size: halfSzie)
        
        if isWholeImage {
            isWholeImage = leftUp == next
        }
        
        result += next
    }
    
    return isWholeImage ? leftUp : "(\(result))"
}

print(compressImage(at: (0, 0), size: size))
