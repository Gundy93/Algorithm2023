let count = Int(readLine()!)!
var times = [(start: Int, end: Int)]()

for _ in 1...count {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    
    times.append((input[0], input[1]))
}

times.sort { $0.end == $1.end ? $0.start < $1.start : $0.end < $1.end }

var result = 0
var last = (start: -1, end: -1)

for index in 0...count - 1 {
    let current = times[index]
    
    guard last.end <= current.start else { continue }
    
    result += 1
    last = current
}

print(result)
