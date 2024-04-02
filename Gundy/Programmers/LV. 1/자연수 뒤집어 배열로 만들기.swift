func solution(_ n:Int64) -> [Int] {
    return String(Int(n)).reversed().map(String.init).compactMap(Int.init)
}
