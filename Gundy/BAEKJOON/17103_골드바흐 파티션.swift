import Foundation

var numberOfCases = Int(readLine()!)!
var targets = Array(1...numberOfCases).map { _ in Int(readLine()!)! }
var result = String()
var primeNumbers = [2, 3]

for number in stride(from: 5, to: targets.sorted()[numberOfCases - 1], by: 2) {
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

for target in targets {
    var counter = Set<Set<Int>>()
    
    for number in primeNumbers {
        guard number <= target / 2 else { break }
        
        if primeNumberChecker.contains(target - number) {
            counter.insert([number, target - number])
        }
    }
    
    result += "\(counter.count)\n"
}

print(result)
