let count = Int(readLine()!)!
var stack = [Int]()
var numbers = Array(stride(from: count, through: 1, by: -1))
var result = String()

loop: for _ in 1...count {
    let target = Int(readLine()!)!
    
    while stack.last != target {
        guard let number = numbers.popLast() else {
            result = "NO"
            
            break loop
        }
        
        stack.append(number)
        result += "+\n"
    }
    
    stack.removeLast()
    result += "-\n"
}

print(result)
