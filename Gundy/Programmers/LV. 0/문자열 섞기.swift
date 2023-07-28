func solution(_ str1:String, _ str2:String) -> String {
    let firstTexts = str1.map(String.init)
    let secondTexts = str2.map(String.init)
    var result = String()
    for index in 0...firstTexts.count - 1 {
        result += firstTexts[index] + secondTexts[index]
    }
    return result
}
