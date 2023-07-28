func solution(_ arr:[Int]) -> Int {
    var result = 0
    var numbers = arr
    while let next = transform(numbers), next != numbers {
        numbers = next
        result += 1
    }
    return result
}

func transform(_ numbers: [Int]) -> [Int]? {
    var numbers = numbers
    for index in 0...numbers.count - 1 {
        let number = numbers[index]
        if number % 2 == 0, number >= 50 {
            numbers[index] /= 2
        } else if number % 2 == 1, number < 50 {
            numbers[index] = number * 2 + 1
        }
    }
    return numbers
}
