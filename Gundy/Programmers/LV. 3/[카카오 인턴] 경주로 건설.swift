enum Direction: CaseIterable {
    case up
    case down
    case left
    case right
    
    var nextRow: Int {
        switch self {
        case .up:
            return -1
        case .down:
            return 1
        case .left:
            return 0
        case .right:
            return 0
        }
    }
    var nextcolumn: Int {
        switch self {
        case .up:
            return 0
        case .down:
            return 0
        case .left:
            return -1
        case .right:
            return 1
        }
    }
    var reversed: Direction {
        switch self {
        case .up:
            return .down
        case .down:
            return .up
        case .left:
            return .right
        case .right:
            return .left
        }
    }
}

func solution(_ board:[[Int]]) -> Int {
    var costs: [[[Direction: Int]]] = Array(repeating: Array(repeating: [:], count: board.count), count: board.count)
    
    for direction in Direction.allCases {
        costs[0][0][direction] = 0
    }
    
    func calculateCost(_ current: Direction?, _ next: Direction) -> Int {
        guard current != next else { return 100 }
        
        switch (current, next) {
        case (nil, _):
            return 100
        default:
            return 600
        }
    }
    
    var needVisit = Set([[0, 0]])
    
    while needVisit.isEmpty == false {
        let current = needVisit.removeFirst()
        let row = current[0]
        let column = current[1]
        
        guard current != [board.count - 1, board.count - 1] else { continue }
        
        for direction in Direction.allCases {
            let nextRow = row + direction.nextRow
            let nextColumn = column + direction.nextcolumn
            
            guard (nextRow == 0 && nextColumn == 0) == false,
                  nextRow >= 0, nextRow < board.count,
                  nextColumn >= 0, nextColumn < board.count,
                  board[nextRow][nextColumn] == 0 else { continue }
            
            let newCost = Direction.allCases.map { costs[row][column][$0, default: 375000] + calculateCost($0, direction) }.min()!
            
            guard newCost < costs[nextRow][nextColumn][direction, default: 375000] else { continue }
            
            costs[nextRow][nextColumn][direction] = newCost
            needVisit.insert([nextRow, nextColumn])
        }
    }
    
    return Direction.allCases.compactMap { costs[board.count - 1][board.count - 1][$0] }.min()!
}
