import Foundation

let min = Int(readLine()!)!
let max = Int(readLine()!)!
let result = Array(min...max).filter { number in
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

if result.isEmpty {
    print(-1)
} else {
    print(result.reduce(0, +))
    print(result[0])
}
