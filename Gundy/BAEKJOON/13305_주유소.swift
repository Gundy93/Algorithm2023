let numberOfCities = Int(readLine()!)!
let roads = readLine()!.split(separator: " ").map { Int($0)! }
let cities = readLine()!.split(separator: " ").map { Int($0)! }
var result = roads[0] * cities[0]
var last = cities[0]

for index in stride(from: 1, to: roads.count, by: 1) {
    last = min(last, cities[index])
    result += last * roads[index]
}

print(result)
