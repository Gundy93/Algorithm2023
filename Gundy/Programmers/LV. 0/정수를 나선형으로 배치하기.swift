import Foundation

enum Direction {
    case right
    case down
    case left
    case up
    
    var next: Direction {
        switch self {
        case .right:
            return .down
        case .down:
            return .left
        case .left:
            return .up
        case .up:
            return .right
        }
    }
}

func solution(_ n:Int) -> [[Int]] {
    var numbers = Array(repeating: Array(repeating: 0, count: n), count: n)
    var row = 0
    var column = 0
    var direction = Direction.right
    var number = 1
    
    while true {
        numbers[row][column] = number
        
        guard number < n*n else { break }
        
        switch direction {
        case .right:
            if column+1 < n, numbers[row][column+1] == 0 {
                column += 1
                number += 1
            } else {
                direction = direction.next
            }
        case .down:
            if row+1 < n, numbers[row+1][column] == 0 {
                row += 1
                number += 1
            } else {
                direction = direction.next
            }
        case .left:
            if column-1 >= 0, numbers[row][column-1] == 0 {
                column -= 1
                number += 1
            } else {
                direction = direction.next
            }
        case .up:
            if row-1 >= 0, numbers[row-1][column] == 0 {
                row -= 1
                number += 1
            } else {
                direction = direction.next
            }
        }
    }
    
    return numbers
}
