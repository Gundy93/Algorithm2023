var register = [0: 1]
let input = readLine()!.split(separator: " ").compactMap {
    return Int($0)
}

func recursion(_ index: Int) -> Int {
    guard let number = register[index] else {
        register[index] = recursion(index / input[1]) + recursion(index / input[2])
        return register[index]!
    }
    return number
}

print(recursion(input[0]))
