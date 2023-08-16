func solution(_ n:Int, _ stations:[Int], _ w:Int) -> Int{
    var result = 0
    let divisor = 2 * w + 1
    for index in 0...stations.count - 1 {
        let current = index == 0 ? 0 : stations[index - 1] + w
        guard current < n else { break }
        let target = stations[index] - w - 1
        let number = target - current
        if number > 0 {
            result += number % divisor == 0 ? number / divisor : number / divisor + 1
        }
    }
    if stations[stations.count - 1] + w < n {
        let current = stations[stations.count - 1] + w
        let number = n - current
        result += number % divisor == 0 ? number / divisor : number / divisor + 1
    }
    return result
}
