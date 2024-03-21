import Foundation

func solution(_ m:Int, _ n:Int, _ startX:Int, _ startY:Int, _ balls:[[Int]]) -> [Int] {
    var result = [Int]()
    
    for ball in balls {
        var distance = Int.max
        if startX != ball[0] || startY > ball[1] {
            let height = n - startY + n - ball[1]
            let width = abs(startX - ball[0])
            
            distance = min(distance, height * height + width * width)
        }
        
        if startX != ball[0] || startY < ball[1] {
            let height = startY + ball[1]
            let width = abs(startX - ball[0])
            
            distance = min(distance, height * height + width * width)
        }
        
        if startY != ball[1] || startX < ball[0] {
            let height = abs(startY - ball[1])
            let width = startX + ball[0]
            
            distance = min(distance, height * height + width * width)
        }
        
        if startY != ball[1] || startX > ball[0] {
            let height = abs(startY - ball[1])
            let width = m - startX + m - ball[0]
            
            distance = min(distance, height * height + width * width)
        }
        
        result.append(distance)
    }
    
    return result
}
