let input: [Int] = readLine()!.split(separator : " ").compactMap({ Int($0) })
let number: Int = input[0]
let times: Int = input[1]
let dividing: Int = input[2]
print(recursivelyMultiply(times))

func recursivelyMultiply(_ count: Int) -> Int {
    guard count > 0 else { return 1 }
    let temporary: Int = recursivelyMultiply(count / 2)
    switch count % 2 {
    case 1:
        return temporary % dividing * temporary % dividing * number % dividing
    default:
        return temporary % dividing * temporary % dividing
    }
}
