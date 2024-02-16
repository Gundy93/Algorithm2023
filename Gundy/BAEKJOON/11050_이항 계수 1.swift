let numbers = readLine()!.split(separator: " ").map { Int($0)! }
let numerator = numbers[0] > 1 ? (2...numbers[0]).reduce(1, *) : 1
var denominator = numbers[1] > 1 ? (2...numbers[1]).reduce(1, *) : 1

if numbers[0] - numbers[1] > 1 {
    denominator *= (2...numbers[0] - numbers[1]).reduce(1, *)
}

print(numerator / denominator)
