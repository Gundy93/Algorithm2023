let _ = readLine()
let numbers = readLine()!.split(separator: " ").compactMap({ Int($0) }).sorted()
let _ = readLine()
let result = readLine()!.split(separator: " ").compactMap({ Int($0) }).map({ isContains($0) ? 1 : 0 })

for number in result {
    print(number)
}

func isContains(_ number: Int) -> Bool {
    var start = 0
    var end = numbers.count - 1
    while start <= end {
        let half = (start + end) / 2
        switch numbers[half] {
        case ..<number:
            start = half + 1
        case number:
            return true
        default:
            end = half - 1
        }
    }
    return false
}
