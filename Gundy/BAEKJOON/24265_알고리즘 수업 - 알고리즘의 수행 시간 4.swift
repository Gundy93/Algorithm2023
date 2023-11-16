let count = Int(readLine()!)!

print(stride(from: 1, to: count, by: 1).reduce(0, +), 2, terminator: "\n")
