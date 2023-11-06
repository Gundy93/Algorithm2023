let numberOfChildren = Int(readLine()!)!
let children = readLine()!.split(separator: " ").compactMap({ Int($0) })

func findCountOfLongestList(in list: [Int]) -> Int {
    guard list.isEmpty == false else { return 0 }

    var indices = Array(repeating: 0, count: list.count + 1)

    for index in 0..<list.count {
        let number = list[index]
        indices[number] = index
    }

    var result = 0

    for number in 1..<list.count {
        var current = number
        while current < list.count {
            if indices[current] < indices[current + 1] {
                current += 1
            } else {
                break
            }
        }
        if current - number > result {
            result = current - number
        }
    }

    return result + 1
}

print(numberOfChildren - findCountOfLongestList(in: children))
