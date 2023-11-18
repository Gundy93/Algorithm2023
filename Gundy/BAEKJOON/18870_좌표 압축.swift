let _ = readLine()
let numbers = readLine()!.split(separator: " ").map { Int($0)! }
var indices = [Int: Int]()

for number in Set(numbers).sorted().enumerated() {
    indices[number.element] = number.offset
}

print(numbers.map { String(indices[$0]!) }.joined(separator: " "))
