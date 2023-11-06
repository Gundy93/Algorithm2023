var positive = [0, 1]
var negative = [0, 1]

let target = Int(readLine()!)!

if target == 0 {
    print(0)
    print(0)
}

if abs(target) == 1 {
    print(1)
    print(1)
}

if target > 1 {
    for index in 2...target {
        positive.append((positive[index-1] + positive[index-2]) % 1000000000)
    }
    print(1)
    print(positive[target])
}

if target < -1 {
    for index in 2...abs(target) {
        negative.append((negative[index-2] - negative[index-1]) % 1000000000)
    }
    print(negative[abs(target)] > 0 ? 1 : -1)
    print(abs(negative[abs(target)]))
}
