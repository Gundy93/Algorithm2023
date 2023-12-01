let input = readLine()!.split(separator: " ").map { Int($0)! }
let (size, exponent) = (input[0], input[1])
var matrix = [[Int]]()

for _ in 1...size {
    matrix.append(readLine()!.split(separator: " ").map { Int($0)! })
}

func recursion(_ count: Int) -> [[Int]] {
    guard count > 1 else { return matrix }
    
    let squared = recursion(count / 2) 
    
    if count % 2 == 0 {
        return multiple(squared, squared)
    } else {
        return multiple(multiple(squared, squared), matrix)
    }
}

func multiple(_ lhs: [[Int]], _ rhs: [[Int]]) -> [[Int]] {
    var matrix = Array(repeating: Array(repeating: 0, count: size), count: size)

    for row in 0...size - 1 {
        for column in 0...size - 1 {
            for shared in 0...size - 1 {
                matrix[row][column] += lhs[row][shared] * rhs[shared][column]
            }
            
            matrix[row][column] %= 1000
        }
    }
    
    return matrix
}

var result = String()

if exponent == 1 {
    for row in matrix {
        result += row.map { String($0 % 1000) }.joined(separator: " ") + "\n"
    }
} else {
    for row in recursion(exponent) {
        result += row.map(String.init).joined(separator: " ") + "\n"
    }
}

print(result)
