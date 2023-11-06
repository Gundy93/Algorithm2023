func solution() {
    let numbers = readLine()!.split(separator: " ").map(String.init).compactMap(Int.init)
    var airplanes = [[Int]]()
    for _ in 1...numbers[1] {
        airplanes.append(readLine()!.split(separator: " ").map(String.init).compactMap(Int.init))
    }
    var roots = Array(stride(from: 0, through: numbers[0], by: 1))
    var result = 0
    func findRoot(_ number: Int) -> Int {
        guard number != roots[number] else { return number }
        return findRoot(roots[number])
    }
    for airplane in airplanes {
        let first = findRoot(airplane[0])
        let second = findRoot(airplane[1])
        guard first != second else { continue }
        roots[second] = first
        result += 1
    }
    print(result)
}
for _ in 1...Int(readLine()!)! {
    solution()
}
