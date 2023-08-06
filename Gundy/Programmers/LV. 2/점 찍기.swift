import Foundation

func solution(_ k:Int, _ d:Int) -> Int64 {
    var result: Int64 = 0
    let doubleD = Double(d * d)
    for x in stride(from: 0, through: d, by: k) {
        let duobleX = Double(x * x)
        let maximumY = Int(sqrt(doubleD - duobleX))
        result += Int64(maximumY / k) + 1
    }
    return result
}
