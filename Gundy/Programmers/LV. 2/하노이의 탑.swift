func solution(_ n:Int) -> [[Int]] {
    func recursion(at: Int, to: Int, number: Int) -> [[Int]] {
        guard number > 1 else { return [[at, to]] }
        return recursion(at: at, to: 6 - at - to, number: number - 1) + [[at, to]] + recursion(at: 6 - at - to, to: to, number: number - 1)
    }
    return recursion(at: 1, to: 3, number: n)
}
