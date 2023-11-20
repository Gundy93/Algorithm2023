import Foundation

let numbers = readLine()!.split(separator: " ").map { Int($0)! }
var result = String()

for number in numbers[0]...numbers[1] {
    guard number > 3 else {
        if number != 1 {
            result += "\(number)\n"
        }
        
        continue
    }
    
    var isValid = true
    
    for divisor in 2...number - 1 {
        guard Double(divisor) <= sqrt(Double(number)) else { break }
        
        guard number % divisor != 0 else {
            isValid = false
            
            break
        }
    }
    
    if isValid {
        result += "\(number)\n"
        
        continue
    }
}

print(result)
