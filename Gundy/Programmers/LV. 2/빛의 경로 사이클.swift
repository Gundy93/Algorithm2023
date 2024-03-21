enum Direction: CaseIterable {
    case up
    case down
    case left
    case right
    
    var next: [Int] {
        switch self {
        case .up:
            return [-1, 0]
        case .down:
            return [1, 0]
        case .left:
            return [0, -1]
        case .right:
            return [0, 1]
        }
    }
    
    mutating func turn(_ isLeft: Bool) {
        switch self {
        case .up:
            self = isLeft ? .left : .right
        case .down:
            self = isLeft ? .right : .left
        case .left:
            self = isLeft ? .down : .up
        case .right:
            self = isLeft ? .up : .down
        }
    }
}

func solution(_ grid:[String]) -> [Int] {
    let grid = grid.map { $0.map(String.init) }
    var result = [Int]()
    var visited = [[Int]: Set<Direction>]()
    
    for row in 0..<grid.count {
        for column in 0..<grid[0].count {
            for direction in Direction.allCases {
                guard visited[[row, column], default: []].contains(direction) == false else { continue }
                
                visited[[row, column], default: []].insert(direction)
                
                var distance = 0
                var current = [row, column]
                var direction = direction
                
                while true {
                    distance += 1
                    
                    var row = current[0] + direction.next[0]
                    var column = current[1] + direction.next[1]
                    
                    if row < 0 {
                        row = grid.count - 1
                    } else if row == grid.count {
                        row = 0
                    }
                    
                    if column < 0 {
                        column = grid[0].count - 1
                    } else if column == grid[0].count {
                        column = 0
                    }
                    
                    current = [row, column]
                    
                    if grid[row][column] != "S" {
                        direction.turn(grid[row][column] == "L")
                    }
                    
                    guard visited[current, default: []].contains(direction) == false else { break }
                    
                    visited[current, default: []].insert(direction)
                }
                
                result.append(distance)
            }
        }
    }
    
    return result.sorted()
}
