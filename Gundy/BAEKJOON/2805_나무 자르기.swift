let NM = readLine()!.split(separator: " ").map { Int($0)! }
var trees = readLine()!.split(separator: " ").map { Int($0)! }
var start = 0
var end = trees.max()!

while start < end {
    let half = (start + end + 1) / 2
    
    if trees.map({ $0 > half ? $0 - half : 0 }).reduce(0, +) >= NM[1] {
        start = half
    } else {
        end = half - 1
    }
}

print(end)
