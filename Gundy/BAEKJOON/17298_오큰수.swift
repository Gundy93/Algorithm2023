let count = Int(readLine()!)!
let numbers = readLine()!.split(separator: " ").map { Int($0)! }
var NGE = Array(repeating: "-1", count: count)
var stack = [Int]()

for index in 0...count - 1 {
    let number = numbers[index]
    
    while let last = stack.last,
          numbers[last] < number {
        NGE[last] = String(number)
        stack.removeLast()
    }
    
    stack.append(index)
}

print(NGE.joined(separator: " "))
