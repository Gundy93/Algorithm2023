import Foundation

func solution(_ w:Int, _ h:Int) -> Int64 {
    var result = 0
    
    for row in 1...h {
        result += (h - row) * w / h
    }

    return Int64(result*2)
}
