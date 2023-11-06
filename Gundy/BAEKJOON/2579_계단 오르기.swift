extension Array {
    subscript(value index: Index) -> Int where Element == Int {
        guard index >= 0 else { return 0 }
        return self[index]
    }
}

let countOfStairs = Int(readLine()!)!
let stairs: [Int] = {
    var stairs = [Int]()

    for _ in 1...countOfStairs {
        stairs.append(Int(readLine()!)!)
    }

    return stairs
}()
var points = [Int]()

for index in 0..<countOfStairs {
    let point = max(points[value: index - 2] + stairs[index],
                    points[value: index - 3] + stairs[value: index - 1] + stairs[index])
    points.append(point)
}

print(points.last!)
