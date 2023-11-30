let length = Int(readLine()!)!
var paper = [[String]]()

for _ in 1...length {
    paper.append(readLine()!.split(separator: " ").map(String.init))
}

func countPapers(_ row: Int, _ column: Int, _ length: Int) -> (zero: Int, one: Int) {
    guard length > 1 else { return paper[row][column] == "0" ? (1,0) : (0,1) }
    
    let first = countPapers(row, column, length / 2)
    var isWholePaper = first.zero + first.one == 1
    var zero = first.zero
    var one = first.one
    
    for (row, column) in zip([row + length / 2, row, row + length / 2],
                             [column, column + length / 2, column + length / 2]) {
        let next = countPapers(row, column, length / 2)
        
        if isWholePaper {
            isWholePaper = first == next
        }
        
        zero += next.zero
        one += next.one
    }
    
    return isWholePaper ? first : (zero, one)
}

let result = countPapers(0, 0, length)

print("\(result.zero)\n\(result.one)")
