import Foundation

func solution(_ dirs:String) -> Int {
    var x = 0
    var y = 0
    var visited = Set<Set<[Int]>>()
    
    for direction in dirs {
        let origin = [x, y]
        switch direction {
        case "U":
            y = min(y+1, 5)
        case "D":
            y = max(y-1, -5)
        case "R":
            x = min(x+1, 5)
        default:
            x = max(x-1, -5)
        }
        
        guard [x, y] != origin else { continue }
        
        visited.insert([[x, y], origin])
    }
    
    return visited.count
}
