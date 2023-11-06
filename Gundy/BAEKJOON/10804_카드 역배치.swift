func sorted(_ numbers: [Int], range: [Int]) -> [Int] {
    var result: [Int] = []
    if range[0] != 1 {
        result = Array(numbers[0...range[0] - 2]) + Array(numbers[range[0] - 1...range[1] - 1]).reversed()
    } else {
        result = Array(numbers[range[0] - 1...range[1] - 1]).reversed()
    }
    if range[1] < 20 {
        result += Array(numbers[range[1]...19])
    }
    return result
}

func solution() {
    var result: [Int] = stride(from: 1, through: 20, by: 1).map({ $0 })
    for _ in 1...10 {
        result = sorted(result, range: readLine()!.split(separator: " ").compactMap({ Int($0) }))
    }
    print(result.map({ String($0) }).joined(separator: " "))
}

solution()
