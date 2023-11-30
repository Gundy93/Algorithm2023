let length = Int(readLine()!)!
var paper = [[String]]()

for _ in 1...length {
    paper.append(readLine()!.split(separator: " ").map(String.init))
}

func countPaper(_ row: Int, _ column: Int, _ length: Int) -> (minus: Int, zero: Int, plus: Int) {
    guard length > 1 else { return paper[row][column] == "0" ? (0,1,0) : paper[row][column] == "1" ? (0,0,1) : (1,0,0) }
    
    let term = length / 3
    let first = countPaper(row, column, term)
    var isWhole = first.minus + first.zero + first.plus == 1
    var minus = first.minus
    var zero = first.zero
    var plus = first.plus
    
    for (row, column) in zip([row, row,
                              row + term, row + term, row + term,
                              row + term * 2, row + term * 2, row + term * 2],
                             [column + term, column + term * 2,
                              column, column + term, column + term * 2,
                              column, column + term, column + term * 2]) {
        let next = countPaper(row, column, term)
        
        if isWhole {
            isWhole = first == next
        }
        
        minus += next.minus
        zero += next.zero
        plus += next.plus
    }
    
    return isWhole ? first : (minus, zero, plus)
}

let result = countPaper(0, 0, length)

print("\(result.minus)\n\(result.zero)\n\(result.plus)")
