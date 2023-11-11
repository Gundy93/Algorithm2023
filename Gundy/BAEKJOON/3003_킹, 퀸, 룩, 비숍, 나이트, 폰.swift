var pieces = [1, 1, 2, 2, 2, 8]
let input = readLine()!.split(separator: " ").compactMap { Int($0) }

print(zip(pieces, input).map { String($0.0 - $0.1) }.joined(separator: " "))
