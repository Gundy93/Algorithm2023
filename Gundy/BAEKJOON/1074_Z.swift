func recursion(startNumber: Int, length: Int, row: Int, column: Int) -> Int {
    if length == 1 {
        switch (row, column) {
        case (0, 0):
            return startNumber
        case (0, 1):
            return startNumber + 1
        case (1, 0):
            return startNumber + 2
        default:
            return startNumber + 3
        }
    }
    switch ((row < length / 2), (column < length / 2)) {
    case (true, true):
        return recursion(startNumber: startNumber, length: length / 2, row: row, column: column)
    case (true, false):
        return recursion(startNumber: startNumber + (length * length / 4), length: length / 2, row: row, column: column - (length / 2))
    case (false, true):
        return recursion(startNumber: startNumber + (length * length / 2), length: length / 2, row: row - (length / 2), column: column)
    default:
        return recursion(startNumber: startNumber + (length * length * 3 / 4), length: length / 2, row: row - (length / 2), column: column - (length / 2))
    }
}
let input: [Int] = readLine()!.split(separator: " ").compactMap({ Int($0) })
print(recursion(startNumber: 0,
                length: Array(repeating: 2, count: input[0]).reduce(1, *),
                row: input[1],
                column: input[2]))
