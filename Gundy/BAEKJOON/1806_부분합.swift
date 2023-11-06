let input = readLine()!.split(separator: " ").compactMap({ Int($0) })
var result = 100000001
var numbers = readLine()!.split(separator: " ").compactMap({ Int($0) })

var count = 1
var partialResult = numbers[0]
if partialResult >= input[1] {
    result = 1
}
var left = 0
var right = 0

while right < numbers.count - 1 {
    right += 1
    count += 1
    partialResult += numbers[right]
    while partialResult >= input[1],
          count >= 2 {
        if count < result {
            result = count
        } else {
            partialResult -= numbers[left]
            left += 1
            count -= 1
        }
    }
}

if partialResult >= input[1],
   count < result {
    result = count
}

print(result == 100000001 ? 0 : result)
