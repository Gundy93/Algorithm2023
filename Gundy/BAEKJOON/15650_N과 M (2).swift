let input = readLine()!.split(separator: " ").compactMap({ Int($0) })
var result = [[Int]]()

func recursion(current number: Int, _ numbers: [Int]) {
    if numbers.count == input[1] {
        result.append(numbers)
        return
    }
    guard number <= input[0] else {
        return
    }
    recursion(current: number + 1, numbers + [number])
    recursion(current: number + 1, numbers)
}

recursion(current: 1, [])

for numbers in result {
    print(numbers.map({ String($0) }).joined(separator: " "))
}
