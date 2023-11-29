let count = Int(readLine()!)!
var times = [(start: Int, end: Int)]()

for _ in 1...count {
    let meeting = readLine()!.split(separator: " ").map { Int($0)! }
    
    times.append((meeting[0], meeting[1]))
}

times.sort { $0.end == $1.end ? $0.start < $1.start : $0.end < $1.end }

var result = 1
var last = times[0].end

for index in stride(from: 1, to: count, by: 1) {
    guard times[index].start >= last else { continue }
    
    result += 1
    last = times[index].end
}

print(result)
