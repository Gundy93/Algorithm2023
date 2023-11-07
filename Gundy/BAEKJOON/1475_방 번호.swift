let input = readLine()!
let numbers = input.map { $0 == "9" ? 6 : Int(String($0))! }
var counts = Array(repeating: 0, count: 9)

numbers.forEach { counts[$0] += 1 }
counts[6] = counts[6] % 2 == 1 ? counts[6] / 2 + 1 : counts[6] / 2
print(counts.max()!)
