func solution(_ num_list:[Int]) -> Int {
    var result = 0
    for number in num_list {
        var number = number
        while number != 1 {
            if number % 2 == 0 {
                number /= 2
                result += 1
            } else {
                number -= 1
            }
        }
    }
    return result
}
