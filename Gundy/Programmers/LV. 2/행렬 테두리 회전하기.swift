func solution(_ rows:Int, _ columns:Int, _ queries:[[Int]]) -> [Int] {
    var board = Array(repeating: Array(repeating: 0, count: columns), count: rows)
    var indexNumber = 1
    for row in 0..<rows {
        for column in 0..<columns {
            board[row][column] = indexNumber
            indexNumber += 1
        }
    }
    var result = [Int]()
    for query in queries {
        let startRow = query[0] - 1
        let endRow = query[2] - 1
        let startColumn = query[1] - 1
        let endColumn = query[3] - 1
        var minimum = board[startRow][startColumn]
        var number = board[startRow][startColumn]
        for index in startColumn + 1...endColumn {
            let origin = board[startRow][index]
            if origin < minimum {
                minimum = origin
            }
            board[startRow][index] = number
            number = origin
        }
        for index in startRow + 1...endRow {
            let origin = board[index][endColumn]
            if origin < minimum {
                minimum = origin
            }
            board[index][endColumn] = number
            number = origin
        }
        for index in stride(from: endColumn - 1, through: startColumn, by: -1) {
            let origin = board[endRow][index]
            if origin < minimum {
                minimum = origin
            }
            board[endRow][index] = number
            number = origin
        }
        for index in stride(from: endRow - 1, through: startRow, by: -1) {
            let origin = board[index][startColumn]
            if origin < minimum {
                minimum = origin
            }
            board[index][startColumn] = number
            number = origin
        }
        result.append(minimum)
    }
    return result
}
