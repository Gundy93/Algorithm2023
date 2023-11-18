import Foundation

let count = Int(readLine()!)!

for _ in 1...count {
    let commands = readLine()!
    var count = Int(readLine()!)!
    var numbers = readLine()!.components(separatedBy: ["[", ",", "]"]).compactMap(Int.init)
    var left = 0
    var right = count - 1
    var isForward = true
    var isValid = true
    
    for command in commands {
        switch command {
        case "R":
            isForward.toggle()
        default:
            guard count > 0 else {
                isValid = false
                
                break
            }
            
            if isForward {
                left += 1
            } else {
                right -= 1
            }
            
            count -= 1
        }
    }
    
    if isValid {
        var result = stride(from: left, through: right, by: 1).map { String(numbers[$0]) }
        
        if isForward == false {
            result = result.reversed()
        }
        
        print("[" + result.joined(separator: ",") + "]")
    } else {
        print("error")
    }
}
