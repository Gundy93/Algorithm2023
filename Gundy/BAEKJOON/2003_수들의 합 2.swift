let input = readLine()!.split(separator: " ").map { Int($0)! }
let numbers = readLine()!.split(separator: " ").map { Int($0)! }
var partialSum = numbers[0]
var start = 0
var end = 0
var result = 0

loop: while start <= end {
    switch partialSum {
    case input[1]:
        result += 1
        fallthrough
    case ..<input[1]:
        end += 1
        guard end < input[0] else { break loop }
        partialSum += numbers[end]
    default:
        if start == end,
           end+1 < input[0] {
            end += 1
            partialSum += numbers[end]
        }
        partialSum -= numbers[start]
        start += 1
    }
}

print(result)
