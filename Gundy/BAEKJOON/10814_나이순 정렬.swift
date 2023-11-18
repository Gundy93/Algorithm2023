let count = Int(readLine()!)!
var people = [(age: Int, name: String)]()

for _ in 1...count {
    let person = readLine()!.split(separator: " ").map(String.init)
    
    people.append((Int(person[0])!, person[1]))
}

people.sort { $0.age < $1.age }

var result = String()

for person in people {
    result += "\(person.age) \(person.name)\n"
}

print(result)
