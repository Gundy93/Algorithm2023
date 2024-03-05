let input = readLine()!.split(separator: " ").map { Int($0)! }
var students = [String]()
var indices = [String : Int]()

for index in 0..<input[1] {
    let student = readLine()!
    
    if let index = indices[student] {
        students[index] = ""
    }
    
    students.append(student)
    indices[student] = index
}

var result = [String]()
var index = 0

while result.count < input[0],
      index < input[1] {
    if students[index].count == 8 {
        result.append(students[index])
    }
    
    index += 1
}

print(result.joined(separator: "\n"))
