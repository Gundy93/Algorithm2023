import Foundation

func solution(_ line:[[Int]]) -> [String] {
    var points = [(Int, Int)]()
    var left = Int.max
    var right = Int.min
    var top = Int.min
    var bottom = Int.max
    
    for first in 0..<line.count-1 {
        for second in first+1..<line.count {
            let firstNumbers = line[first].map(Double.init)
            let secondNumbers = line[second].map(Double.init)
            let (A, B, C) = (firstNumbers[0], firstNumbers[1], firstNumbers[2])
            let (D, E, F) = (secondNumbers[0], secondNumbers[1], secondNumbers[2])
            let x = (B*F - C*E)/(A*E - B*D)
            let y = (A*F - C*D)/(B*D - A*E)
            
            guard x.isNaN == false,
                  x.isInfinite == false,
                  y.isNaN == false,
                  y.isInfinite == false,
                  x == Double(Int(x)),
                  y == Double(Int(y)) else { continue }
            
            let row = Int(y)
            let column = Int(x)
            
            left = min(left, column)
            right = max(right, column)
            top = max(top, row)
            bottom = min(bottom, row)
            points.append((row, column))
        }
    }
    
    
    
    var result = Array(repeating: Array(repeating: ".", count: right - left + 1), count: top - bottom + 1)
    
    for (row, column) in points {
        let row = top - row
        let column = column - left
        
        result[row][column] = "*"
    }
    
    return result.map { $0.joined() }
}
