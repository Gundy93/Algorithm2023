func factorization(number: Int) -> [Int] {
    var number = number
    var result = [Int]()
    var divisor = 2

    while divisor < number {
        if number % divisor == 0 {
            result.append(divisor)
            number /= divisor
        } else {
            divisor += 1
        }
    }

    if number != 1 {
        result.append(number)
    }

    return result
}

let result = factorization(number: Int(readLine()!)!)

for number in result {
    print(number)
}
