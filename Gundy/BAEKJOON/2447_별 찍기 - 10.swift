func solution() {
    let length = Int(readLine()!)!
    var stars = Array(repeating: Array(repeating: " ", count: length), count: length)
    func recursion(origin point: (row: Int, column: Int), _ length: Int) {
        if length == 3 {
            for deltaY in 0...2 {
                for deltaX in 0...2 {
                    if deltaY == 1,
                       deltaX == 1 {
                        continue
                    }
                    stars[point.row + deltaY][point.column + deltaX] = "*"
                }
            }
        } else {
            for (deltaY, deltaX) in zip([0, 0, 0,
                                         length / 3, length / 3,
                                         (length / 3) * 2, (length / 3) * 2, (length / 3) * 2],
                                        [0, length / 3, (length / 3) * 2,
                                         0, (length / 3) * 2,
                                         0, length / 3, (length / 3) * 2]) {
                recursion(origin: (point.row + deltaY, point.column + deltaX), length / 3)
            }
        }
    }
    recursion(origin: (0, 0), length)
    stars.forEach({ print($0.joined()) })
}

solution()
