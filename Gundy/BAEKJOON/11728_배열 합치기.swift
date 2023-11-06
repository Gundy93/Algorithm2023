let _ = readLine()
let leftNumbers = readLine()!.split(separator: " ").compactMap({ Int($0) })
let rightNumbers = readLine()!.split(separator: " ").compactMap({ Int($0) })
var result = ""

for number in (leftNumbers + rightNumbers).sorted() {
    result += "\(number) "
}

result.removeLast()

print(result)
