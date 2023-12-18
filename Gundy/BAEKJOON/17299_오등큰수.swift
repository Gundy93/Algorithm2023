let count = Int(readLine()!)!
let numbers = readLine()!.split(separator: " ").map { Int($0)! }
var F = [Int: Int]()

for number in numbers {
    F[number, default: 0] += 1
}

var NGF = Array(repeating: "-1", count: count)
var stack = [Int]()

for index in 0...count - 1 {
    let number = numbers[index]
    
    while let last = stack.last,
          F[numbers[last]]! < F[number]! {
        NGF[last] = String(number)
        stack.removeLast()
    }
    
    stack.append(index)
}

print(NGF.joined(separator: " "))
