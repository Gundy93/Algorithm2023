func solution(_ arr:[Int], _ intervals:[[Int]]) -> [Int] {
    return Array(arr[intervals[0][0]...intervals[0][1]] + arr[intervals[1][0]...intervals[1][1]])
}
