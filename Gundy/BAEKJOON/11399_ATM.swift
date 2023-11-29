let count = Int(readLine()!)!
var times = readLine()!.split(separator: " ").map { Int($0)! }.sorted()

for index in stride(from: 1, to: count, by: 1) {
    times[index] += times[index - 1]
}

print(times.reduce(0, +))
