let _ = readLine()
let list = readLine()!.split(separator: " ").map { Int($0)! }
var logger = [Int: Int]()

for number in list {
    logger[number] = 1
}

let _ = readLine()
let numbers = readLine()!.split(separator: " ").map { Int($0)! }
var result = String()

for number in numbers {
    result += "\(logger[number] ?? 0)\n"
}

print(result)
