import Foundation

func solution(_ friends:[String], _ gifts:[String]) -> Int {
    var giftLog = [String : [String : Int]]()
    
    for gift in gifts {
        let friends = gift.split(separator: " ").map(String.init)
        
        giftLog[friends[0], default: [:]]["Send", default: 0] += 1
        giftLog[friends[1], default: [:]][friends[0], default: 0] += 1
        giftLog[friends[1]]!["Recieve", default: 0] += 1
    }
    
    var giftCount = Array(repeating: 0, count: friends.count)
    
    for first in 0..<friends.count-1 {
        for second in first+1..<friends.count {
            let firstRecieve = giftLog[friends[first], default: [:]][friends[second], default: 0]
            let secondRecieve = giftLog[friends[second], default: [:]][friends[first], default: 0]
            
            if firstRecieve < secondRecieve {
                giftCount[first] += 1
            } else if firstRecieve > secondRecieve {
                giftCount[second] += 1
            } else {
                let firstPoint = giftLog[friends[first], default: [:]]["Send", default: 0] - giftLog[friends[first], default: [:]]["Recieve", default: 0]
                let secondPoint = giftLog[friends[second], default: [:]]["Send", default: 0] - giftLog[friends[second], default: [:]]["Recieve", default: 0]
                
                if firstPoint > secondPoint {
                    giftCount[first] += 1
                } else if firstPoint < secondPoint {
                    giftCount[second] += 1
                }
            }
        }
    }
    return giftCount.max()!
}
