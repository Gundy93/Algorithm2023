let input = readLine()!.split(separator: " ").map { Int($0)! }
var numbers = readLine()!.split(separator: " ").map { Int($0)! }
var counter = [Int: Int]()
var result = 0

for index in stride(from: 1, to: input[0], by: 1) {
    numbers[index] += numbers[index - 1]
}

var remainings = numbers.map { $0 % input[1] }

for remaining in remainings {
    counter[remaining, default: 0] += 1
}

result += counter[0, default: 0]

for count in counter.values {
    result += count * (count - 1) / 2
}

print(result)
