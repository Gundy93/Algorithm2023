let target = Int(readLine()!)!

if target == 1 {
    print(0)
} else {
    var isPrime = Array(repeating: true, count: target+1)

    for number in 2...target {
        if isPrime[number] {
            for notPrimeNumber in stride(from: number * 2, through: target, by: number) {
                isPrime[notPrimeNumber] = false
            }
        }
    }

    let primeNumbers = (2...target).filter { isPrime[$0] }
    var partialSum = 2
    var start = 0
    var end = 0
    var result = 0

    loop: while start <= end {
        switch partialSum {
        case target:
            result += 1
            fallthrough
        case ..<target:
            end += 1
            guard end < primeNumbers.count else { break loop }
            partialSum += primeNumbers[end]
        default:
            partialSum -= primeNumbers[start]
            start += 1
        }
    }

    print(result)
}
