var cache = [Int : Int]()
_ = readLine()
let numbers = readLine()!.split(separator: " ").map { Int($0)! }
let sorted = Set(numbers).sorted() 
let result: [Int] = numbers.map { number in
    if let cached = cache[number] {
        return cached
    }
    
    var start = 0
    var end = sorted.count-1
    
    while start < end {
        let mid = (start + end + 1) / 2
        
        if sorted[mid] <= number {
            start = mid
        } else {
            end = mid - 1
        }
    }
    
    cache[number] = start
    
    return start
}

print(result.map(String.init).joined(separator: " "))
