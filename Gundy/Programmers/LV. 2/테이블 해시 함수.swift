func solution(_ data:[[Int]], _ col:Int, _ row_begin:Int, _ row_end:Int) -> Int {
    var data = data.sorted { $0[col - 1] == $1[col - 1] ? $0[0] > $1[0] : $0[col - 1] < $1[col - 1] }
    var remainings = [Int]()
    for index in row_begin...row_end {
        let remaining = data[index - 1].map { $0 % index }.reduce(0, +)
        remainings.append(remaining)
    }
    return remainings.reduce(0, { $0 ^ $1 })
}
