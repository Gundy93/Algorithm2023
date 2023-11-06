let input = readLine()!.split(separator: " ").compactMap({ Int($0) })
let numberList = readLine()!.split(separator: " ").compactMap({ Int($0) }).sorted()
var result = ""

func recursion(_ numbers: [String]) {
    if numbers.count == input[1] {
        result += numbers.joined(separator: " ") + "\n"
        return
    }
    for index in 0..<input[0] {
        recursion(numbers + [String(numberList[index])])
    }
}

recursion([])
result.removeLast()

print(result)
