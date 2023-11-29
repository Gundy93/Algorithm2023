let input = readLine()!
let isNegativeStart = input.first == "-"
let expressions = input.split(separator: "-").map(String.init)
let numbers = expressions.map { $0.split(separator: "+").map { Int($0)! }.reduce(0, +) }
var result = isNegativeStart ? -numbers[0] : numbers[0]

for index in stride(from: 1, to: numbers.count, by: 1) {
    result -= numbers[index]
}

print(result)
