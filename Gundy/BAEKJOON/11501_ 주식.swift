let count = Int(readLine()!)!
var result = ""

for _ in 0..<count {
    let days = Int(readLine()!)!
    let costs = readLine()!.split(separator: " ").map { Int($0)! }
    var isChip = Array(repeating: false, count: costs.count)
    var stack = [(costs[0],0)]
    
    for index in 1..<days {
        let cost = costs[index]
        
        while let last = stack.last,
              last.0 < cost {
            stack.removeLast()
            isChip[last.1] = true
        }
        
        stack.append((cost,index))
    }
    
    var count = 0
    var profit = 0
    
    for index in costs.indices {
        if isChip[index] {
            profit -= costs[index]
            count += 1
        } else {
            profit += count * costs[index]
            count = 0
        }
    }
    
    result += String(profit) + "\n"
}

print(result)
