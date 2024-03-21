import Foundation

func solution(_ n:Int, _ l:Int64, _ r:Int64) -> Int {
    var dp = [[Int] : Int]()
    
    func recursion(_ n: Int, _ left: Int, _ right: Int) -> Int {
        if let result = dp[[n, left, right]] {
            return result
        }
        
        guard n > 0 else { return 1 }
        
        let length = Array(repeating: 5, count: n-1).reduce(1, *)
        var count = 0
        var start = -length
        var result = 0
        
        while count < 5 {
            count += 1
            start += length
            
            if count == 3 { continue }
            
            guard start + length > left else { continue }
            
            guard start <= right else { break }
            
            result += recursion(n-1, max(left, start) % length, min(right, start + length-1) % length)
        }
        
        dp[[n, left, right]] = result
        
        return result
    }
    
    return recursion(n, Int(l-1), Int(r-1))
}
