let numberOfCities = Int(readLine()!)!
let numberOfBuses = Int(readLine()!)!
var cities = Array(repeating: Array(repeating: Int.max, count: numberOfCities), count: numberOfCities)
var next = cities
for _ in 1...numberOfBuses {
    let bus = readLine()!.split(separator: " ").map(String.init).compactMap(Int.init)
    let (first, second, cost) = (bus[0] - 1, bus[1] - 1, bus[2])
    cities[first][second] = min(cities[first][second], cost)
    next[first][second] = second
}
for center in 0...numberOfCities - 1 {
    cities[center][center] = 0
    for first in 0...numberOfCities - 1 {
        let firstCost = cities[first][center]
        guard first != center, firstCost < Int.max else { continue }
        for second in 0...numberOfCities - 1 {
            let secondCost = cities[center][second]
            guard second != first, secondCost < Int.max else { continue }
            let cost = firstCost + secondCost
            if cities[first][second] > cost {
                cities[first][second] = cost
                next[first][second] = next[first][center]
            }
        }
    }
}
cities.forEach({ print($0.map({ $0 == Int.max ? "0" : String($0) }).joined(separator: " ")) })
func makePath(_ from: Int, _ to: Int) -> [Int] {
    guard from != to, cities[from][to] != Int.max else { return [] }
    var result = [from + 1]
    var current = next[from][to]
    while current != to {
        result.append(current + 1)
        current = next[current][to]
    }
    result.append(to + 1)
    return result
}
for from in 0...numberOfCities - 1 {
    for to in 0...numberOfCities - 1 {
        let path = makePath(from, to)
        let result = [path.count] + path
        print(result.map(String.init).joined(separator: " "))
    }
}
