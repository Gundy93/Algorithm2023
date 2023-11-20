다음 소수import Foundation

let numberOfCases = Int(readLine()!)!
var result = String()

for _ in 1...numberOfCases {
    let startNumber = Int(readLine()!)!
    
    for number in max(startNumber, 2)... {
        guard number > 3 else {
            result += "\(number)\n"
            
            break
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
            
            break
        }
    }
}

print(result)
