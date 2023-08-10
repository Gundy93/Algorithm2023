func solution(_ board:[String]) -> Int {
    let board = board.map { $0.map(String.init) }
    var oWidth = Set<Int>()
    var oHeight = Set<Int>()
    var oDiagonal = Set<Int>()
    var oCount = 0
    var isOWin = false
    var xWidth = Set<Int>()
    var xHeight = Set<Int>()
    var xDiagonal = Set<Int>()
    var xCount = 0
    var isXWin = false
    var diagonal = [[[0, 0], [1, 1], [2, 2]], [[0, 2], [1, 1], [2, 0]]]
    for row in 0...2 {
        for column in 0...2 {
            if board[row][column] == "O" {
                oCount += 1
                if isOWin == false, oWidth.contains(column) == false {
                    oWidth.insert(row)
                    if board[row][0] == board[row][1], board[row][1] == board[row][2] {
                        isOWin = true
                    }
                }
                if isOWin == false, oHeight.contains(row) == false {
                    oWidth.insert(row)
                    if board[0][column] == board[1][column], board[1][column] == board[2][column] {
                        isOWin = true
                    }
                }
                for index in 0...1 {
                    if isOWin == false, diagonal[index].contains([row, column]), oDiagonal.contains(index) == false {
                        oDiagonal.insert(index)
                        if board[diagonal[index][0][0]][diagonal[index][0][1]] == board[diagonal[index][1][0]][diagonal[index][1][1]], board[diagonal[index][1][0]][diagonal[index][1][1]] == board[diagonal[index][2][0]][diagonal[index][2][1]] {
                            isOWin = true
                        }
                    }
                }
            } else if board[row][column] == "X" {
                xCount += 1
                if isXWin == false, xWidth.contains(column) == false {
                    xWidth.insert(row)
                    if board[row][0] == board[row][1], board[row][1] == board[row][2] {
                        isXWin = true
                    }
                }
                if isXWin == false, xHeight.contains(row) == false {
                    xWidth.insert(row)
                    if board[0][column] == board[1][column], board[1][column] == board[2][column] {
                        isXWin = true
                    }
                }
                for index in 0...1 {
                    if isXWin == false, diagonal[index].contains([row, column]), oDiagonal.contains(index) == false {
                        xDiagonal.insert(index)
                        if board[diagonal[index][0][0]][diagonal[index][0][1]] == board[diagonal[index][1][0]][diagonal[index][1][1]], board[diagonal[index][1][0]][diagonal[index][1][1]] == board[diagonal[index][2][0]][diagonal[index][2][1]] {
                            isXWin = true
                        }
                    }
                }
            }
        }
    }
    switch (isOWin, isXWin) {
    case (true, true):
        return 0
    case (true, false):
        return oCount == xCount + 1 ? 1 : 0
    case (false, true):
        return oCount == xCount ? 1 : 0
    default:
        return oCount == xCount + 1 || oCount == xCount ? 1 : 0
    }
}
