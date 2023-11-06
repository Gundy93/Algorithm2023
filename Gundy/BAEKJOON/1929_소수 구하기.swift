import Foundation

let range = readLine()!.split(separator: " ").compactMap({ Int($0) })
var primeNumbers = [Int]()

for number in range[0]...range[1] {
    if isPrime(number: number) {
        primeNumbers.append(number)
    }
}

for number in primeNumbers {
    print(number)
}

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
