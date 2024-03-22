import Foundation

func solution(_ clothes:[[String]]) -> Int {
    var count = [String : Int]()
    
    clothes.forEach { count[$0[1], default: 1] += 1 }
    
    return count.values.reduce(1, *)-1
}
