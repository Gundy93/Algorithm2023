let input = readLine()!.split(separator: " ").compactMap({ Int($0) })
let numberList = readLine()!.split(separator: " ").compactMap({ Int($0) }).sorted()
var result = [String]()

func recursion(_ numbers: [String], _ indicise: [Int]) {
    if numbers.count == input[1] {
        result.append(numbers.joined(separator: " "))
        return
    }
    let startIndex = indicise.isEmpty ? 0 : indicise.last!
    for index in startIndex..<input[0] {
        guard indicise.contains(index) == false else { continue }
        recursion(numbers + [String(numberList[index])], indicise + [index])
    }
}

recursion([], [])

for numbers in result {
    print(numbers)
}
