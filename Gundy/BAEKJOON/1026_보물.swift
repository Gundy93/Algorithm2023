_ = Int(readLine()!)!
let first = readLine()!.split(separator: " ").map { Int($0)! }.sorted()
let second = readLine()!.split(separator: " ").map { Int($0)! }.sorted(by: >)
var result = 0

zip(first, second).forEach { result += $0 * $1 }
print(result)
