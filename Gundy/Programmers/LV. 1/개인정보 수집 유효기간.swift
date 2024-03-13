struct Day: Comparable {
    var year: Int
    var month: Int {
        didSet {
            year += month%12 == 0 ? month/12 - 1 : month/12
            month = month%12 == 0 ? 12 : month%12
        }
    }
    var day: Int
    
    static func < (lhs: Day, rhs: Day) -> Bool {
        (lhs.year, lhs.month, lhs.day) < (rhs.year, rhs.month, rhs.day)
    }
}

func solution(_ today:String, _ terms:[String], _ privacies:[String]) -> [Int] {
    let today: Day = {
        let date = today.split(separator: ".").map { Int($0)! }
        
        return Day(year: date[0], month: date[1], day: date[2])
    }()
    let terms: [String : Int] = {
        var dictionary = [String : Int]()
        
        for term in terms {
            let term = term.split(separator: " ").map(String.init)
            
            dictionary[term[0]] = Int(term[1])!
        }
        
        return dictionary
    }()
    let privacies: [Day] = {
        var dates = [Day]()
        
        for privacy in privacies {
            let privacy = privacy.split(separator: " ").map(String.init)
            let origin = privacy[0].split(separator: ".").map { Int($0)! }
            let term = terms[privacy[1]]!
            var date = Day(year: origin[0], month: origin[1], day: origin[2])
            
            date.month += term
            dates.append(date)
        }
        
        return dates
    }()
    
    var result = [Int]()
    
    for index in 0..<privacies.count {
        if (privacies[index] > today) == false {
            result.append(index+1)
        }
    }
    
    return result
}
