func solution(_ plans:[[String]]) -> [String] {
    let plans = plans.map { ($0[0], $0[1].split(separator: ":").compactMap({ Int($0) }), Int($0[2])!) }
    var sortedPlans = plans.sorted { $0.1[0] == $1.1[0] ? $0.1[1] > $1.1[1] : $0.1[0] > $1.1[0] }
    var stack = [(String, Int)]()
    var result = [String]()
    while sortedPlans.count > 1 {
        let plan = sortedPlans.removeLast()
        let nextTime = sortedPlans.last!.1
        var time = nextTime[0] * 60 - plan.1[0] * 60 + nextTime[1] - plan.1[1]
        time -= plan.2
        if time >= 0 {
            result.append(plan.0)
            while time > 0, stack.isEmpty == false {
                let nextPlan = stack.removeLast()
                time -= nextPlan.1
                if time >= 0 {
                    result.append(nextPlan.0)
                } else {
                    stack.append((nextPlan.0, -time))
                }
            }
        } else {
            stack.append((plan.0, -time))
        }
    }
    let plan = sortedPlans.removeLast()
    result.append(plan.0)
    result += stack.reversed().map { $0.0 }
    return result
}
