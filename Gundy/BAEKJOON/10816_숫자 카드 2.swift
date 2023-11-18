let _ = readLine()
let cards = readLine()!.split(separator: " ").map(String.init)
var counter = [String: Int]()

for number in cards {
    counter[number, default: 0] += 1
}

let _ = readLine()
let result = readLine()!.split(separator: " ").map { String(counter[String($0), default: 0]) }.joined(separator: " ")

print(result)
