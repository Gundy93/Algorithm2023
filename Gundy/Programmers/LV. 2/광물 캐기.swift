enum Mineral: String {
    case diamond
    case iron
    case stone
}

enum Pick: Int {
    case diamond
    case iron
    case stone

    func mine(_ mineral: Mineral) -> Int {
        switch self {
        case .diamond:
            return 1
        case .iron:
            return mineral == .diamond ? 5 : 1
        case .stone:
            switch mineral {
            case .diamond:
                return 25
            case .iron:
                return 5
            default:
                return 1
            }
        }
    }
}

func solution(_ picks:[Int], _ minerals:[String]) -> Int {
    let minerals = minerals.compactMap(Mineral.init)
    var result = Int.max
    var picks = picks
    var pick = Pick.diamond
    var mineCount = 0
    var index = 0
    var fatigue = 0
    
    func backtracking() {
        guard index < minerals.count else {
            result = min(result, fatigue)
            return
        }
        
        mineCount += 1
        fatigue += pick.mine(minerals[index])
        index += 1
        
        if mineCount == 5 {
            let originPick = pick
            
            for pickNumber in 0..<3 {
                guard picks[pickNumber] > 0 else { continue }
                
                picks[pickNumber] -= 1
                pick = Pick(rawValue: pickNumber)!
                mineCount = 0
                backtracking()
                mineCount = 5
                pick = originPick
                picks[pickNumber] += 1
            }
            
            if picks.allSatisfy({ $0 == 0 }) {
                result = min(result, fatigue)
            }
        } else {
            backtracking()
        }
        index -= 1
        fatigue -= pick.mine(minerals[index])
        mineCount -= 1
    }
    
    for pickNumber in 0..<3 {
        guard picks[pickNumber] > 0 else { continue }
        
        picks[pickNumber] -= 1
        pick = Pick(rawValue: pickNumber)!
        mineCount = 0
        backtracking()
        mineCount = 5
        pick = .diamond
        picks[pickNumber] += 1
    }
    
    return result
}
