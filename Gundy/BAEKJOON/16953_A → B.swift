func solution() {
    let input = readLine()!.split(separator: " ").compactMap({ Int($0) })
    let value = input[0]
    let target = input[1]
    var count = -1
    func recursion(_ value: Int, to target: Int, _ times: Int = 1) {
        guard value <= target else { return}
        if value == target {
            count = times
            return
        }
        recursion(value * 2, to: target, times + 1)
        recursion(Int("\(value)1")!, to: target, times + 1)
    }
    recursion(value, to: target)
    print(count)
}

solution()
