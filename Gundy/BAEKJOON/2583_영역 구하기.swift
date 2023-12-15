let input = readLine()!.split(separator: " ").map { Int($0)! }
var board = Array(repeating: Array(repeating: 0, count: input[1] + 1), count: input[0] + 1)

for _ in 1...input[2] {
    let rectangle = readLine()!.split(separator: " ").map { Int($0)! }
    
    board[rectangle[1]][rectangle[0]] += 1
    board[rectangle[1]][rectangle[2]] -= 1
    board[rectangle[3]][rectangle[0]] -= 1
    board[rectangle[3]][rectangle[2]] += 1
}

for row in 0...input[0] - 1 {
    for column in stride(from: 1, to: input[1], by: 1) {
        board[row][column] += board[row][column - 1]
    }
}

for column in 0...input[1] - 1 {
    for row in stride(from: 1, to: input[0], by: 1) {
        board[row][column] += board[row - 1][column]
    }
}

var result = [Int]()
var visited = Array(repeating: Array(repeating: false, count: input[1]), count: input[0])

for row in 0...input[0] - 1 {
    for column in 0...input[1] - 1 {
        guard board[row][column] == 0,
              visited[row][column] == false else { continue }
        
        var stack = [(row, column)]
        var count = 0
        
        while let (row, column) = stack.popLast() {
            guard visited[row][column] == false else { continue }
            
            visited[row][column] = true
            
            guard board[row][column] == 0 else { continue }
            
            count += 1
            
            for (nextRow, nextColumn) in zip([-1, 1, 0, 0], [0, 0, -1, 1]) {
                let row = row + nextRow
                let column = column + nextColumn
                
                guard 0...input[0] - 1 ~= row,
                      0...input[1] - 1 ~= column else { continue }
                
                stack.append((row, column))
            }
        }
        
        result.append(count)
    }
}

print("\(result.count)\n\(result.sorted().map(String.init).joined(separator: " "))")
