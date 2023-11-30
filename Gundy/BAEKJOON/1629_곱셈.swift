let numbers = readLine()!.split(separator: " ").map { Int($0)! }

func calculate(_ count: Int) -> Int {
    guard count > 1 else { return numbers[0] % numbers[2] }
    
    let next = calculate(count / 2)
    
    if count % 2 == 1 {
        return next * next % numbers[2] * numbers[0] % numbers[2]
    } else {
        return next * next % numbers[2]
    }
}

print(calculate(numbers[1]))
