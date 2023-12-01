func pow(_ matrix: [[Int]], _ count: Int) -> [[Int]] {
    guard count > 1 else { return matrix }
    
    let squared = pow(matrix, count / 2) 
    
    if count % 2 == 0 {
        return multiply(squared, squared)
    } else {
        return multiply(multiply(squared, squared), matrix)
    }
}

func multiply(_ lhs: [[Int]], _ rhs: [[Int]]) -> [[Int]] {
    var matrix = Array(repeating: Array(repeating: 0, count: rhs[0].count), count: lhs.count)

    for row in 0...lhs.count - 1 {
        for column in 0...rhs[0].count - 1 {
            for shared in 0...rhs.count - 1 {
                matrix[row][column] += lhs[row][shared] * rhs[shared][column]
            }
            
            matrix[row][column] %= 1000000007
        }
    }
    
    return matrix
}

let count = Int(readLine()!)!
var fibonacci = [[1, 1], [1, 0]]

print(pow(fibonacci, count)[0][1] % 1000000007)
