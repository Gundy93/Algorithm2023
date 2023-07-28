func solution(_ number:String) -> Int {
    return number.map(String.init).compactMap(Int.init).reduce(0, +) % 9
}
