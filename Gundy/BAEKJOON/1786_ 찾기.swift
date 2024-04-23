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
    let origin = readLine()!.map(String.init)
    let target = readLine()!.map(String.init)
    let failure = getFailure(of: target)
    var originIndex = 0
    var targetIndex = 0
    var result = [Int]()
    
    while originIndex < origin.count {
        if origin[originIndex] == target[targetIndex] {
            originIndex += 1
            targetIndex += 1
            
            if targetIndex == target.count {
                result.append(originIndex - targetIndex + 1)
                targetIndex = failure[targetIndex-1]
            }
        } else {
            if targetIndex == 0 {
                originIndex += 1
            } else {
                targetIndex = failure[targetIndex-1]
            }
        }
    }
    
    print(result.count, result.map(String.init).joined(separator: " "), separator: "\n")
}

solution()
