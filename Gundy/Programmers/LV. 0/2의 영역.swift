func solution(_ arr:[Int]) -> [Int] {
    guard let first = arr.firstIndex(of: 2), let last = arr.lastIndex(of: 2) else { return [-1] }
    return Array(arr[first...last])
}
