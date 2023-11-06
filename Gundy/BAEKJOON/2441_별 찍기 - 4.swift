let times: Int = Int(readLine()!)!
var stars: String = String(repeating: "*", count: times)
var space: String = ""

for _ in 1...times {
    print(space + stars)
    stars.removeLast()
    space += " "
}
