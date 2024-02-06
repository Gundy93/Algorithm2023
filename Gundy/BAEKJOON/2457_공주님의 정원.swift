let count = Int(readLine()!)!
var flowers = [[Int]]()

for _ in 0..<count {
    let flower = readLine()!.split(separator: " ").map { Int($0)! }
    
    guard flower[0] <= 11,
          flower[2] > 2 else { continue }
    
    flowers.append(flower)
}

flowers.sort { ($0[0],$0[1],$1[2],$1[3]) < ($1[0],$1[1],$0[2],$0[3]) }

var stack = [flowers[0]]
var isValid = true

if (stack[0][0],stack[0][1]) > (3,1) {
    isValid = false
} else {
    for index in 1..<count {
        let flower = flowers[index]
        
        guard let last = stack.last,
              (last[2],last[3]) < (flower[2],flower[3]) else { continue }
        
        if (flower[0],flower[1]) <= (3,1) {
            stack = [flower]
        } else {
            var current = stack
            
            while let last = current.last,
                  (last[2],last[3]) >= (flower[0],flower[1]) {
                current.removeLast()
            }
            
            guard current.count != stack.count else {
                isValid = false
                break
            }
            
            current.append(stack[current.count])
            current.append(flower)
            stack = current
        }
        
        
        if (flower[2],flower[3]) > (11,30) {
            break
        }
    }
    
    if let last = stack.last,
       (last[2],last[3]) < (12,1) {
        isValid = false
    }
}

print(isValid ? stack.count : 0)
