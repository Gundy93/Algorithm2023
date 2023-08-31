func solution(_ scores:[[Int]]) -> Int {
    let target = scores[0]
    var banned = Set<[Int]>()
    var stack = [[Int]]()
    var max = [0, 0]
    for score in scores.sorted(by: { $0[0] == $1[0] ? $0[1] < $1[1] : $0[0] > $1[0] }) {
        if score[1] < max[1] {
            banned.insert(score)
            continue
        }
        if score[1] > max[1] {
            max = score
        }
        stack.append(score)
    }
    guard banned.contains(target) == false else { return -1 }
    var result = 0
    var last = -1
    var count = 1
    for score in stack.sorted(by: { $0[0] + $0[1] > $1[0] + $1[1] }) {
        if last != score[0] + score[1] {
            last = score[0] + score[1]
            result += count
            count = 0
            if last == target[0] + target[1] {
                break
            }
        }
        count += 1
    }
    return result
}
