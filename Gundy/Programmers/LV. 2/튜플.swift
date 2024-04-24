import Foundation

func solution(_ s:String) -> [Int] {
    var checked = Set<Int>()
    var result = [Int]()
    var tuples = s.split(separator: "{").flatMap { $0.split(separator: "}") }.map { $0.split(separator: ",").compactMap { Int($0) } }.filter { $0.isEmpty == false }
    
    for tuple in tuples.sorted(by: { $0.count < $1.count }) {
        for number in tuple {
            if checked.contains(number) == false {
                checked.insert(number)
                result.append(number)
                break
            }
        }
    }
    
    return result
}
