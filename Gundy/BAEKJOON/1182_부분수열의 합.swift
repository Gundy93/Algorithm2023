let input = readLine()!.split(separator: " ").compactMap {
    return Int($0)
}
let numbers = readLine()!.split(separator: " ").compactMap {
    return Int($0)
}
var count = 0

func recursion(currentIndex index: Int, partialResult result: Int) {
    if result == input[1] {
        count += 1
    }
    for nextIndex in stride(from: index + 1, to: input[0], by: 1) {
        recursion(currentIndex: nextIndex, partialResult: result + numbers[nextIndex])
    }
}

for index in 0..<input[0] {
    recursion(currentIndex: index, partialResult: numbers[index])
}

print(count)
