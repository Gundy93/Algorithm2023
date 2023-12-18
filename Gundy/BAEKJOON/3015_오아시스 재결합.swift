let count = Int(readLine()!)!
var stack = [Int]()
var result = 0

for _ in 1...count {
    let number = Int(readLine()!)!
    
    while let last = stack.last{
        if last < number {
            result += 1
            stack.removeLast()
        } else if last > number {
            result += 1
            
            break
        } else {
            var start = 0
            var end = stack.count - 1
            
            while start < end {
                let mid = (start + end + 1) / 2
                
                if stack[mid] > last {
                    start = mid
                } else {
                    end = mid - 1
                }
            }
            
            result += stack.count - start
            
            break
        }
    }
    
    stack.append(number)
}

print(result)
