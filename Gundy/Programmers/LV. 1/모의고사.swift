import Foundation

func solution(_ answers:[Int]) -> [Int] {
    var result = [Int]()
    var maxPoint = 0
    
    for (person, numbers) in [(1, [1, 2, 3, 4, 5]), (2, [2, 1, 2, 3, 2, 4, 2, 5]), (3, [3, 3, 1, 1, 2, 2, 4, 4, 5, 5])] {
        var point = 0
        var index = 0
        
        for answer in answers {
            if answer == numbers[index % numbers.count] { point += 1 }
            
            index += 1
        }
        
        switch point {
        case ..<maxPoint:
            break
        case maxPoint:
            result.append(person)
        default:
            result = [person]
            maxPoint = point
        }
    }
    
    return result
}
