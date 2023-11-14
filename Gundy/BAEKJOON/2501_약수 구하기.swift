let input = readLine()!.split(separator: " ").compactMap { Int($0) }
var result = [Int]()

for divisor in 1... {
    guard result.count < input[1],
          divisor <= input[0] / 2 else { break }
    
    if input[0] % divisor == 0 {
        result.append(divisor)
    }
}

if result.last != input[0] {
    result.append(input[0])
}

print(result.count >= input[1] ?  result[input[1] - 1] : 0)
