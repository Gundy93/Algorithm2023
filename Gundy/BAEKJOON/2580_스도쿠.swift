import Foundation

var board = [[Int]]()
var needCheckPoints = [(row: Int, column: Int)]()

for row in 0...8 {
    let numbers = readLine()!.split(separator: " ").map { Int($0)! }
    
    for column in 0...8 {
        if numbers[column] == 0 {
            needCheckPoints.append((row, column))
        }
    }
    
    board.append(numbers)
}

func validate(_ row: Int, _ column: Int, _ number: Int) -> Bool {
    for row in row / 3 * 3...row / 3 * 3 + 2 {
        for column in column / 3 * 3...column / 3 * 3 + 2 {
            guard number != board[row][column] else { return false }
        }
    }
    
    return true
}

func backTracking(_ index: Int) {
    guard index < needCheckPoints.count else {
        var result = String()
        
        board.forEach { result += $0.map(String.init).joined(separator: " ") + "\n" }
        print(result)
        exit(0)
    }
    
    let (row, column) = needCheckPoints[index]
    
    for number in 1...9 {
        guard board[row].contains(number) == false,
              board.allSatisfy({ $0[column] != number }),
              validate(row, column, number) else { continue }
        
        board[row][column] = number
        backTracking(index + 1)
    }
    
    board[row][column] = 0
}

backTracking(0)
