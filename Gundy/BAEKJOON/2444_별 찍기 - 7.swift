func solution() {
    let times: Int = Int(readLine()!)!
    var stars: String = "*"
    var space: String = String(repeating: " ", count: times)

    for _ in 1...times {
        space.removeLast()
        print(space + stars)
        stars += "**"
    }

    guard times > 1 else { return }

    stars = String(repeating: "**", count: times - 1)

    for _ in 1...times - 1 {
        space += " "
        stars.removeLast()
        print(space + stars)
        stars.removeLast()
    }
}

solution()
