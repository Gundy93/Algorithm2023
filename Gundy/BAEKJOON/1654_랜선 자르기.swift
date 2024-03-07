let input = readLine()!.split(separator: " ").map { Int($0)! }
var lanCables = [Int]()

for _ in 0..<input[0] {
    lanCables.append(Int(readLine()!)!)
}

var min = 1
var max = Int.max-2

while min < max {
    let length = (min + max + 1) / 2
    var count = 0
    
    for cable in lanCables {
        count += cable / length
    }
    
    if count >= input[1] {
        min = length
    } else {
        max = length-1
    }
}

print(min)
