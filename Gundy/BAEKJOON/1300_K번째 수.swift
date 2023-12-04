let size = Int(readLine()!)!
let index = Int(readLine()!)!
var start = 1
var end = index

while start < end {
    let half = (start + end) / 2
    var count = 0
    
    for row in 1...size {
        count += min(half / row, size)
    }
    
    if count < index {
        start = half + 1
    } else {
        end = half
    }
}

print(end)
