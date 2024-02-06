let count = Int(readLine()!)!
var times = readLine()!.split(separator: " ").map { Int($0)! }.sorted(by: >)
var result = 0

zip(1...count, times).forEach { result += $0 * $1 }
print(result)
