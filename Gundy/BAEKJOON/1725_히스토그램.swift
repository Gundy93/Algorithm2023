let count = Int(readLine()!)!
var numbers = [Int]()
var minimum = Int.max
var result = 0

for _ in 1...count {
    let number = Int(readLine()!)!
    
    numbers.append(number)
    minimum = min(minimum, number)
    result = max(result, minimum * numbers.count)
}

numbers.append(-1)

var stack = [Int]()

for index in 0...count {
    while let last = stack.last,
       numbers[last] > numbers[index] {
        let check = stack.removeLast()
        
        result = max(result, numbers[check] * (index - (stack.last ?? 0) - 1))
    }
    
    stack.append(index)
}

print(result)
