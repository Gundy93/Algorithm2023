import Foundation

var target = Int(readLine()!)!
var primeNumbers = [2, 3]
var result = String()

for number in stride(from: 5, to: 246912, by: 2) {
    var isValid = true
    
    for divisor in primeNumbers {
        guard Double(divisor) <= sqrt(Double(number)) else { break }
        
        guard number % divisor != 0 else {
            isValid = false
            
            break
        }
    }
    
    if isValid {
        primeNumbers.append(number)
        
        continue
    }
}

let primeNumberChecker = Set(primeNumbers)

while target != 0 {
    var count = 0
    
    for number in target + 1...target * 2 {
        if primeNumberChecker.contains(number) {
            count += 1
        }
    }
    
    target = Int(readLine()!)!
    result += "\(count)\n"
}

print(result)
