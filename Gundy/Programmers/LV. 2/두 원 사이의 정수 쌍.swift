import Foundation

func solution(_ r1:Int, _ r2:Int) -> Int64 {
    var result = 0
    for x in 1...r2 {
        let start = x <= r1 ? Int(ceil(sqrt(Double(r1 * r1 - x * x)))) : 0
        let end = Int(floor(sqrt(Double(r2 * r2 - x * x))))
        result += end - start + 1
    }
    return Int64(result * 4)
}
