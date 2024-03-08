import Foundation

func solution(_ players:[String], _ callings:[String]) -> [String] {
    var players = players
    var names = [Int : String]()
    var ranks = [String : Int]()
    
    for rank in players.indices {
        names[rank] = players[rank]
        ranks[players[rank]] = rank
    }
    
    for calling in callings {
        guard let index = ranks[calling] else { continue }
        let left = players[index-1]
        ranks[left]? += 1
        ranks[calling]? -= 1
        names[index] = left
        names[index-1] = calling
        
        players.swapAt(index-1, index)
    }
    
    return players
}
