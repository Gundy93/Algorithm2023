extension Array {
    subscript(safe index: Index) -> Element? {
        guard index >= 0,
              index < count else { return nil }
        return self[index]
    }
}

struct Queue<T> {
    private var left = [T]()
    private var right: [T]
    var isEmpty: Bool {
        return left.isEmpty && right.isEmpty
    }

    init(_ elements: [T] = []) {
        right = elements
    }

    mutating func enqueue(_ element: T) {
        right.append(element)
    }

    mutating func dequeue() -> T? {
        if left.isEmpty {
            if right.isEmpty {
                return nil
            }
            left = right.reversed()
            right = []
        }
        return left.removeLast()
    }
}

func solution() {
    var isEnd = false
    var input = readLine()!.split(separator: " ").compactMap({ Int($0) })
    func escapeBuilding() {
        let numberOfFloors = input[0]
        let lengthOfFloor = input[1]
        let widthOfFloor = input[2]
        var building = [[[Character]]]()
        for _ in 1...numberOfFloors {
            var floor = [[Character]]()
            for _ in 0...lengthOfFloor {
                let row = readLine()!.map({ $0 })
                if row.isEmpty == false {
                    floor.append(row)
                }
            }
            building.append(floor)
        }
        var visited = Array(repeating: Array(repeating: Array(repeating: -1, count: widthOfFloor), count: lengthOfFloor), count: numberOfFloors)
        var needVisit = Queue<(floor: Int, row: Int, column: Int)>()
        for floor in 0..<numberOfFloors {
            guard needVisit.isEmpty else { break }
            for row in 0..<lengthOfFloor {
                guard needVisit.isEmpty else { break }
                for column in 0..<widthOfFloor {
                    if building[floor][row][column] == "S" {
                        visited[floor][row][column] = 0
                        needVisit.enqueue((floor, row, column))
                        break
                    }
                }
            }
        }
        while needVisit.isEmpty == false {
            let point = needVisit.dequeue()!
            if building[point.floor][point.row][point.column] == "E" {
                print("Escaped in \(visited[point.floor][point.row][point.column]) minute(s).")
                return
            }
            for (floor, (row, column)) in zip([0, 0, 0, 0, 1, -1],
                                              zip([0, 0, 1, -1, 0, 0],
                                                  [1, -1, 0, 0, 0, 0])) {
                if let next = building[safe: point.floor + floor]?[safe: point.row + row]?[safe: point.column + column],
                   next != "#",
                   visited[point.floor + floor][point.row + row][point.column + column] == -1 {
                    visited[point.floor + floor][point.row + row][point.column + column] = visited[point.floor][point.row][point.column] + 1
                    needVisit.enqueue((point.floor + floor, point.row + row, point.column + column))
                }
            }
        }
        print("Trapped!")
    }
    while isEnd == false {
        escapeBuilding()
        input = readLine()!.split(separator: " ").compactMap({ Int($0) })
        if input == [0, 0, 0] {
            isEnd = true
        }
    }
}

solution()
