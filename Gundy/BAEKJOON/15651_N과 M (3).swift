let input = readLine()!.split(separator: " ").compactMap({ Int($0) })
var result = [String]()

func recursion(_ numbers: [String]) {
    if numbers.count == input[1] {
        result.append(numbers.joined(separator: " "))
        return
    }
    for number in 1...input[0] {
        recursion(numbers + [String(number)])
    }
}

recursion([])

for numbers in result {
    print(numbers)
}
