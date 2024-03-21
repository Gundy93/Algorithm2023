import Foundation

func solution(_ survey:[String], _ choices:[Int]) -> String {
    var points = [Character : Int]()
    
    for (survey, choice) in zip(survey, choices) {
        switch choice {
        case ...3:
            points[survey.first!, default: 0] += abs(4-choice)
        case 4:
            continue
        default:
            points[survey.last!, default: 0] += abs(4-choice)
        }
    }
    
    return String(["RT", "CF", "JM", "AN"].map { $0.sorted { points[$0, default: 0] > points[$1, default: 0] } }.map { $0.first! })
}
