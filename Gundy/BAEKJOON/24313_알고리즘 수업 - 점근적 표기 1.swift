let numbers = readLine()!.split(separator: " ").compactMap { Int($0) }
let fn: (Int) -> Int = { number in
    return numbers[0] * number + numbers[1]
}
let c = Int(readLine()!)!
let n0 = Int(readLine()!)!
var isValid = fn(n0) <= c * n0 && fn(100000) <= c * 100000

print(isValid ? 1 : 0)
