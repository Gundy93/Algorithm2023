func solution(_ numbers:[Int], _ hand:String) -> String {
    let numberPad = [[1,2,3],[4,5,6],[7,8,9],[10,0,11]]
    var points = [Int: (row: Int, column: Int)]()
    
    for row in 0...3 {
        for column in 0...2 {
            let number = numberPad[row][column]
                
            points[number] = (row, column)
        }
    }
    
    var distances = Array(repeating: Array(repeating: 0, count: 10), count: 12)
    
    for start in 0...11 {
        for end in 0...9 {
            let startPoint = points[start]!
            let endPoint = points[end]!
            let distance = abs(startPoint.row - endPoint.row) + abs(startPoint.column - endPoint.column)
            
            distances[start][end] = distance
        }
    }
    
    var result = String()
    var left = 10
    var right = 11
    
    for number in numbers {
        if Set([1,4,7]).contains(number) {
            result += "L"
            left = number
            
            continue
        } else if Set([3,6,9]).contains(number) {
            result += "R"
            right = number
            
            continue
        }
        
        if distances[left][number] == distances[right][number] {
            if hand == "left" {
                result += "L"
                left = number
            } else {
                result += "R"
                right = number
            }
        } else {
            if distances[left][number] < distances[right][number] {
                result += "L"
                left = number
            } else {
                result += "R"
                right = number
            }
        }
    }
    
    return result
}
