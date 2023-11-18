let count = Int(readLine()!)!
var stack = [Int(readLine()!)!]
var result = 0

for _ in stride(from: 2, through: count, by: 1) {
    let person = Int(readLine()!)!
    
    while let last = stack.last {
        if last < person {
            result += 1
            stack.removeLast()
        } else if last > person {
            result += 1
            
            break
        } else {
            var start = 0
            var end = stack.count - 1
            
            while start < end {
                let index = (start + end + 1) / 2
                
                if stack[index] > last {
                    start = index
                } else {
                    end = index - 1
                }
            }
            result += stack.count - start
            
            break
        }
    }
    stack.append(person)
}

print(result)
