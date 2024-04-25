import Foundation

func solution(_ s:String) -> Bool {
    var stack = ""
    
    for character in s {
        if character == "(" {
            stack.append(character)
        } else {
            guard let last = stack.last,
                  last == "(" else { return false }
            
            stack.removeLast()
        }
    }
    
    return stack.isEmpty
}
