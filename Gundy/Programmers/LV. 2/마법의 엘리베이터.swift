import Foundation

func solution(_ number:Int, _ limit:Int, _ power:Int) -> Int {
    var count = Array(repeating: 1, count: number+1)
    
    guard number > 1 else { return 1 }
    
    for current in 2...number {
        for multiple in stride(from: current, through: number, by: current) {
            count[multiple] += 1
        }
    }
    
    return count[1...].map { $0 > limit ? power : $0 }.reduce(0, +)
}
