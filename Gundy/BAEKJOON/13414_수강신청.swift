let input = readLine()!.split(separator: " ").compactMap({ Int($0) })
var studentNumbers = [String]()

for _ in 1...input[1] {
    studentNumbers.append(readLine()!)
}

studentNumbers.reverse()

var students = [String: Int]()
var number = 0

while studentNumbers.isEmpty == false {
    let student = studentNumbers.removeLast()
    students[student] = number
    number += 1
}

let result = students.sorted(by: { $0.value < $1.value })

for index in 0..<input[0] {
    guard index < result.count else { break }
    print(result[index].key)
}
