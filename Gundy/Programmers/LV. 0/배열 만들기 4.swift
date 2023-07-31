func solution(_ arr:[Int]) -> [Int] {
    var result = [Int]()
    var index = 0
    while index < arr.count {
        if result.isEmpty || result.last! < arr[index] {
            result.append(arr[index])
            index += 1
        } else {
            result.removeLast()
        }
    }
    return result
}
