import Foundation

let count = Int(readLine()!)!
var result = String()

for _ in 1...count {
    let numbers = readLine()!.split(separator: " ").map { Decimal(Int($0)!) }
    let numerator = stride(from: numbers[0] + 1, through: numbers[1], by: 1).reduce(1, *)
    let denominator = stride(from: 1, through: numbers[1] - numbers[0], by: 1).reduce(1, *)
    
    result += "\(numerator / denominator)\n"
}

print(result)
