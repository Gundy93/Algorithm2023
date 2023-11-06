let _ = readLine()
let numbers = readLine()!.split(separator: " ").compactMap({ Int($0) }).sorted()
let _ = readLine()
let targetNumbers = readLine()!.split(separator: " ").compactMap({ Int($0) })
var result = [Int]()

for number in targetNumbers {
    guard let firstIndex = firstIndex(of: number),
          let lastIndex = lastIndex(of: number) else {
        result.append(0)
        continue
    }
    result.append(lastIndex - firstIndex + 1)
}

print(result.map({ String($0) }).joined(separator: " "))

func firstIndex(of number: Int) -> Int? {
    var start = 0
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

func lastIndex(of number: Int) -> Int? {
    var start = 0
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
