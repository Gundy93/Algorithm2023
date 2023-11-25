let numberOfPeople = Int(readLine()!)!
var synergy = [[Int]]()

for _ in 1...numberOfPeople {
    synergy.append(readLine()!.split(separator: " ").map { Int($0)! })
}

var result = Int.max
var team = [Int]()

func backTracking() {
    guard team.count < numberOfPeople / 2 else {
        result = min(result, calculateSynergy())
        
        return
    }
    
    for person in stride(from: team.last != nil ? team.last! + 1 : 0, to: numberOfPeople, by: 1) {
        guard team.contains(person) == false else { continue }
        
        team.append(person)
        backTracking()
        team.removeLast()
    }
}

func calculateSynergy() -> Int {
    var power = 0
    
    for person in team {
        for partner in team {
            power += synergy[person][partner]
        }
    }
    
    let anotherTeam = Set(0...numberOfPeople - 1).subtracting(team)
    var anotherPower = 0
    
    for person in anotherTeam {
        for partner in anotherTeam {
            anotherPower += synergy[person][partner]
        }
    }
    
    return abs(power - anotherPower)
}

backTracking()

print(result)
