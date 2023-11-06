let _ = readLine()
let willSortNumbers = readLine()!.split(separator: " ").compactMap({ Int($0) }).sorted()
let pixedNumbers = readLine()!.split(separator: " ").compactMap({ Int($0) }).sorted(by: >)
print(zip(willSortNumbers, pixedNumbers).map({ $0.0 * $0.1 }).reduce(0, +))
