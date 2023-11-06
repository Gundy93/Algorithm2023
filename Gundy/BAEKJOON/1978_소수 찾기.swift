import Foundation

func isPrime(number: Int) -> Bool {
    guard number > 3 else { return number != 1 }
    for divisor in 2...number {
        if number % divisor == 0 {
            return false
        }
        guard Double(divisor) <= sqrt(Double(number)) else {
            break
        }
    }
    return true
}

let _ = readLine()
print(readLine()!.split(separator: " ").compactMap({ Int($0) }).filter({ isPrime(number: $0) }).count)
