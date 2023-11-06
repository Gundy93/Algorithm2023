func solution() {
    var dwarfs: [Int] = []
    for _ in 1...9 {
        let heightOfDwarf: Int = Int(readLine()!)!
        dwarfs.append(heightOfDwarf)
    }
    var indexCombinations: [[Int]] = stride(from: 0, through: 8, by: 1).map({ [$0] })
    while indexCombinations.isEmpty == false {
        let indices: [Int] = indexCombinations.removeLast()
        guard indices.count < 8 else { continue }
        if indices.map({ dwarfs[$0] }).reduce(0, +) == 100,
           indices.count == 7 {
            indices.map({ dwarfs[$0] }).sorted().forEach({ print($0) })
            return
        }
        for index in 0...8 {
            if indices.contains(index) == false {
                indexCombinations.append(indices + [index])
            }
        }
    }
}

solution()
