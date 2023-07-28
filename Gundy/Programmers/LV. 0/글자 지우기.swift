func solution(_ my_string:String, _ indices:[Int]) -> String {
    var text = my_string.map(String.init)
    indices.forEach { text[$0] = "" }
    return text.joined()
}
