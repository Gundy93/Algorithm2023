var classRoom = [[Character]]()

for _ in 1...5 {
    classRoom.append(Array(readLine()!))
}

var stack = [Int]()
var lee = 0
var lim = 0
var result = 0

func backtracking() {
    guard lim < 4 else { return }
    
    guard stack.count < 7 else {
        validate()
        
        return
    }
    
    let last = stack.last ?? -1
    
    for number in stride(from: last + 1, to: 25, by: 1) {
        let row = number / 5
        let column = number % 5
        
        stack.append(number)
        
        if classRoom[row][column] == "S" {
            lee += 1
            backtracking()
            lee -= 1
        } else {
            lim += 1
            backtracking()
            lim -= 1
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
