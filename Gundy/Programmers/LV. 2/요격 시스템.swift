func solution(_ targets:[[Int]]) -> Int {
    var targets = targets.sorted { $0[1] == $1[1] ? $0[0] < $0[1] : $0[1] < $1[1] }
    var stack = [[[Int]]]()
    for target in targets {
        if stack.isEmpty == false, stack.last![0][1] > target[0] {
            stack[stack.count - 1].append(target)
        } else {
            stack.append([target])
        }
    }
    return stack.count
}
