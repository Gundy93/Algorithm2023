let input = readLine()!.split(separator: " ").map(String.init).compactMap(Int.init)
var singerList = [Int: (Set<Int>, Set<Int>)]()
for _ in 1...input[1] {
    let singers = readLine()!.split(separator: " ").map(String.init).compactMap(Int.init)
    let numberOfSingers = singers[0]
    guard numberOfSingers > 1 else { continue }
    for index in 1...numberOfSingers - 1 {
        singerList[singers[index], default: ([], [])].0.insert(singers[index + 1])
        singerList[singers[index + 1], default: ([], [])].1.insert(singers[index])
    }
}
var result = [Int]()
var zeros = [Int]()
for number in 1...input[0] {
    if singerList[number, default: ([], [])].1.isEmpty {
        zeros.append(number)
    }
}
while zeros.isEmpty == false {
    let last = zeros.removeLast()
    result.append(last)
    for number in singerList[last, default: ([], [])].0 {
        singerList[number, default: ([], [])].1.remove(last)
        if singerList[number, default: ([], [])].1.isEmpty {
            zeros.append(number)
        }
    }
}
if result.count == input[0] {
    result.forEach({ print($0) })
} else {
    print(0)
}
