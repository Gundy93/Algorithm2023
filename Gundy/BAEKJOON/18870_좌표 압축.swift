_ = readLine()
let numbers = readLine()!.split(separator: " ").map { Int($0)! }
var converter = [Int: Int]()

for (index, number) in Set(numbers).sorted().enumerated() {
    converter[number] = index
}

print(numbers.map { String(converter[$0]!) }.joined(separator: " "))
