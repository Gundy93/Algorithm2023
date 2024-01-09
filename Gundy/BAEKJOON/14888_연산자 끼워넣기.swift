var maximum = Int.min
var minimum = Int.max
let countOfNumbers = Int(readLine()!)!
let numbers = readLine()!.split(separator: " ").map { Int($0)! }
var signs = readLine()!.split(separator: " ").map { Int($0)! }
var index = countOfNumbers - 1
var stack = [(Int, Int)]()

func backtracking() {
    guard index > 0 else {
        var result = numbers[0]
        var index = stack.count - 1
        
        while index >= 0 {
            let (number, sign) = stack[index]
            
            switch sign {
            case 0:
                result += number
            case 1:
                result -= number
            case 2:
                result *= number
            default:
                result /= number
            }
            
            index -= 1
        }
        
        maximum = max(maximum, result)
        minimum = min(minimum, result)
        
        return
    }
    
    let number = numbers[index]
    
    index -= 1
    
    for sign in 0..<4 {
        guard signs[sign] >= 1 else { continue }
        
        signs[sign] -= 1
        stack.append((number, sign))
        backtracking()
        stack.removeLast()
        signs[sign] += 1
    }
    
    index += 1
}

backtracking()
print(maximum, minimum, separator: "\n")
