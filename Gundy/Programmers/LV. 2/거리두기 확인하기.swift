func solution(_ places:[[String]]) -> [Int] {
    var result = [Int]()
    
loop: for place in places {
        var room = [[Character]]()
        
        for row in place {
            guard row.contains("PP") == false else {
                result.append(0)
                
                continue loop
            }
            
            room.append(Array(row))
        }
    
        for row in 0...4 {
            for column in 0...4 {
                guard room[row][column] == "P" else { continue }
                
                for (x, y) in zip([0,1,1,1,2],[2,-1,0,1,0]) {
                    guard row + x < 5, column + y >= 0, column + y < 5 else { continue }
                    
                    if room[row + x][column + y] != "P" {
                        continue
                    } else {
                        switch (x, y) {
                        case (0, 2):
                            guard room[row][column + 1] == "X" else {
                                result.append(0)
                                
                                continue loop
                            }
                        case (1, -1):
                            guard room[row][column - 1] == "X",
                                  room[row + 1][column] == "X" else {
                                result.append(0)
                                
                                continue loop
                            }
                        case (1, 0):
                            result.append(0)
                            
                            continue loop
                        case (1, 1):
                            guard room[row][column + 1] == "X",
                                  room[row + 1][column] == "X" else {
                                result.append(0)
                                
                                continue loop
                            }
                        default:
                            guard room[row + 1][column] == "X" else {
                                result.append(0)
                                
                                continue loop
                            }
                        }
                    }
                }
            }
        }
    
    result.append(1)
    }
    
    return result
}
