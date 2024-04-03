import Foundation

func solution(_ board:[String]) -> Int {
    let board = board.map { $0.map(String.init) }
    var count = [0, 0]
    var rows = Array(repeating: [0, 0], count: 3)
    var columns = Array(repeating: [0, 0], count: 3)
    var cross = Array(repeating: [0, 0], count: 2)
    
    for row in 0...2 {
        for column in 0...2 where board[row][column] != "." {
            let index = board[row][column] == "O" ? 0 : 1
            
            count[index] += 1
            rows[row][index] += 1
            columns[column][index] += 1
            
            if row == 1,
               column == 1 {
                cross[0][index] += 1
                cross[1][index] += 1
            } else if [0, 2].contains(row),
                      [0, 2].contains(column) {
                cross[row == column ? 0 : 1][index] += 1
            }
        }
    }
    
    var oWin = false
    var xWin = false
    
    rows.forEach {
        if $0[0] == 3 {
            oWin = true
        } else if $0[1] == 3 {
            xWin = true
        }
    }
    columns.forEach {
        if $0[0] == 3 {
            oWin = true
        } else if $0[1] == 3 {
            xWin = true
        }
    }
    cross.forEach {
        if $0[0] == 3 {
            oWin = true
        } else if $0[1] == 3 {
            xWin = true
        }
    }
    
    switch (oWin, xWin) {
    case (true, true):
        return 0
    case (true, false):
        return count[0] == count[1]+1 ? 1 : 0
    case (false, true):
        return count[0] == count[1] ? 1 : 0
    default:
        return (count[0] >= count[1] && count[1]+1 >= count[0]) ? 1 : 0
    }
}
