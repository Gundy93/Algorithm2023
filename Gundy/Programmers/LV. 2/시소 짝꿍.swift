func solution(_ weights:[Int]) -> Int64 {
    let weights = weights.sorted()
    var result = 0
    var count = [Double: Int]()
    for weight in weights {
        count[Double(weight), default: 0] += 1
    }
    for index in 0...weights.count - 2 {
        let weight = weights[index]
        let double = Double(weight)
        for partner in [double, double * 3 / 2, double * 4 / 3, double * 2] {
            guard let number = count[partner] else { continue }
            result += number
        }
        result -= 1
        count[double]! -= 1
    }
    return Int64(result)
}
