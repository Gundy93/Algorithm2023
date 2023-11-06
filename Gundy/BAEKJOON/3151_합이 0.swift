let _ = readLine()
let numbers = readLine()!.split(separator: " ").compactMap({ Int($0) }).sorted()

var result = 0

if numbers.count > 2 {
    for first in 0..<numbers.count - 2 {
        guard numbers[first] <= 0 else { break }
        for second in first + 1..<numbers.count - 1 {
            let partialResult = numbers[first] + numbers[second]
            guard partialResult <= 0 else { break }
            guard let firstIndex = firstIndex(of: -partialResult, biggerThan: second + 1),
                  let lastIndex = lastIndex(of: -partialResult, biggerThan: firstIndex) else { continue }
            result += lastIndex - firstIndex + 1
        }
    }
}

print(result)

func firstIndex(of number: Int, biggerThan startIndex: Int) -> Int? {
    var start = startIndex
    var end = numbers.count - 1
    while start <= end {
        let half = (start + end) / 2
        if numbers[half] >= number {
            end = half - 1
        } else {
            start = half + 1
        }
    }
    guard start < numbers.count else { return nil }
    return numbers[start] == number ? start : nil
}

func lastIndex(of number: Int, biggerThan startIndex: Int) -> Int? {
    var start = startIndex
    var end = numbers.count - 1
    while start <= end {
        let half = (start + end) / 2
        if numbers[half] <= number {
            start = half + 1
        } else {
            end = half - 1
        }
    }
    guard end >= 0 else { return nil }
    return numbers[end] == number ? end : nil
}
