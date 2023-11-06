let countOfNumber = Int(readLine()!)!
let numbers = readLine()!.split(separator: " ").compactMap({ Int($0) })
var result = numbers[0]
var partialResult = numbers[0]

for index in 1..<countOfNumber {
    if partialResult < 0 {
        partialResult = numbers[index]
    } else {
        partialResult += numbers[index]
    }
    if partialResult > result {
        result = partialResult
    }
}

print(result)
