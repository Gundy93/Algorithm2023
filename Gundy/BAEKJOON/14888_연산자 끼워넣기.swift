var maximum = Int.min
var minimum = Int.max
let countOfNumbers = Int(readLine()!)!
let numbers = readLine()!.split(separator: " ").map { Int($0)! }
var signs = readLine()!.split(separator: " ").map { Int($0)! }
var index = 1
var result = numbers[0]

func backtracking() {
    guard index < countOfNumbers else {
        maximum = max(maximum, result)
        minimum = min(minimum, result)
        
        return
    }
    
    let number = numbers[index]
    
    index += 1
    
    for sign in 0..<4 {
        guard signs[sign] >= 1 else { continue }
        
        let origin = result
        
        signs[sign] -= 1
        
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
        
        backtracking()
        signs[sign] += 1
        result = origin
    }
    
    index -= 1
}

backtracking()
print(maximum, minimum, separator: "\n")
