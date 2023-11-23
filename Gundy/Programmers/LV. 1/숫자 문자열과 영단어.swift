func solution(_ s:String) -> Int {
    var result = s
    
    for (word, number) in zip(["zero", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine"], 0...9) {
        result = result.replacingOccurrences(of: word, with: String(number))
    }
    
    return Int(result)!
}
