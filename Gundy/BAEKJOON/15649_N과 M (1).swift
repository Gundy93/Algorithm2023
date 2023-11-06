let input: [Int] = readLine()!.split(separator: " ").compactMap({ Int($0) })
backTracking(numbers: [], to: input[0], count: input[1])
func backTracking(numbers: [Int], to limit: Int, count: Int) {
    if numbers.count == count {
        print(numbers.map({ $0.description }).joined(separator: " "))
        return
    }
    for number in 1...limit {
        guard numbers.contains(number) == false else { continue }
        backTracking(numbers: numbers + [number], to: limit, count: count)
    }
}
