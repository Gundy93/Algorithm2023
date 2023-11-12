var board = [[String]]()
var maxLength = 0

for _ in 1...5 {
    let texts = readLine()!.map(String.init)
    
    board.append(texts)
    maxLength = max(maxLength, texts.count)
}

var result = String()

for column in 0...maxLength - 1 {
    for row in 0...4 {
        guard column < board[row].count else { continue }
        
        result += board[row][column]
    }
}

print(result)
