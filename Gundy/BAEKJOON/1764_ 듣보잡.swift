let input = readLine()!.split(separator: " ").map { Int($0)! }
var listA = Set<String>()
var listB = Set<String>()

for _ in 1...input[0] {
    listA.insert(readLine()!)
}

for _ in 1...input[1] {
    listB.insert(readLine()!)
}

let result = listA.intersection(listB)

print(result.count)

for person in result.sorted() {
    print(person)
}
