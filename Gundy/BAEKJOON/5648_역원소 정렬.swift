var input = readLine()!.split(separator: " ").map(String.init)
let count = Int(input.removeFirst())!
var numbers = input.map { Int(String($0.reversed()))! }

while numbers.count < count {
    numbers += readLine()!.split(separator: " ").map { Int(String($0.reversed()))! }
}

print(numbers.sorted().map(String.init).joined(separator: "\n"))
