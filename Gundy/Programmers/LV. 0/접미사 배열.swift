func solution(_ my_string:String) -> [String] {
    var text = my_string.map(String.init)
    var result = [String]()
    var suffix = String()
    while text.isEmpty == false {
        suffix = text.removeLast() + suffix
        result.append(suffix)
    }
    return result.sorted()
}
