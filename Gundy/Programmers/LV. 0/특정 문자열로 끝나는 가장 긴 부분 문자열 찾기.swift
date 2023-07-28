func solution(_ myString:String, _ pat:String) -> String {
    var result = myString
    var deleted = String()
    while deleted.contains(pat) == false {
        deleted = String(result.removeLast()) + deleted
    }
    return result + pat
}
