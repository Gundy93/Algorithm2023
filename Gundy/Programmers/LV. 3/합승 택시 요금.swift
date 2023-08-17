func solution(_ n:Int, _ s:Int, _ a:Int, _ b:Int, _ fares:[[Int]]) -> Int {
    var prices = Array(repeating: Array(repeating: 100000 * n, count:n + 1), count: n + 1)
    var result = Int.max
    for number in 1...n {
        prices[number][number] = 0
    }
    for fare in fares {
        prices[fare[0]][fare[1]] = fare[2]
        prices[fare[1]][fare[0]] = fare[2]
    }
    for first in 1...n {
        for second in 1...n {
            for third in 1...n {
                if prices[second][third] > prices[second][first] + prices[first][third] {
                    prices[second][third] = prices[second][first] + prices[first][third]
                }
            }
        }
    }
    for c in 1...n {
        let price = prices[s][c] + prices[c][a] + prices[c][b]
        if result > price {
            result = price
        }
    }
    return result
}
