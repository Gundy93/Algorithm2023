import Foundation

func solution(_ wallpaper:[String]) -> [Int] {
    let wallpaper = wallpaper.map(Array.init)
    var lux = Int.max
    var luy = Int.max
    var rdx = Int.min
    var rdy = Int.min
    
    for x in 0..<wallpaper.count {
        for y in 0..<wallpaper[x].count {
            if wallpaper[x][y] == "#" {
                lux = min(lux, x)
                luy = min(luy, y)
                rdx = max(rdx, x+1)
                rdy = max(rdy, y+1)
            }
        }
    }
    
    return [lux, luy, rdx, rdy]
}
