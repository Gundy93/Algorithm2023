import Foundation

func solution(_ today:String, _ terms:[String], _ privacies:[String]) -> [Int] {
    let today = toDays(today)
    var termDays = [String : Int]()
    
    for term in terms {
        let term = term.split(separator: " ").map(String.init)
        
        termDays[term[0]] = Int(term[1])! * 28
    }
    
    var result = [Int]()
    
    for index in 0..<privacies.count {
        let privacy = privacies[index].split(separator: " ").map(String.init)
        let due = toDays(privacy[0]) + termDays[privacy[1]]!
        
        if due <= today { result.append(index+1) }
    }
    
    return result
}

func toDays(_ string: String) -> Int {
    let numbers = string.split(separator: ".").map { Int($0)! }
    
    return numbers[0] * 12 * 28 + numbers[1] * 28 + numbers[2]
}
