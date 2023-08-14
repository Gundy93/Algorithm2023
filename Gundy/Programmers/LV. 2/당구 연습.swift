func solution(_ m:Int, _ n:Int, _ startX:Int, _ startY:Int, _ balls:[[Int]]) -> [Int] {
    var result = [Int]()
    for ball in balls {
        var range = Int.max
        let UDWidth = abs(startX - ball[0])
        let upHeight = 2 * n - startY - ball[1]
        let upRange = UDWidth * UDWidth + upHeight * upHeight
        let downHeight = startY + ball[1]
        let downRange = UDWidth * UDWidth + downHeight * downHeight
        if UDWidth == 0 {
            range = startY - ball[1] > 0 ? upRange: downRange
        } else {
            range = min(upRange, downRange)
        }
        let LRHeight = abs(startY - ball[1])
        let leftWidht = startX + ball[0]
        let leftRange = LRHeight * LRHeight + leftWidht * leftWidht
        let rightWidth = 2 * m - startX - ball[0]
        let rightRange = LRHeight * LRHeight + rightWidth * rightWidth
        if LRHeight == 0 {
            range = startX - ball[0] < 0 ? min(range, leftRange): min(range, rightRange)
        } else {
            range = min(range, min(leftRange, rightRange))
        }
        result.append(range)
    }
    return result
}
