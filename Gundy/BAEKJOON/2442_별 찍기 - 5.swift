let times: Int = Int(readLine()!)!
var stars: String = "*"
var space: String = String(repeating: " ", count: times)

for _ in 1...times {
    space.removeLast()
    print(space + stars)
    stars += "**"
}
