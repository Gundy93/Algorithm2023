let input = readLine()!.split(separator: " ").map { Int($0)! }
var lanLines = [Int]()
var maxLine = Int.min

for _ in 0..<input[0] {
    let lanLine = Int(readLine()!)!
    
    lanLines.append(lanLine)
    maxLine = max(maxLine, lanLine)
}

var start = 1
var end = maxLine + 1

while start < end {
    let length = (start + end + 1) / 2
    var count = 0
    
    for lanLine in lanLines {
        count += lanLine / length
    }
    
    if count >= input[1] {
        start = length
    } else {
        end = length - 1
    }
}

print(start)
