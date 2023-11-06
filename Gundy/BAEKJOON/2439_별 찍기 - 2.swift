let times: Int = Int(readLine()!)!
var star: String = "*"
var space: String = String(repeating: " ", count: times)

for _ in 1...times {
    space.removeLast()
    print(space + star)
    star += "*"
}
