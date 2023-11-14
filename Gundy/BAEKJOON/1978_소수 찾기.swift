import Foundation

let _ = readLine()
let numbers = readLine()!.split(separator: " ").compactMap { Int($0) }
let result = numbers.filter { number in
    guard number != 1 else { return false }
    
    guard number >= 4 else { return true }
    
    for divisor in 2...number {
        guard Double(divisor) <= sqrt(Double(number)) else { break }
        
        if number % divisor == 0 {
            return false
        }
    }
    
    return true
}

print(result.count)
