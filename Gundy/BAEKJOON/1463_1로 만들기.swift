var counter = [0, 0]
var target = Int(readLine()!)!

if target == 1 {
    print(0)
} else {
    for number in 2...target {
        var count = counter[number - 1]
        if number % 2 == 0,
           counter[number / 2] < count {
            count = counter[number / 2]
        }
        if number % 3 == 0,
           counter[number / 3] < count {
            count = counter[number / 3]
        }
        counter.append(count + 1)
    }
    print(counter[target])
}
