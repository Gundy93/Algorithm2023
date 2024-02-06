let count = Int(readLine()!)!
var times = readLine()!.split(separator: " ").map { Int($0)! }.sorted()

for index in 1..<count {
    times[index] += times[index-1]
}

print(times.reduce(0, +))
