import Foundation

func solution(_ n:Int, _ l:Int64, _ r:Int64) -> Int {
    let l = Int(l) - 1
    let r = Int(r)
    func recursion(_ end: Int) -> Int {
        guard end > 5 else { return end > 2 ? end - 1: end }
        var count = 1
        while Int(pow(5.0, Double(count + 1))) < end {
            count += 1
        }
        let section = end / Int(pow(5.0, Double(count)))
        let remainder = end % Int(pow(5.0, Double(count)))
        let result = section >= 3 ? (section - 1) * Int(pow(4.0, Double(count))) : section * Int(pow(4.0, Double(count)))
        if section == 2 {
            return result
        } else {
            return result + recursion(remainder)
        }
    }
    return recursion(r) - recursion(l)
}
