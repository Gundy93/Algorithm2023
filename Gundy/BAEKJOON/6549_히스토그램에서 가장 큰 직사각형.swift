var input = readLine()
var list = [Int]()

while input != "0" {
    let numbers = input!.split(separator: " ").map { Int($0)! }
    let count = numbers[0]
    
    list = [Int](repeating: 0, count: count + 1)
    
    for index in 1...count {
        list[index] = numbers[index]
    }
    
    print(recursion(start: 1, end: count))
    input = readLine()
}

func recursion(start: Int, end: Int) -> Int {
    guard start != end else { return list[start] }
    
    let index = (start + end) / 2
    var left = index
    var right = index + 1
    var minimum = min(list[left], list[right])
    var result = max(minimum * 2,
                     max(recursion(start: start, end: left),
                         recursion(start: right, end: end)))
    
    while start < left || right < end {
        if start < left && right < end {
            if list[left - 1] < list[right + 1] {
                right += 1
                minimum = min(minimum, list[right])
                
            } else {
                left -= 1
                minimum = min(minimum, list[left])
            }
        } else if start < left {
            left -= 1
            minimum = min(minimum, list[left])
        } else if right < end {
            right += 1
            minimum = min(minimum, list[right])
        }
        
        result = max(result, minimum * (right - left + 1))
    }
    
    return result
}
