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
    let origin = readLine()!.filter { $0.isNumber == false }.map(String.init)
    let target = readLine()!.map(String.init)
    
    guard origin.count >= target.count else {
        print(0)
        return
    }
    
    let failure = getFailure(of: target)
    var originIndex = 0
    var targetIndex = 0
    
    while originIndex < origin.count {
        if origin[originIndex] == target[targetIndex] {
            originIndex += 1
            targetIndex += 1
            
            if targetIndex == target.count {
                break
            }
        } else {
            if targetIndex == 0 {
                originIndex += 1
            } else {
                targetIndex = failure[targetIndex-1]
            }
        }
    }
    
    print(targetIndex == target.count ? 1 : 0)
}

solution()
