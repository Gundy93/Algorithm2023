let count = Int(readLine()!)!
var numbers = [Int]()
var result = String()

(0..<count).forEach { _ in numbers.append(Int(readLine()!)!) }

numbers.sorted(by: >).forEach { result += String($0) + "\n" }

print(result)
