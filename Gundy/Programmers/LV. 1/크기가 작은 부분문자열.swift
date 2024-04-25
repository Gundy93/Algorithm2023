import Foundation

func solution(_ t:String, _ p:String) -> Int {
    let numbers = t.map(String.init)
    let target = Int(p)!
    var result = 0
    
    for index in 0...t.count-p.count {
        let number = Int(numbers[index...index+p.count-1].joined())!
        
        if number <= target { result += 1 }
    }
    
    return result
}
