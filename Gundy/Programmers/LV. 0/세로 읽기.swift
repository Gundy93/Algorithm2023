func solution(_ my_string:String, _ m:Int, _ c:Int) -> String {
    let text = my_string.map(String.init)
    return stride(from: c - 1, to: text.count, by: m).map { text[$0] }.joined()
}
