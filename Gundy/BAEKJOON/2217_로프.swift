let count = Int(readLine()!)!
var ropes = [Int]()
var result = 0

for _ in 0..<count {
    ropes.append(Int(readLine()!)!)
}

ropes.sort()

for index in 0..<count {
    result = max(result, ropes[index] * (count - index))
}

print(result)
