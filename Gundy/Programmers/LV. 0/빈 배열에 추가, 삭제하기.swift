func solution(_ arr:[Int], _ flag:[Bool]) -> [Int] {
    var result = [Int]()
    for index in 0...arr.count - 1 {
        if flag[index] {
            result += Array(repeating: arr[index], count: arr[index] * 2)
        } else {
            result.removeLast(arr[index])
        }
    }
    return result
}
