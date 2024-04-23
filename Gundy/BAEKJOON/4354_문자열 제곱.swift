func getFailure(of array: [String]) -> [Int] {
    var failure = Array(repeating: 0, count: array.count)
    var index = 1
    var length = 0
    
    while index < array.count {
        if array[index] == array[length] {
            length += 1
            failure[index] = length
            index += 1
        } else {
            if length == 0 {
                failure[index] = 0
                index += 1
            } else {
                length = failure[length-1]
            }
        }
    }
    
    return failure
}

func solution() {
    var result = ""
    
    while let text = readLine()?.map(String.init),
          text != ["."] {
        let failure = getFailure(of: text)
        let number = text.count-failure.last!
        
        result += String(text.count%number == 0 ? text.count/number : 1) + "\n"
    }
    
    print(result)
}

solution()
