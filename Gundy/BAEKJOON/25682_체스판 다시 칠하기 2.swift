let input = readLine()!.split(separator: " ").map { Int($0)! }
let (height, width, length) = (input[0], input[1], input[2])
var board: [[String]] = []

for _ in 1...height {
    board.append(readLine()!.map(String.init))
}

func makePrefixSum(color: String) -> [[Int]] {
    var prefixSum = Array(repeating: Array(repeating: 0, count: width + 1), count: height + 1)
    
    for row in 0...height - 1 {
        for column in 0...width - 1 {
            var equalValue = 0
            
            if (row + column) % 2 == 0 {
                equalValue = board[row][column] == color ? 0 : 1
            } else {
                equalValue = board[row][column] != color ? 0 : 1
            }
            
            prefixSum[row + 1][column + 1] = prefixSum[row][column + 1] + prefixSum[row + 1][column] - prefixSum[row][column] + equalValue
        }
    }
    return prefixSum
}

func squareMinCount(_ prefixSum: [[Int]]) -> Int {
    var result = Int.max
    
    for row in 1...(height - length + 1) {
        for column in 1...(width - length + 1) {
            result = min(result, prefixSum[row + length - 1][column + length - 1] - prefixSum[row - 1][column + length - 1] - prefixSum[row + length - 1][column - 1] + prefixSum[row - 1][column - 1])
        }
    }
    
    return result
}

print(min(squareMinCount(makePrefixSum(color: "B")), squareMinCount(makePrefixSum(color: "W"))))
