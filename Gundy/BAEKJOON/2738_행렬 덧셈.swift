let input = readLine()!.split(separator: " ").compactMap { Int($0) }
var first = [[Int]]()
var second = [[Int]]()
var result = Array(repeating: Array(repeating: 0, count: input[1]), count: input[0])

for _ in 1...input[0] {
    first.append(readLine()!.split(separator: " ").compactMap { Int($0) })
}

for _ in 1...input[0] {
    second.append(readLine()!.split(separator: " ").compactMap { Int($0) })
}

for row in 0...input[0] - 1 {
    for column in 0...input[1] - 1 {
        result[row][column] = first[row][column] + second[row][column]
    }
}

result.forEach { row in
    print(row.map(String.init).joined(separator: " "))
}
