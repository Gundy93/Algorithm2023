enum Direction {
    case leftDown
    case right
    case leftUp
    
    var next: Direction {
        switch self {
        case .leftDown:
            return .right
        case .right:
            return .leftUp
        case .leftUp:
            return .leftDown
        }
    }
    
    func nextPoint(row: Int, column: Int) -> (Int, Int) {
        switch self {
        case .leftDown:
            return (row+1, column)
        case .right:
            return (row, column+1)
        case .leftUp:
            return (row-1, column-1)
        }
    }
}

func solution(_ n:Int) -> [Int] {
    var snail = (1...n).map { Array(repeating: 0, count: $0) }
    var direction = Direction.leftDown
    
    func recursion(_ number: Int, _ row: Int, _ column: Int) {
        snail[row][column] = number
        
        let originDirection = direction
        var next = direction.nextPoint(row: row, column: column)
        
        while (0..<n ~= next.0 && 0...next.0 ~= next.1) == false ||
                snail[next.0][next.1] != 0 {
            direction = direction.next
            next = direction.nextPoint(row: row, column: column)
            
            if direction == originDirection { return }
        }
        
        recursion(number+1, next.0, next.1)
    }
    
    recursion(1, 0, 0)
    
    return snail.flatMap { $0 }
}
