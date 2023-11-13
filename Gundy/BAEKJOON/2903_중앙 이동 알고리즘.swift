let count = Int(readLine()!)!
var side = 2

for _ in 1...count {
    side = side * 2 - 1
}

print(side * side)
