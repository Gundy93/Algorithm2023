import Foundation

func recursion(_ count: Int) -> String {
    guard count > 0 else { return "-" }
    
    let text = recursion(count - 1)
    
    return text + String(repeating: " ", count: text.count) + text
}

var result = String()

while let input = readLine(),
      let count = Int(input) {
    result += recursion(count) + "\n"
}

print(result)
