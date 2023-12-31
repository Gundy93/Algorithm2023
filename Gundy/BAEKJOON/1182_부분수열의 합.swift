let input = readLine()!.split(separator: " ").map { Int($0)! }
let maxIndex = input[0] - 1
let target = input[1]
let numbers = readLine()!.split(separator: " ").map { Int($0)! }
var sum = 0
var result = 0

func backtracking(start: Int) {
    if sum == target {
        result += 1
    }
    
    guard start <= maxIndex else { return }
    
    for index in start...maxIndex {
        sum += numbers[index]
        backtracking(start: index + 1)
        sum -= numbers[index]
    }
}

for index in 0...maxIndex {
    sum += numbers[index]
    backtracking(start: index + 1)
    sum -= numbers[index]
}

print(result)
