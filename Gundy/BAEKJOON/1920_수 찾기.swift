let _ = readLine()
let list = Set(readLine()!.split(separator: " ").map { Int($0)! })
let _ = readLine()
let numbers = readLine()!.split(separator: " ").map { Int($0)! }
var result = String()

for number in numbers {
    result += "\(list.contains(number) ? 1 : 0)\n"
}

print(result)
