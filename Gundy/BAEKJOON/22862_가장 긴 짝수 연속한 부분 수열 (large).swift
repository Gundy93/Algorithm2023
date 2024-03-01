let input = readLine()!.split(separator: " ").map { Int($0)! }
let numbers = readLine()!.split(separator: " ").map { Int($0)! }
var start = 0
var end = -1
var count = 0
var result = 0

while end < input[0]-1 {
    end += 1
    
    if numbers[end] % 2 == 1 {
        count += 1
        
        while count > input[1],
              start < input[0] {
            if numbers[start] % 2 == 1 {
                count -= 1
            }
            
            start += 1
        }
    }
    
    result = max(result, end - start + 1 - count)
}

print(result)
