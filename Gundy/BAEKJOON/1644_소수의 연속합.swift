import Foundation

func primeNumbers(lessThanOrEqualTo target: Int) -> [Int] {
    var result = [Int]()
    
    for number in stride(from: 2, through: target, by: 1) {
        var isValid = true
        
        for divisor in result {
            if number % divisor == 0 {
                isValid = false
                
                break
            }
            
            guard Double(divisor) <= sqrt(Double(number)) else { break }
        }
        
        if isValid {
            result.append(number)
        }
    }
    
    return result
}

let target = Int(readLine()!)!
var result = 0

if target > 1 {
    let numbers = primeNumbers(lessThanOrEqualTo: target)
    var left = 0
    var right = 0
    var partialSum = numbers[0]

    while left <= right {
        if partialSum == target {
            result += 1
        }
        
        if partialSum <= target {
            right += 1
            
            if right < numbers.count {
                partialSum += numbers[right]
            } else {
                break
            }
        } else {
            partialSum -= numbers[left]
            left += 1
        }
    }
}

print(result)
