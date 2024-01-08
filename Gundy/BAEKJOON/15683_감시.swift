enum Direction: CaseIterable {
    case up
    case down
    case right
    case left
}

let input = readLine()!.split(separator: " ").map { Int($0)! }
var room = [[Int]]()

for _ in 1...input[0] {
    room.append(readLine()!.split(separator: " ").map { Int($0)! })
}

var count = input[0] * input[1]
var canWatch = Array(repeating: Array(repeating: false, count: input[1]), count: input[0])
var cctvs = [(Int, Int)]()

for row in 0..<input[0] {
    for column in 0..<input[1] {
        if 1...5 ~= room[row][column] {
            cctvs.append((row, column))
            canWatch[row][column] = true
            count -= 1
        } else if room[row][column] == 6 {
            count -= 1
        }
    }
}

var result = count
var index = 0

func backtracking() {
    result = min(result, count)
    
    guard index < cctvs.count else { return }
    
    let (row, column) = cctvs[index]
    var points = [(Int, Int)]()
    
    index += 1
    
    func reset() {
        count += points.count
        points.forEach { (row, column) in
            canWatch[row][column] = false
        }
        points.removeAll()
    }
    
    switch room[row][column] {
    case 1:
        for direction in Direction.allCases {
            points += count(direction: direction, row: row, column: column)
            backtracking()
            reset()
        }
    case 2:
        for directions in [[Direction.up, Direction.down],
                           [Direction.left, Direction.right]] {
            directions.forEach { direction in
                points += count(direction: direction, row: row, column: column)
            }
            backtracking()
            reset()
        }
    case 3:
        for directions in [[Direction.up, Direction.right],
                           [Direction.right, Direction.down],
                           [Direction.down, Direction.left],
                           [Direction.left, Direction.up]] {
            directions.forEach { direction in
                points += count(direction: direction, row: row, column: column)
            }
            backtracking()
            reset()
        }
    case 4:
        for directions in [[Direction.up, Direction.right, Direction.down],
                           [Direction.right, Direction.down, Direction.left],
                           [Direction.down, Direction.left, Direction.up],
                           [Direction.left, Direction.up, Direction.right]] {
            directions.forEach { direction in
                points += count(direction: direction, row: row, column: column)
            }
            backtracking()
            reset()
        }
    default:
        Direction.allCases.forEach { direction in
            points += count(direction: direction, row: row, column: column)
        }
        backtracking()
        reset()
    }
    
    index -= 1
}

func count(direction: Direction, row: Int, column: Int) -> [(Int, Int)] {
    var delta = (0, 0)
    
    switch direction {
    case .up:
        delta = (-1, 0)
    case .down:
        delta = (1, 0)
    case .right:
        delta = (0, 1)
    case .left:
        delta = (0, -1)
    }
    
    var row = row + delta.0
    var column = column + delta.1
    var points = [(Int, Int)]()
    
    while 0..<input[0] ~= row,
          0..<input[1] ~= column,
          room[row][column] != 6 {
        if canWatch[row][column] == false {
            canWatch[row][column] = true
            count -= 1
            points.append((row, column))
        }
        row += delta.0
        column += delta.1
    }
    
    return points
}

backtracking()
print(result)
