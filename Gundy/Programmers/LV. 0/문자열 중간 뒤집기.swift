func solution(_ my_string:String, _ s:Int, _ e:Int) -> String {
    let text = my_string.map(String.init)
    var result = String()
    if s > 0 {
        result += text[0...s - 1].joined()
    }
    result += text[s...e].reversed().joined()
    return e < text.count - 1 ? result + text[e + 1...text.count - 1].joined() : result
}
