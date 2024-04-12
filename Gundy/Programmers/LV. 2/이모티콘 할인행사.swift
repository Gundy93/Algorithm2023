import Foundation

func solution(_ users:[[Int]], _ emoticons:[Int]) -> [Int] {
    var result = [0, 0]
    var discounts = [Int]()
    
    func backtracking() {
        guard discounts.count < emoticons.count else {
            countSales()
            return
        }
        
        for discount in [10, 20, 30, 40] {
            discounts.append(discount)
            backtracking()
            discounts.removeLast()
        }
    }
    
    func countSales() {
        var partialResult = [0, 0]
        
        for user in users {
            var sales = 0
            
            for index in 0..<discounts.count {
                if discounts[index] >= user[0] {
                    sales += emoticons[index] * (100 - discounts[index]) / 100
                }
            }
            
            if sales >= user[1] {
                partialResult[0] += 1
            } else {
                partialResult[1] += sales
            }
        }
        
        if partialResult[0] > result[0] || partialResult[0] == result[0] && partialResult[1] > result[1] {
            result = partialResult
        }
    }
    
    backtracking()
    
    return result
}
