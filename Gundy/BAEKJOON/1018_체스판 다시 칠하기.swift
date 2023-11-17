let size = readLine()!.split(separator: " ").map { Int($0)! }
let (height, width) = (size[0], size[1])
var board = [[String]]()
var result = 64

for _ in 1...height {
    board.append(readLine()!.map(String.init))
}

for row in 0...height - 8 {
    for column in 0...width - 8 {
        count(row, column)
    }
}

func count(_ row: Int, _ column: Int) {
    var countB = 0
    var countW = 0
    
    for y in 0...7 {
        for x in 0...7 {
            if (x + y) % 2 == 0 {
                if board[row + y][column + x] == "B" {
                    countW += 1
                } else {
                    countB += 1
                }
            } else {
                if board[row + y][column + x] == "W" {
                    countW += 1
                } else {
                    countB += 1
                }
            }
        }
    }
    result = min(result, min(countB, countW))
}

print(result)
