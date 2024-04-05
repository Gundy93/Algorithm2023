let numberOfPeople = Int(readLine()!)!
let people = readLine()!.split(separator: " ").map(String.init).sorted()
let numberOfInput = Int(readLine()!)!
var families = [String: ([String], Int)]()

for _ in 0..<numberOfInput {
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

parents.sort()

var children = [String : [String]]()

while let last =  zeros.popLast() {
    let parents = families[last, default: ([], 0)].0
    
    for person in parents {
        families[person, default: ([], 0)].1 -= 1
        
        if families[person, default: ([], 0)].0.count == parents.count - 1 {
            children[person, default: []].append(last)
        }
        
        if families[person, default: ([], 0)].1 == 0 {
            zeros.append(person)
        }
    }
}

print(
    parents.count,
    parents.joined(separator: " "),
    people.map {
        let children = children[$0, default: []].sorted()
        var result = $0 + " " + String(children.count)
        
        if children.isEmpty == false {
            result += " " + children.joined(separator: " ")
        }
        
        return result
    }.joined(separator: "\n"),
    separator: "\n"
)
