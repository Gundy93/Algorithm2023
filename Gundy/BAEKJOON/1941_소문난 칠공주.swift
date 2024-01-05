var classRoom = [Character]()

for _ in 1...5 {
    classRoom += Array(readLine()!)
}

var stack = [Int]()
var sCount = 0
var yCount = 0
var result = 0

func backtracking() {
    guard yCount < 4 else { return }
    
    guard stack.count < 7 else {
        validate()
        
        return
    }
    
    let last = stack.last ?? -1
    
    for number in last + 1..<25 {
        stack.append(number)
        
        if classRoom[number] == "S" {
            sCount += 1
            backtracking()
            sCount -= 1
        } else {
            yCount += 1
            backtracking()
            yCount -= 1
        }
        
        stack.removeLast()
    }
}

func validate() {
    var needVisit = [stack.first!]
    var visited = Array(repeating: false, count: 25)
    var count = 1
    
    visited[stack.first!] = true
    
    while let last = needVisit.popLast() {
        for delta in last % 5 == 0 ? [1, -5, 5] : last % 5 == 4 ? [-1, -5, 5] : [-1, 1, -5, 5] {
            let next = last + delta
            
            guard stack.contains(next),
                  visited[next] == false else { continue }
            
            count += 1
            visited[next] = true
            needVisit.append(next)
        }
    }
    
    if count == 7 {
        result += 1
    }
}

backtracking()
print(result)
