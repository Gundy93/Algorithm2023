func makeStars(size: Int) -> [String] {
    guard size > 1 else { return ["*"] }
    
    let stars = makeStars(size: size / 3)
    let space = String(repeating: " ", count: size / 3)
    var result = [String]()
    
    stars.forEach { result.append($0 + $0 + $0) }
    stars.forEach { result.append($0 + space + $0) }
    stars.forEach { result.append($0 + $0 + $0) }
    
    return result
}

print(makeStars(size: Int(readLine()!)!).joined(separator: "\n"))
