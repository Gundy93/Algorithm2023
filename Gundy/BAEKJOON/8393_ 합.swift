let number = Int(readLine()!)!

print(stride(from: 1, through: number, by: 1).reduce(0, +))
