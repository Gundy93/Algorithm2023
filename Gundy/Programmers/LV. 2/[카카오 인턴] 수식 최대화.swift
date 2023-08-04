func solution(_ expression:String) -> Int64 {
    var elements = [String]()
    var number = String()
    for word in expression.map(String.init) {
        switch word {
        case "+", "-", "*":
            elements += [number, word]
            number = String()
        default:
            number += word
        }
    }
    elements.append(number)
    var result = 0
    for operators in [["+", "-", "*"], ["+", "*", "-"], ["-", "+", "*"], ["-", "*", "+"], ["*", "+", "-"], ["*", "-", "+"]] {
        var expression = elements
        for sign in operators {
            var nextExpression = [String]()
            var index = 0
            while index < expression.count {
                if expression[index] == sign {
                    let lhs = Int(nextExpression.removeLast())!
                    let rhs = Int(expression[index + 1])!
                    switch sign {
                    case "+":
                        nextExpression.append(String(lhs + rhs))
                    case "-":
                        nextExpression.append(String(lhs - rhs))
                    default:
                        nextExpression.append(String(lhs * rhs))
                    }
                    index += 2
                } else {
                    nextExpression.append(expression[index])
                    index += 1
                }
            }
            expression = nextExpression
        }
        if abs(Int(expression[0])!) > result {
            result = abs(Int(expression[0])!)
        }
    }
    return Int64(result)
}
