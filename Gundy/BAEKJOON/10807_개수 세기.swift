var counter = [String: Int]()
let _ = readLine()

readLine()!.split(separator: " ").map(String.init).forEach { counter[$0, default: 0] += 1 }
print(counter[readLine()!, default: 0])
