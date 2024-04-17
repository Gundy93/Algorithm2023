import Foundation

func solution(_ n:Int) -> [[Int]] {
    var result = [[Int]]()
    
    func recursion(_ from: Int, _ to: Int, _ number: Int) {
        guard number > 1 else {
            result.append([from, to])
            
            return
        }
        
        recursion(from, 6 - from - to, number-1)
        result.append([from, to])
        recursion(6 - from - to, to, number-1)
    }
    
    recursion(1, 3, n)
    
    return result
}
