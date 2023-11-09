var students = Set(stride(from: 1, through: 30, by: 1))

stride(from: 1, through: 28, by: 1).forEach { _ in
    students.remove(Int(readLine()!)!)
}
students.sorted().forEach { print($0) }
