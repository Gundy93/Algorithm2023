var fibonacciCount = 0

func fibonacci(n: Int) -> Int {
    var f = Array(repeating: 1, count: n + 1)
    
    for i in stride(from: 3, through: n, by: 1) {
        fibonacciCount += 1
        f[i] = f[i - 1] + f[i - 2]
    }
    
    return f[n]
}

let number = Int(readLine()!)!
let fibo = fibonacci(n: number)

print(fibo, fibonacciCount)
