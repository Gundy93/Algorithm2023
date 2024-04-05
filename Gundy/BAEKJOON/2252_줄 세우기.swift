func solution() {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    var previousCount = Array(repeating: 0, count: input[0]+1)
    var next = [Int : [Int]]()
    
    for _ in 0..<input[1] {
        let students = readLine()!.split(separator: " ").map { Int($0)! }
        previousCount[students[1]] += 1
        next[students[0], default: []].append(students[1])
    }
    
    var students = [Int]()
    
    for student in 1...input[0] where previousCount[student] == 0 {
        students.append(student)
    }
    
    var result = [String]()
    
    while let smallStudent = students.popLast() {
        result.append(String(smallStudent))
        
        for next in next[smallStudent, default: []] {
            previousCount[next] -= 1
            
            if previousCount[next] == 0 {
                students.append(next)
            }
        }
    }
    
    print(result.joined(separator: " "))
}

solution()
