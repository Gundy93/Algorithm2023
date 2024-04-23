import Foundation

func solution(_ survey:[String], _ choices:[Int]) -> String {
    var score = [String : Int]()
    
    for (friends, choice) in zip(survey, choices) {
        switch choice {
        case 1...3:
            score[String(friends.first!), default: 0] += abs(choice-4)
        case 5...7:
            score[String(friends.last!), default: 0] += abs(choice-4)
        default:
            break
        }
    }
    
    var result = ""
    
    for friends in [["R", "T"], ["C", "F"], ["J", "M"], ["A", "N"]] {
        let friend = friends.sorted { score[$0] == score[$1] ? $0 < $1 : score[$0, default: 0] > score[$1, default: 0] }.first!
        
        result += friend
    }
    
    return result
}
