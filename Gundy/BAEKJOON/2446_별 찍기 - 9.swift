func solution() {
    let times: Int = Int(readLine()!)!
    var stars: String = String(repeating: "**", count: times)
    var space: String = ""

    for _ in 1...times {
        stars.removeLast()
        print(space + stars)
        stars.removeLast()
        space += " "
    }

    guard times > 1 else { return }

    stars = "*"
    space = String(repeating: " ", count: times - 1)

    for _ in 1...times - 1 {
        stars += "**"
        space.removeLast()
        print(space + stars)
    }
}

solution()
