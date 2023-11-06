let targetCount = readLine()!.split(separator: " ").compactMap({ Int($0) })[1]
let numbers = readLine()!.split(separator: " ").compactMap({ Int($0) }).sorted()
var result = Set<[Int]>()

func backTracking(_ index: Int, _ indices: [Int]) {
    if indices.count == targetCount {
        let numberList = indices.map({ numbers[$0] })
        guard result.contains(numberList) == false else { return }
        result.insert(numberList)
        print(numberList.map({ String($0) }).joined(separator: " "))
        return
    }
    for nextIndex in index..<numbers.count {
        guard indices.contains(nextIndex) == false else { continue }
        backTracking(nextIndex, indices + [nextIndex])
    }
}

backTracking(0, [])
