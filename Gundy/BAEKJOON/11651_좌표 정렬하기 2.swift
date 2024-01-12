let count = Int(readLine()!)!
var numbers = [[Int]]()

for _ in 0..<count {
    numbers.append(readLine()!.split(separator: " ").map { Int($0)! })
}

var result = String()

numbers
    .sorted() { $0[1] != $1[1] ? $0[1] < $1[1] : $0[0] < $1[0] }
    .forEach { result += "\($0[0]) \($0[1])\n" }

print(result)
