func solution(_ q:Int, _ r:Int, _ code:String) -> String {
    let text = code.map(String.init)
    return stride(from: r, to: text.count, by: q).map { text[$0] }.joined()
}
