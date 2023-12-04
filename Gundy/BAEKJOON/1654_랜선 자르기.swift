let NK = readLine()!.split(separator: " ").map { Int($0)! }
var lines = [Int]()

for _ in 1...NK[0] {
    lines.append(Int(readLine()!)!)
}

var start = 1
var end = lines.max()!

while start < end {
    let half = (start + end + 1) / 2
    
    if lines.map({ $0 / half }).reduce(0, +) >= NK[1] {
        start = half
    } else {
        end = half - 1
    }
}

print(end)
