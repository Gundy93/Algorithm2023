func solution(_ a:String, _ b:String) -> String {
    var first = a.map(String.init)
    var second = b.map(String.init)
    var result = String()
    var remaining = 0
    while first.isEmpty == false || second.isEmpty == false {
        var number = remaining
        if first.isEmpty == false {
            number += Int(first.removeLast())!
        }
        if second.isEmpty == false {
            number += Int(second.removeLast())!
        }
        result = String(number % 10) + result
        remaining = number / 10
    }
    return remaining == 0 ? result : String(remaining) + result
}
