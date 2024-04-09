import Foundation

func solution(_ s:String) -> Int {
    let words = s.map(String.init)
    var result = s.count
    
    func compress(by count: Int) {
        var stack = [(String, Int)]()
        var temporary = ""
        
        for word in words {
            if temporary.count == count {
                if let last = stack.last,
                   last.0 == temporary {
                    stack[stack.count-1].1 += 1
                } else {
                    stack.append((temporary, 1))
                }
                
                temporary = ""
            }
            
            temporary += word
        }
        
        if let last = stack.last,
           last.0 == temporary {
            stack[stack.count-1].1 += 1
        } else {
            stack.append((temporary, 1))
        }
        
        let text = stack.map { $0.1 == 1 ? $0.0 : String($0.1) + $0.0 }.joined()
        
        result = min(result, text.count)
    }
    
    for count in 1..<s.count/2 + 1 {
        compress(by: count)
    }
    
    return result
}
