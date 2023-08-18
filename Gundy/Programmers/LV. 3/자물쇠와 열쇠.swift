func solution(_ key:[[Int]], _ lock:[[Int]]) -> Bool {
    let keys = makeKeys(key)
    var rows = 0
    var count = [Int: Int]()
    var unLock = 0
    for index in 0...lock.count - 1 {
        let row = lock[index]
        var one = 0
        for column in row {
            if column == 0 {
                one += 1
            }
        }
        if (rows == 0 && one == 0) == false {
            rows += 1
        }
        if one == 0 {
            unLock += 1
        }
        count[index] = one
    }
    guard unLock < lock.count else { return true }
    var index = 0
    while count[index] == 0 {
        index += 1
    }
    for key in keys {
        for row in 0...key.count - 1 {
            var column = 0
            loop: while column < key.count, let firstOne = key[row][column...key.count - 1].firstIndex(of: 1) {
                let distanceX = firstOne - lock[index].firstIndex(of: 0)!
                let distanceY = row - index
                for y in 0...lock.count - 1 {
                    for x in 0...lock.count - 1 {
                        var number = lock[y][x]
                        if y + distanceY >= 0, y + distanceY < key.count, x + distanceX >= 0, x + distanceX < key.count {
                            number += key[y + distanceY][x + distanceX]
                        }
                        guard number == 1 else {
                            column = firstOne + 1
                            continue loop
                        }
                    }
                }
                return true
            }
        }
    }
    return false
}

func makeKeys(_ key: [[Int]]) -> [[[Int]]] {
    var result = [key]
    var stack = [[Int]]()
    for column in 0...key.count - 1 {
        var line = [Int]()
        for row in stride(from: key.count - 1, through: 0, by: -1) {
            line.append(key[row][column])
        }
        stack.append(line)
    }
    result.append(stack)
    stack.removeAll()
    for row in stride(from: key.count - 1, through: 0, by: -1) {
        var line = [Int]()
        for column in stride(from: key.count - 1, through: 0, by: -1) {
            line.append(key[row][column])
        }
        stack.append(line)
    }
    result.append(stack)
    stack.removeAll()
    for column in stride(from: key.count - 1, through: 0, by: -1) {
        var line = [Int]()
        for row in 0...key.count - 1 {
            line.append(key[row][column])
        }
        stack.append(line)
    }
    result.append(stack)
    return result
}
