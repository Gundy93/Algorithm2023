let count = Int(readLine()!)!
var points = [Int]()

for _ in 0..<count-1 {
    points.append(Int(readLine()!)!)
}

var current = Int(readLine()!)!
var result = 0

while let last = points.popLast() {
    if last >= current {
        result += last - current + 1
        current = current - 1
    } else {
        current = last
    }
}

print(result)
