func solution(_ arr:[Int]) -> [Int] {
    var index = 0
    var result = [Int]()
    while index < arr.count {
        if result.isEmpty || result.last != arr[index] {
            result.append(arr[index])
        } else {
            result.removeLast()
        }
        index += 1
    }
    return result.isEmpty ? [-1] : result
}
