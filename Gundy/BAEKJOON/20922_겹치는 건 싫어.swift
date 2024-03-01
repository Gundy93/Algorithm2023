let input = readLine()!.split(separator: " ").map { Int($0)! }
let numbers = readLine()!.split(separator: " ").map { Int($0)! }
var start = 0
var end = 0
var result = 1
var counter = [Int : Int]()

counter[numbers[0]] = 1

while end < input[0]-1 {
    end += 1
    counter[numbers[end], default: 0] += 1
            
    while counter[numbers[end], default: 0] > input[1] {
        counter[numbers[start]]? -= 1
        start += 1
    }
    
    result = max(result, end - start + 1)
}

print(result)
