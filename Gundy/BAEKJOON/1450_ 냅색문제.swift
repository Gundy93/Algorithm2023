func sum(lessThanOrEqualTo target: Int, by numbers: [Int]) -> [Int] {
    var result = [Int]()
    var partialSum = 0
    var indices = [Int]()
    
    func backtracking() {
        guard target >= partialSum else { return }
        
        if partialSum != 0 {
            result.append(partialSum)
        }
        
        let last = indices.last ?? -1
        
        for index in stride(from: last + 1, to: numbers.count, by: 1) {
            indices.append(index)
            partialSum += numbers[index]
            backtracking()
            partialSum -= numbers[index]
            indices.removeLast()
        }
    }
    
    backtracking()
    
    return result.sorted()
}

let input = readLine()!.split(separator: " ").map { Int($0)! }
let items: [Int] = readLine()!.split(separator: " ").compactMap {
    let weight = Int($0)!
    
    return weight <= input[1] ? weight : nil
}
var result = 1

if items.count > 1 {
    let leftItems = sum(lessThanOrEqualTo: input[1], by: Array(items[0...items.count / 2 - 1]))
    let rightItems = sum(lessThanOrEqualTo: input[1], by: Array(items[items.count / 2...items.count - 1]))
    var left = 0
    var right = rightItems.count - 1
    
    result += leftItems.count + rightItems.count
    
    while left < leftItems.count,
          right >= 0 {
        if leftItems[left] + rightItems[right] > input[1] {
            right -= 1
        } else {
            result += right + 1
            left += 1
        }
    }
} else {
    result += items.count
}

print(result)
