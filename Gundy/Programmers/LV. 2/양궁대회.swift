import Foundation

func solution(_ n:Int, _ info:[Int]) -> [Int] {
    var result = [[Int]]()
    var winningPoint = 0
    var arrows = Array(repeating: 0, count: 11)
    var count = n
    var current = 0
    
    func comparePoint() -> Int {
        var ryan = 0
        var apeach = 0
        
        for index in 0...9 {
            let point = 10 - index
            
            if arrows[index] > info[index] {
                ryan += point
            } else if info[index] >= arrows[index],
                      info[index] != 0 {
                apeach += point
            }
        }
        
        return ryan - apeach
    }
    
    func backtracking() {
        guard count > 0, current < 10 else {
            if current == 10 {
                arrows[10] += count
            }
            
            let point = comparePoint()
            
            if point > winningPoint {
                winningPoint = point
                result = [arrows]
            } else if point == winningPoint {
                result.append(arrows)
            }
            
            arrows[10] = 0
            
            return
        }
        
        let temporary = current
        
        for index in current..<10 {
            current = index+1
            
            if count >= info[index]+1 {
                count -= info[index]+1
                arrows[index] = info[index]+1
            }
            
            backtracking()
            
            if arrows[index] > 0 {
                count += info[index]+1
                arrows[index] = 0
            }
        }
        
        current = temporary
    }
    
    func mini(_ lhs: [Int], rhs: [Int]) -> Bool {
        for (left, right) in zip(lhs, rhs).reversed() {
            if left > right {
                return true
            } else if left < right {
                return false
            }
        }
        
        return true
    }
    
    backtracking()
    
    return winningPoint > 0 ? result.min(by: mini)! : [-1]
}
