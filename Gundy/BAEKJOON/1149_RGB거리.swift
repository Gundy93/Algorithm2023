extension Array {
    subscript(list index: Index) -> [Int] where Element == [Int] {
        guard index >= 0 else { return [0, 0, 0] }
        return self[index]
    }
}

let numberOfHouse = Int(readLine()!)!
let houses: [[Int]] = {
    var houses = [[Int]]()

    for _ in 1...numberOfHouse {
        houses.append(readLine()!.split(separator: " ").compactMap({ Int($0) }))
    }

    return houses
}()
var prices = [[Int]]()

for index in 0..<numberOfHouse {
    var partialPrices = [Int]()
    let previousPrices = prices[list: index - 1]
    partialPrices.append(min(previousPrices[1], previousPrices[2]) + houses[index][0])
    partialPrices.append(min(previousPrices[0], previousPrices[2]) + houses[index][1])
    partialPrices.append(min(previousPrices[0], previousPrices[1]) + houses[index][2])
    prices.append(partialPrices)
}

print(prices.last!.sorted().first!)
