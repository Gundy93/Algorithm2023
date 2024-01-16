let input = readLine()!.split(separator: " ").map(String.init)
let count = Int(input[0])!
var numbers = stride(from: 1, to: input.count, by: 1).map { Int(String(input[$0].reversed()))! }

while numbers.count < count {
    numbers += readLine()!.split(separator: " ").map { Int(String($0.reversed()))! }
}

print(numbers.sorted().map(String.init).joined(separator: "\n"))
