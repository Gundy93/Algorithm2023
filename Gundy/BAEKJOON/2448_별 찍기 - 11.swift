func makeStars(size: Int) -> [String] {
    guard size > 3 else {
        return ["  *  ", " * * ", "*****"]
    }
    
    let stars = makeStars(size: size / 2)
    let space = String(repeating: " ", count: size / 2)
    var result = [String]()
    
    stars.forEach { result.append(space + $0 + space) }
    stars.forEach { result.append($0 + " " + $0) }
    
    return result
}

print(makeStars(size: Int(readLine()!)!).joined(separator: "\n"))
