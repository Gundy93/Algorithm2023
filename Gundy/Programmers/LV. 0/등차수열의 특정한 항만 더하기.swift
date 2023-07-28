func solution(_ a:Int, _ d:Int, _ included:[Bool]) -> Int {
    var result = 0
    var number = a
    for isIncluded in included {
        if isIncluded {
            result += number
        }
        number += d
    }
    return result
}
