enum Award: Character {
    case star = "*"
    case acha = "#"
}

func solution(_ dartResult:String) -> Int {
    var darts = [(Int, Int, Award?)]()
    var stack = ""
    
    for input in dartResult {
        if input.isNumber {
            stack.append(input)
        } else if ["S", "D", "T"].contains(input) {
            darts.append((Int(String(stack))!, 0, nil))
            stack = ""
            
            switch input {
            case "S":
                darts[darts.count-1].1 = 1
            case "D":
                darts[darts.count-1].1 = 2
            default:
                darts[darts.count-1].1 = 3
            }
        } else {
            darts[darts.count-1].2 = Award(rawValue: input)!
        }
    }
    
    var result = Array(repeating: 0, count: darts.count)
    
    for index in 0..<darts.count {
        result[index] = Array(repeating: darts[index].0, count: darts[index].1).reduce(1, *)
        
        if let award = darts[index].2 {
            if award == .star {
                result[index] *= 2
                
                if index > 0 {
                    result[index-1] *= 2
                }
            } else {
                result[index] *= -1
            }
        }
    }
    
    return result.reduce(0,+)
}
