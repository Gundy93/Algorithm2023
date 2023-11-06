let _ = readLine()
let targetNumbers = readLine()!.split(separator: " ").compactMap({ Int($0) })
let numbers = Set(targetNumbers).sorted()
let result = targetNumbers.compactMap({ firstIndex(of: $0) })

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
