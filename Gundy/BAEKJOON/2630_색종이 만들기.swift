let length: Int = Int(readLine()!)!
var board: [[String]] = []
for _ in 1...length {
    board.append(readLine()!.split(separator: " ").map({ String($0) }))
}
let result = recursion(board.count / 2, originPoint: (0, 0))
print(result.zero)
print(result.one)

func recursion(_ term: Int, originPoint: (row: Int, column: Int)) -> (one: Int, zero: Int) {
    if term == 0 {
        switch board[originPoint.row][originPoint.column] {
        case "1":
            return (1, 0)
        default:
            return (0, 1)
        }
    }
    let origin = recursion(term / 2, originPoint: originPoint)
    var isEqual: Bool = origin.one + origin.zero == 1 ? true : false
    var one: Int = origin.one
    var zero: Int = origin.zero
    for (row, column) in zip([0, term, term],
                             [term, 0, term]) {
        let temporary = recursion(term / 2, originPoint: (originPoint.row + row, originPoint.column + column))
        if isEqual,
           origin != temporary {
            isEqual = false
        }
        one += temporary.one
        zero += temporary.zero
    }
    return isEqual ? origin : (one, zero)
}
