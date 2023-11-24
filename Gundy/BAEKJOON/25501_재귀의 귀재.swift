func recursion(_ text: [String], _ start: Int, _ end: Int, _ count: Int) -> (Bool, Int) {
    guard start < end else { return (true, count) }
    
    guard text[start] == text[end] else { return (false, count) }
    
    return recursion(text, start + 1, end - 1, count + 1)
}

let numberOfCases = Int(readLine()!)!
var result = String()

for _ in 1...numberOfCases {
    let text = readLine()!.map(String.init)
    let (isPalindrome, count) = recursion(text, 0, text.count - 1, 1)
    
    result += "\(isPalindrome ? 1 : 0) \(count)\n"
}

print(result)
