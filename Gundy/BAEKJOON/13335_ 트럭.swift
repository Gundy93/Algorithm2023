let input = readLine()!.split(separator: " ").map { Int($0)! }
let (numberOfTrucks, length, limit) = (input[0], input[1], input[2])
let trucks = readLine()!.split(separator: " ").map { Int($0)! }
var index = 0
var weight = 0
var result = 0
var times = [Int]()

for truck in trucks {
    while weight + truck > limit {
        let first = trucks[index]
        
        result = times[index]
        weight -= first
        index += 1
    }
    
    times.append(result + length)
    result += 1
    weight += truck
    
    while index < times.count,
          result >= times[index] {
        weight -= trucks[index]
        index += 1
    } 
}

result += length
print(result)
