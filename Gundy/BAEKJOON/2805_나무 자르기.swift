let input = readLine()!.split(separator: " ").map { Int($0)! }
let trees = readLine()!.split(separator: " ").map { Int($0)! }.sorted(by: >)
var min = 0
var max = Int.max-1

while min < max {
    let mid = (min + max + 1) / 2
    var total = 0
    
    for tree in trees {
        guard tree  > mid else { break }
        
        total += tree - mid
    }
    
    if total >= input[1] {
        min = mid
    } else {
        max = mid-1
    }
}

print(min)
