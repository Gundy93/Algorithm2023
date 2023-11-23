import Foundation

let count = Int(readLine()!)!
var total = 0.0
var counter = [Int: Int]()
var maximum = 0

for _ in 1...count {
    let number = Int(readLine()!)!
    
    total += Double(number)
    counter[number, default: 0] += 1
    maximum = max(maximum, counter[number]!)
}

var result = String()
let numbers = counter.keys.sorted().flatMap { Array(repeating: $0, count: counter[$0]!) }
let mode = counter.keys.filter { counter[$0]! == maximum }.sorted()

result += "\(Int(round(total / Double(count))))\n"
result += "\(numbers[numbers.count / 2])\n"
result += "\(mode.count > 1 ? mode[1] : mode[0])\n"
result += "\(numbers.last! - numbers.first!)"

print(result)
