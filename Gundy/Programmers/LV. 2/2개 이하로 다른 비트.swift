import Foundation

func solution(_ numbers:[Int64]) -> [Int64] {
    return numbers.map(f)
}

func f(_ x: Int64) -> Int64 {
    let numbers = Array(String(x, radix: 2))
    var index = numbers.count-1
    
    while index >= 0 {
        if numbers[index] == "0" { break }
        
        index -= 1
    }
    
    return x + (Array(repeating: Int64(2), count: numbers.count-1 - index).reduce(1, *)+1)/2
}
