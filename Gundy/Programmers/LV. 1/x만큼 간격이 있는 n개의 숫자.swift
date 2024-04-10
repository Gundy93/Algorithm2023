func solution(_ x:Int, _ n:Int) -> [Int64] {
    guard x != 0 else { return Array(repeating: Int64(x), count: n) }
    
    return stride(from: x, through: x * n, by: x).map(Int64.init)
}
