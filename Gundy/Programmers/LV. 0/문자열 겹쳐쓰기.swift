func solution(_ my_string:String, _ overwrite_string:String, _ s:Int) -> String {
    let origin = my_string.map(String.init)
    let overwrite = overwrite_string.map(String.init)
    return (stride(from: 0, to: s, by: 1).map { origin[$0] } + overwrite + stride(from: s + overwrite.count, to: origin.count, by: 1).map { origin[$0] }).joined()
}
