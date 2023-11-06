func solution(_ times: Int) {
    for _ in 1...times {
        let yuts: [Int] = readLine()!.split(separator: " ").compactMap({ Int($0) })
        var yutCount: [Int : Int] = [:]
        for yut in yuts {
            yutCount[yut, default: 0] += 1
        }
        switch yutCount[0] {
        case 1:
            print("A")
        case 2:
            print("B")
        case 3:
            print("C")
        case 4:
            print("D")
        default:
            print("E")
        }
    }
}

solution(3)
