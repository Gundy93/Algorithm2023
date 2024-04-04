import Foundation

func solution(_ lottos:[Int], _ win_nums:[Int]) -> [Int] {
    let correctCount = Set(win_nums).intersection(lottos).count
    let zeroCount = lottos.filter { $0 == 0 }.count
    return [min(7 - correctCount - zeroCount, 6), min(7 - correctCount, 6)]
}
