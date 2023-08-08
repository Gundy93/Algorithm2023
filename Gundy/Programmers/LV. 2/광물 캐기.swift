enum Pick {
    case diamond
    case iron
    case stone

    func mine(_ mineral: String) -> Int {
        switch self {
        case .diamond:
            return 1
        case .iron:
            return mineral == "diamond" ? 5 : 1
        case .stone:
            switch mineral {
            case "diamond":
                return 25
            case "iron":
                return 5
            default:
                return 1
            }
        }
    }
}

func solution(_ picks:[Int], _ minerals:[String]) -> Int {
    var result = Int.max
    func recursion(_ now: Pick, _ count: Int, _ picks: [Int], _ minerals: [String], _ fatigue: Int) {
        guard minerals.isEmpty == false else {
            if fatigue < result {
                result = fatigue
            }
            return
        }
        var minerals = minerals
        let fatigue = fatigue + now.mine(minerals.removeLast())
        if count == 4 {
            if picks[0] > 0 {
                var picks = picks
                picks[0] -= 1
                recursion(.diamond, 0, picks, minerals, fatigue)
            }
            if picks[1] > 0 {
                var picks = picks
                picks[1] -= 1
                recursion(.iron, 0, picks, minerals, fatigue)
            }
            if picks[2] > 0 {
                var picks = picks
                picks[2] -= 1
                recursion(.stone, 0, picks, minerals, fatigue)
            }
            if picks.filter({ $0 > 0 }).isEmpty, fatigue < result {
                result = fatigue
            }
        } else {
            recursion(now, count + 1, picks, minerals, fatigue)
        }
    }
    let minerals: [String] = minerals.reversed()
    if picks[0] > 0 {
        var picks = picks
        picks[0] -= 1
        recursion(.diamond, 0, picks, minerals, 0)
    }
    if picks[1] > 0 {
        var picks = picks
        picks[1] -= 1
        recursion(.iron, 0, picks, minerals, 0)
    }
    if picks[2] > 0 {
        var picks = picks
        picks[2] -= 1
        recursion(.stone, 0, picks, minerals, 0)
    }
    return result
}
