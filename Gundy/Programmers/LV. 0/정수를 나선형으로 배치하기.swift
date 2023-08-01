func solution(_ n:Int) -> [[Int]] {
    var result = Array(repeating: Array(repeating: 0, count: n), count: n)
    var row = 0
    var column = 0
    var direction = Direction.right
    for number in 1...n * n {
        result[row][column] = number
        guard number < n * n else { break }
    direction: while true {
            switch direction {
            case .up:
                guard row - 1 >= 0, result[row - 1][column] == 0 else {
                    direction = .right
                    continue
                }
                row -= 1
                break direction
            case .down:
                guard row + 1 < n, result[row + 1][column] == 0 else {
                    direction = .left
                    continue
                }
                row += 1
                break direction
            case .left:
                guard column - 1 >= 0, result[row][column - 1] == 0 else {
                    direction = .up
                    continue
                }
                column -= 1
                break direction
            case .right:
                guard column + 1 < n, result[row][column + 1] == 0 else {
                    direction = .down
                    continue
                }
                column += 1
                break direction
            }
        }
    }
    return result
}

enum Direction {
    case up
    case down
    case left
    case right
}
