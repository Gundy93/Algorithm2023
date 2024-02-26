let input = readLine()!.split(separator: " ").map { Int($0)! }
let numbers = readLine()!.split(separator: " ").map { Int($0)! }
var result = Int.max
var start = 0
var end = 0
var partialSum = numbers[0]

while start <= end {
    if partialSum >= input[1] {
        result = min(result, end - start + 1)
        partialSum -= numbers[start]
        start += 1
    } else {
        end += 1
        guard end < input[0] else { break }
        partialSum += numbers[end]
    }
}

print(result == Int.max ? 0 : result)
