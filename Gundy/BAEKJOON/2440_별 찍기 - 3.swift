let times: Int = Int(readLine()!)!
var stars: String = String(repeating: "*", count: times)

for _ in 1...times {
    print(stars)
    stars.removeLast()
}
