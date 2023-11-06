typealias Family = (parents: Int?, children: [Int])
var familyTree: [Int : Family] = [:]

func solution() {
    let numberOfPeople: Int = Int(readLine()!)!
    for number in 1...numberOfPeople {
        familyTree[number] = (nil, [])
    }
    let target: [Int] = readLine()!.split(separator: " ").compactMap({ Int($0) })
    let numberOfInput: Int = Int(readLine()!)!
    for _ in 1...numberOfInput {
        let input: [Int] = readLine()!.split(separator: " ").compactMap({ Int($0) })
        familyTree[input[0]]!.children.append(input[1])
        familyTree[input[1]]!.parents = input[0]
    }
    let result: Int = recursion(target[0], 0, target[1], [target[0]])
    print(result == 0 ? -1 : result)
}

func recursion(_ number: Int, _ count: Int, _ target: Int, _ visited: [Int]) -> Int {
    guard let person = familyTree[number] else { return 0 }
    if person.parents == target ||
        person.children.contains(target) {
        return count + 1
    }
    var nextPeople: [Int] = person.children
    if let parents = person.parents {
        nextPeople.append(parents)
    }
    return nextPeople.filter({ visited.contains($0) == false }).map({ recursion($0, count + 1, target, visited + [$0]) }).reduce(0, +)
}

solution()
