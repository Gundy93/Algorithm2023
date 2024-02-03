let count = Int(readLine()!)!
var list = [(end: Int, start: Int)]()

for _ in 0..<count {
    let meeting = readLine()!.split(separator: " ").map { Int($0)! }
    
    list.append((meeting[1], meeting[0]))
}

list.sort { $0 < $1 }

var current = list[0].end
var result = 1

for index in 1..<count {
    if current <= list[index].start {
        result += 1
        current = list[index].end
    }
}

print(result)
