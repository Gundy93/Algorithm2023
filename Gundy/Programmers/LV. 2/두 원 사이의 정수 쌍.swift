import Foundation

func solution(_ r1:Int, _ r2:Int) -> Int64 {
    let small = Double(r1*r1)
    let big = Double(r2*r2)
    var result = 0
    
    for x in 1...r2 {
        let powX = Double(x*x)
        
        if x < r1 {
            result += Int(sqrt(big - powX) - ceil(sqrt(small - powX))) + 1
        } else {
            result += Int(sqrt(big - powX)) + 1
        }
    }
    
    return Int64(result * 4)
}
