import Foundation

enum Direction: Character {
    case north = "N"
    case south = "S"
    case west = "W"
    case east = "E"
}

func solution(_ park:[String], _ routes:[String]) -> [Int] {
    let park = park.map { $0.map(String.init) }
    var row = 0
    var column = 0
    
    loop: for y in 0..<park.count {
        for x in 0..<park.count {
            if park[y][x] == "S" {
                row = y
                column = x
                break loop
            }
        }
    }
    
    loop: for route in routes {
        let direction = Direction(rawValue: route.first!)!
        let distance = Int(String(route.last!))!
        
        switch direction {
        case .north:
            guard 0..<park.count ~= row - distance else { continue }
            
            for row in row - distance...row-1 {
                guard park[row][column] != "X" else { continue loop }
            }
            
            row -= distance
        case .south:
            guard 0..<park.count ~= row + distance else { continue }
            
            for row in row+1...row + distance {
                guard park[row][column] != "X" else { continue loop }
            }
            
            row += distance
        case .west:
            guard 0..<park[0].count ~= column - distance else { continue }
            
            for column in column - distance...column-1 {
                guard park[row][column] != "X" else { continue loop }
            }
            
            column -= distance
        case .east:
            guard 0..<park[0].count ~= column + distance else { continue }
            
            for column in column+1...column + distance {
                guard park[row][column] != "X" else { continue loop }
            }
            
            column += distance
        }
    }
    
    return [row, column]
}
