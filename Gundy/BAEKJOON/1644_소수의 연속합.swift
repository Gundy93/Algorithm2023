let target = Int(readLine()!)!
var result = 0

if target >= 2 {
    var primes = [Int]()
    var isPrime = Array(repeating: true, count: target+1)
    
    for number in 2...target {
        if isPrime[number] {
            primes.append(number)
            
            for multiple in stride(from: number*2, through: target, by: number) {
                isPrime[multiple] = false
            }
        }
    }
    
    var start = 0
    var end = 0
    var sum = 2
    
    while end < primes.count,
          start <= end {
        switch sum {
        case ..<target:
            end += 1
            
            guard end < primes.count else { break }
            
            sum += primes[end]
        case target:
            result += 1
            fallthrough
        default:
            sum -= primes[start]
            start += 1
        }
    }
}

print(result)
