import Foundation

func solution(_ s:String) -> Bool {
    var pCount = 0
    var yCount = 0
    
    for alphabet in s {
        switch alphabet {
        case "P", "p":
            pCount += 1
        case "Y", "y":
            yCount += 1
        default:
            break
        }
    }
    
    return pCount == yCount
}
