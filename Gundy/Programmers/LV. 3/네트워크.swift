import Foundation

func solution(_ n:Int, _ computers:[[Int]]) -> Int {
    var result = 0
    var links = Array(repeating: [Int](), count: n)
    
    for computer in 0..<n {
        for index in 0..<n where computers[computer][index] == 1 {
            links[computer].append(index)
        }
    }
    
    var visited = Set<Int>()
    
    for computer in 0..<n where visited.contains(computer) == false {
        var needVisit = [computer]
        
        while let last = needVisit.popLast() {
            guard visited.contains(last) == false else { continue }
            
            visited.insert(last)
            needVisit += links[last]
        }
        
        result += 1
    }
    
    return result
}
