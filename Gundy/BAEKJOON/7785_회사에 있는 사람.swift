var hash = Set<Substring>()

for _ in 1...Int(readLine()!)! {
    let command = readLine()!.split(separator: " ")
    switch command[1] {
    case "enter":
        hash.insert(command[0])
    default:
        hash.remove(command[0])
    }
}

for value in hash.sorted(by: >) {
    print(value)
}
