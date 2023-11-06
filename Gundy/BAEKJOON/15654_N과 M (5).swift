let input = readLine()!.split(separator: " ").compactMap({ Int($0) })
let numberList = readLine()!.split(separator: " ").compactMap({ Int($0) }).sorted()
var result = [String]()

func recursion(_ numbers: [String], _ indicise: [Int]) {
    if numbers.count == input[1] {
        result.append(numbers.joined(separator: " "))
        return
    }
    for index in 0..<input[0] {
        guard indicise.contains(index) == false else { continue }
        recursion(numbers + [String(numberList[index])], indicise + [index])
    }
}

recursion([], [])

for numbers in result {
    print(numbers)
}
