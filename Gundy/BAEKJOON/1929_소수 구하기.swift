let input = readLine()!.split(separator: " ").map { Int($0)! }
var isPrime = Array(repeating: true, count: input[1]+1)

isPrime[1] = false

for number in 2...input[1] {
    if isPrime[number] {
        for notPrimeNumber in stride(from: number * 2, through: input[1], by: number) {
            isPrime[notPrimeNumber] = false
        }
    }
}

print((input[0]...input[1]).filter { isPrime[$0] }.map(String.init).joined(separator: "\n"))
