import Foundation

func solution(_ a:[Int]) -> Int {
    var lefts = Array(repeating: Int.max, count: a.count)
    var rights = Array(repeating: Int.max, count: a.count)
    
    for index in 1..<a.count {
        lefts[index] = min(a[index-1], lefts[index-1])
    }
    
    for index in stride(from: a.count-2, through: 0, by: -1) {
        rights[index] = min(a[index+1], rights[index+1])
    }
    
    var result = 0
    
    for index in 0..<a.count {
        if a[index] < lefts[index] || a[index] < rights[index] {
            result += 1
        }
    }
    
    return result
}
