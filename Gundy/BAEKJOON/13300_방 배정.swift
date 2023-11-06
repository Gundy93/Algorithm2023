func solution() {
    let input: [Int] = readLine()!.split(separator: " ").compactMap({ Int($0) })
    var students: [[Int]] = []
    for _ in 1...input[0] {
        students.append(readLine()!.split(separator: " ").compactMap({ Int($0) }))
    }
    var result: Int = 0
    for grade in 1...6 {
        let students: [Int] = students.filter({ $0[1] == grade }).map({ $0[0] })
        let numberOfWomen: Int = students.filter({ $0 == 0 }).count
        let numberOfMen: Int = students.count - numberOfWomen
        result += (numberOfWomen / input[1]) + (numberOfWomen % input[1] == 0 ? 0 : 1)
        result += (numberOfMen / input[1]) + (numberOfMen % input[1] == 0 ? 0 : 1)
    }
    print(result)
}

solution()
