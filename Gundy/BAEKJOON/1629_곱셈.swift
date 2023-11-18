let input = readLine()!.split(separator: " ").map { Int($0)! }

func recursion(_ count: Int) -> Int {
    switch count {
    case 0:
        return 1
    case 1:
        return input[0] % input[2]
    default:
        let next = recursion(count / 2) % input[2]
        if count % 2 == 0 {
            return next * next % input[2]
        } else {
            return next * next % input[2] * input[0] % input[2]
        }
    }
}

print(recursion(input[1]))
