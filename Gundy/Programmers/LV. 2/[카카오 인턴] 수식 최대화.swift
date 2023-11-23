func solution(_ expression:String) -> Int64 {
    var expression = expression.map(String.init)
    var stack = String()
    var elements = [String]()
    
    for word in expression {
        guard Int(word) != nil else {
            elements.append(stack)
            elements.append(word)
            stack.removeAll()
            
            continue
        }
        
        stack += word
    }
    
    elements.append(stack)
    
    func calculate(_ elements: [String], _ sign: String) -> [String] {
        var elements = elements
        
        switch sign {
        case "+":
            while let firstIndex = elements.firstIndex(of: sign) {
                elements[firstIndex - 1] = String(Int(elements[firstIndex - 1])! + Int(elements[firstIndex + 1])!)
                elements = Array(elements[0...firstIndex - 1]) + stride(from: firstIndex + 2, to: elements.count, by: 1).map { elements[$0] }
            }
        case "-":
            while let firstIndex = elements.firstIndex(of: sign) {
                elements[firstIndex - 1] = String(Int(elements[firstIndex - 1])! - Int(elements[firstIndex + 1])!)
                elements = Array(elements[0...firstIndex - 1]) + stride(from: firstIndex + 2, to: elements.count, by: 1).map { elements[$0] }
            }
        default:
            while let firstIndex = elements.firstIndex(of: sign) {
                elements[firstIndex - 1] = String(Int(elements[firstIndex - 1])! * Int(elements[firstIndex + 1])!)
                elements = Array(elements[0...firstIndex - 1]) + stride(from: firstIndex + 2, to: elements.count, by: 1).map { elements[$0] }
            }
        }
        
        return elements
    }
    
    var result = 0
    
    for first in ["+", "-", "*"] {
        let firstResult = calculate(elements, first)
        
        for second in ["+", "-", "*"] {
            guard first != second else { continue }
            
            let secondResult = calculate(firstResult, second)
            
            for third in ["+", "-", "*"] {
                guard first != third, second != third else { continue }
                
                result = max(result, abs(Int(calculate(secondResult, third)[0])!))
            }
        }
    }
    
    return Int64(result)
}
