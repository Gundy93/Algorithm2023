let input = readLine()!
var count = 1
var last = input.first!

for word in input {
    if word != last {
        count += 1
        last = word
    }
}

print(count / 2)
