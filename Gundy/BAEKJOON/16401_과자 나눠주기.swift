let input = readLine()!.split(separator: " ").map { Int($0)! }
let snacks = readLine()!.split(separator: " ").map { Int($0)! }.sorted(by: >)
var min = 1
var max = Int.max-2

while min < max {
    let mid = (min + max + 1) / 2
    var count = 0
    
    for snack in snacks {
        count += snack / mid
        
        if snack < mid {
            break
        }
    }
    
    if count >= input[0] {
        min = mid
    } else {
        max = mid-1
    }
}

print(min)
