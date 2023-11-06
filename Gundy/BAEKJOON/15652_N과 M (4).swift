let input = readLine()!.split(separator: " ").compactMap({ Int($0) })
var result = [String]()

func recursion(_ numbers: [String]) {
    if numbers.count == input[1] {
        result.append(numbers.joined(separator: " "))
        return
    }
    let startNumber = numbers.isEmpty ? 1 : Int(numbers.last!)!
    for number in startNumber...input[0] {
        recursion(numbers + [String(number)])
    }
}

recursion([])

for numbers in result {
    print(numbers)
}
