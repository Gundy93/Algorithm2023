import Foundation

func solution(_ n:Int, _ stations:[Int], _ w:Int) -> Int{
    let width = w*2+1
    var current = 0
    var result = 0
    
    for station in stations {
        let empty = station - w - 1 - current
        
        if empty > 0 {
            result += (empty + width-1) / width
        }
        
        current = station + w
    }
    
    let empty = n - current
    
    if empty > 0 {
        result += (empty + width-1) / width
    }

    return result
}
