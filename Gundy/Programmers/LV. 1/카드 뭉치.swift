import Foundation

func solution(_ cards1:[String], _ cards2:[String], _ goal:[String]) -> String {
    var left = 0
    var right = 0
    var index = 0
    
    while index < goal.count {
        if left < cards1.count,
           goal[index] == cards1[left] {
            left += 1
            index += 1
        } else if right < cards2.count,
                  goal[index] == cards2[right] {
            right += 1
            index += 1
        } else {
            return "No"
        }
    }
    
    return "Yes"
}
