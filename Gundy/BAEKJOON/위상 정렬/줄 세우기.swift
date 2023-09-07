let input = readLine()!.split(separator: " ").map(String.init).compactMap(Int.init)
var students = [Int: (Set<Int>, Set<Int>)]()
for _ in 1...input[1] {
    let numbers = readLine()!.split(separator: " ").map(String.init).compactMap(Int.init)
    students[numbers[0], default: ([], [])].0.insert(numbers[1])
    students[numbers[1], default: ([], [])].1.insert(numbers[0])
}
var zeros = [Int]()
var result = String()
for number in 1...input[0] {
    if students[number, default: ([], [])].1.isEmpty {
        zeros.append(number)
    }
}
while zeros.isEmpty == false {
    let last = zeros.removeLast()
    result += result.isEmpty ? String(last) : " \(last)"
    for target in students[last, default: ([], [])].0 {
        students[target, default: ([], [])].1.remove(last)
        if students[target, default: ([], [])].1.isEmpty {
            zeros.append(target)
        }
    }
}
print(result)
