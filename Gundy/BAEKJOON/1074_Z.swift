import Foundation

let input = readLine()!.split(separator: " ").map { Int($0)! }
let length = Int(pow(2.0, Double(input[0])))
var result = 0

func recursion(_ row: Int, _ column: Int, _ term: Int, _ number: Int) {
    guard row...row + term * 2 ~= input[1],
          column...column + term * 2 ~= input[2] else { return }
    
    guard term > 0 else {
        result = number
        
        return
    }
    
    let delta = term * term
    
    recursion(row, column, term / 2, number)
    recursion(row, column + term, term / 2, number + delta)
    recursion(row + term, column, term / 2, number + delta * 2)
    recursion(row + term, column + term, term / 2, number + delta * 3)
}

recursion(0, 0, length / 2, 0)

print(result)
