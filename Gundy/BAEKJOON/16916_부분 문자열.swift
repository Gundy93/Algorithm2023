func solution() {
    let origin = readLine()!.map(String.init)
    let sub = readLine()!.map(String.init)
    
    func getFailure() -> [Int] {
        var failure = Array(repeating: 0, count: sub.count)
        var length = 0
        var index = 1
        
        while index < sub.count {
            if sub[index] == sub[length] {
                length += 1
                failure[index] = length
                index += 1
            } else if length == 0 {
                failure[index] = 0
                index += 1
            } else {
                length = failure[length-1]
            }
        }
        
        return failure
    }
    
    let failure = getFailure()
    var originIndex = 0
    var subIndex = 0
    
    while originIndex < origin.count {
        if origin[originIndex] == sub[subIndex] {
            originIndex += 1
            subIndex += 1
            
            if subIndex == sub.count {
                break
            }
        } else if subIndex == 0 {
            originIndex += 1
        } else {
            subIndex = failure[subIndex-1]
        }
    }
    
    print(subIndex == sub.count ? 1 : 0)
}

solution()
