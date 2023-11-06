let number: Int = Int(readLine()!)!
var result: String = (Array(repeating: 2, count: number).reduce(1, *) - 1).description
recursion(number, to: 3, from: 1, other: 2)
print(result)

func recursion(_ number: Int, to target: Int, from section: Int, other: Int) {
    guard number > 1 else {
        result += "\n\(section) \(target)"
        return
    }
    recursion(number - 1, to: other, from: section, other: target)
    result += "\n\(section) \(target)"
    recursion(number - 1, to: target, from: other, other: section)
}
