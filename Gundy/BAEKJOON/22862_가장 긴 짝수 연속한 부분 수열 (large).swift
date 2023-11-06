let input = readLine()!.split(separator: " ").compactMap({ Int($0) })
let numbers = readLine()!.split(separator: " ").compactMap({ Int($0) })
var start = 0
var end = 0
var count = numbers[0] % 2 == 1 ? 1 : 0
var result = 1 - count

while end < input[0] - 1 {
    end += 1
    if numbers[end] % 2 == 1 {
        count += 1
        while count > input[1] {
            if numbers[start] % 2 == 1 {
                count -= 1
            }
            start += 1
        }
    }
    if result < end - start + 1 - count {
        result = end - start + 1 - count
    }
}

print(result)
