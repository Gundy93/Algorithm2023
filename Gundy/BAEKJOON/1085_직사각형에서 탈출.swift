let input = readLine()!.split(separator: " ").compactMap { Int($0) }
let (x, y) = (input[0], input[1])

print([x, y, input[2] - x, input[3] - y].min()!)
