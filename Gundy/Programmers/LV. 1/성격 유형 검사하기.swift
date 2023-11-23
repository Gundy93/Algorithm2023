func solution(_ survey:[String], _ choices:[Int]) -> String {
    var points = [String: Int]()
    
    for index in 0...survey.count - 1 {
        var question = survey[index]
        var choice = choices[index]
        
        switch question {
        case "TR", "FC", "MJ", "NA":
            choice = 8 - choice
            question = String(question.reversed())
        default:
            break
        }
        
        points[question, default: 0] += choice - 4
    }
    
    return ["RT", "CF", "JM", "AN"].map { String(points[$0, default: 0] == 0 ? $0.sorted().first! : points[$0]! < 0 ? $0.first! : $0.last!) }.joined()
}
