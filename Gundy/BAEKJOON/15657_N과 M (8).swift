let targetCount = readLine()!.split(separator: " ").compactMap({ Int($0) })[1]
let numbers = readLine()!.split(separator: " ").compactMap({ Int($0) }).sorted()

func backTracking(_ index: Int, _ partialNumbers: [Int]) {
    if partialNumbers.count == targetCount {
        print(partialNumbers.map({ String($0) }).joined(separator: " "))
        return
    }
    guard index < numbers.count else { return }
    for next in index..<numbers.count {
        backTracking(next, partialNumbers + [numbers[next]])
    }
}

backTracking(0, [])
