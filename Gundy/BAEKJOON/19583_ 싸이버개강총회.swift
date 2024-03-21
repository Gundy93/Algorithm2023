func solution() {
    let times = readLine()!.split(separator: " ").map(String.init)
    let start = times[0]
    let end = times[1]
    let streamOut = times[2]
    var chattings = [String : [String]]()
    var result = 0
    
    while let chatting = readLine()?.split(separator: " ").map(String.init) {
        chattings[chatting[1], default: []].append(chatting[0])
    }
    
    for times in chattings.values {
        var isEntered = false
        var isLeft = false
        
        for time in times {
            guard time <= streamOut else { break }
            
            if start >= time {
                isEntered = true
            } else if end <= time {
                isLeft = true
            }
        }
        
        if isEntered,
           isLeft {
            result += 1
        }
    }
    
    print(result)
}

solution()
