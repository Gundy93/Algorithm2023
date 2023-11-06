let numberOfCities = Int(readLine()!)!
let numberOfBuses = Int(readLine()!)!
var cities = Array(repeating: Array(repeating: Int.max, count: numberOfCities), count: numberOfCities)
for _ in 1...numberOfBuses {
    let bus = readLine()!.split(separator: " ").map(String.init).compactMap(Int.init)
    let (first, second, cost) = (bus[0] - 1, bus[1] - 1, bus[2])
    if cities[first][second] == Int.max || cities[first][second] > cost {
        cities[first][second] = cost
    }
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
            }
        }
    }
}
cities.forEach({ print($0.map({ $0 == Int.max ? "0" : String($0) }).joined(separator: " ")) })
