import Foundation

func solution(_ babbling:[String]) -> Int {
    let babbling: [Int] =  babbling.compactMap {
        var word = $0
        
        ["aya", "ye", "woo", "ma"].forEach {
            word = word.replacingOccurrences(of: $0, with: "0")
        }
        
        return Int(word)
    }
    
    return babbling.count
}
