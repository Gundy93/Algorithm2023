let numberOfPeople = Int(readLine()!)!
let people = readLine()!.split(separator: " ").map(String.init).sorted()
let numberOfInput = Int(readLine()!)!
var families = [String: ([String], Int)]()
for _ in stride(from: 1, through: numberOfInput, by: 1){
    let input = readLine()!.split(separator: " ").map(String.init)
    families[input[0], default: ([], 0)].0.append(input[1])
    families[input[1], default: ([], 0)].1 += 1
}
var parents = [String]()
var zeros = [String]()
for person in people {
    let direct = families[person, default: ([], 0)]
    if direct.0.isEmpty {
        parents.append(person)
    }
    if direct.1 == 0 {
        zeros.append(person)
    }
}
var children = [String: [String]]()
while zeros.isEmpty == false {
    let last = zeros.removeLast()
    let parents = families[last, default: ([], 0)].0
    for person in parents {
        families[person, default: ([], 0)].1 -= 1
        let info = families[person, default: ([], 0)]
        if info.0.count == parents.count - 1 {
            children[person, default: []].append(last)
        }
        if families[person, default: ([], 0)].1 == 0 {
            zeros.append(person)
        }
    }
}
print(parents.count)
parents.sort()
print(parents.joined(separator: " "))
var visited = Set<String>()
for person in people {
    let children = children[person, default: []].sorted()
    var result = "\(person) \(children.count)"
    if children.isEmpty == false {
        result += " " + children.joined(separator: " ")
    }
    print(result)
}
