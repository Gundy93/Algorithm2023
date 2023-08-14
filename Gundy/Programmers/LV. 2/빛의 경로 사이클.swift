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
}

enum Point: String {
    case S
    case L
    case R
    
    func switchDirection(_ direction: Direction) -> Direction {
        switch self {
        case .S:
            return direction
        default:
            switch direction {
            case .up:
                return self == .L ? .left : .right
            case .down:
                return self == .L ? .right : .left
            case .left:
                return self == .L ? .down : .up
            case .right:
                return self == .L ? .up : .down
            }
        }
    }
}

func solution(_ grid:[String]) -> [Int] {
    let grid = grid.map { $0.map(String.init) }
    var result = [Int]()
    var visited = [[Int]: Set<Direction>]()
    for row in 0...grid.count - 1 {
        for column in 0...grid[0].count - 1 {
            for direction in Direction.allCases {
                guard visited[[row, column], default: []].contains(direction) == false else { continue }
                visited[[row, column], default: []].insert(direction)
                var count = 0
                var current = [row, column]
                var direction = direction
                while true {
                    count += 1
                    let next = direction.next
                    var y = current[0] + next[0]
                    var x = current[1] + next[1]
                    if y < 0 {
                        y = grid.count - 1
                    }
                    if y == grid.count {
                        y = 0
                    }
                    if x < 0 {
                        x = grid[0].count - 1
                    }
                    if x == grid[0].count {
                        x = 0
                    }
                    current = [y, x]
                    let point = Point(rawValue: grid[y][x])!
                    direction = point.switchDirection(direction)
                    guard visited[current, default: []].contains(direction) == false else { break }
                    visited[current, default: []].insert(direction)
                }
                result.append(count)
            }
        }
    }
    return result.sorted()
}
