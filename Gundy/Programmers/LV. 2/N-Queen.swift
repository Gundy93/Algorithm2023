func solution(_ n:Int) -> Int {
    let height = Array(repeating: false, count: n)
    let firstDiagonal = Array(repeating: false, count: n * 2)
    let secondDiagonal = Array(repeating: false, count: n * 2)
    var result = 0
    func recursion(_ height: [Bool], _ first: [Bool], _ second: [Bool], _ index: Int) {
        guard index < n else {
            result += 1
            return
        }
        for column in 0...n - 1 {
            guard height[column] == false, first[n - index + column] == false, second[index + column] == false else { continue }
            var height = height
            var first = first
            var second = second
            height[column] = true
            first[n - index + column] = true
            second[index + column] = true
            recursion(height, first, second, index + 1)
        }
    }
    recursion(height, firstDiagonal, secondDiagonal, 0)
    return result
}
