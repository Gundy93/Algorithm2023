let n = Int(readLine()!)!
var students = [(String, [Int])]()

for _ in 0..<n {
    let student = readLine()!.split(separator: " ").map(String.init)
    students.append((student[0], student.compactMap(Int.init)))
}

var result = ""

students
    .sorted { ($0.1[0], $1.1[1], $0.1[2], $1.0) > ($1.1[0], $0.1[1], $1.1[2], $0.0) }
    .forEach { result += $0.0 + "\n" }

print(result)
