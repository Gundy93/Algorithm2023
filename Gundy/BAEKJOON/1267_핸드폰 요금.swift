func solution() {
    readLine()
    let callTimes: [Int] = readLine()!.split(separator: " ").compactMap({ Int($0) })
    let yPlanFee: Int = callTimes.map({ calculateYPlan($0) }).reduce(0, +)
    let mPlanFee: Int = callTimes.map({ calculateMPlan($0) }).reduce(0, +)
    if yPlanFee == mPlanFee {
        print("Y M", yPlanFee)
    } else if yPlanFee < mPlanFee {
        print("Y", yPlanFee)
    } else {
        print("M", mPlanFee)
    }
}

func calculateYPlan(_ callTime: Int) -> Int {
    let times: Int = (callTime / 30) + 1
    return 10 * times
}

func calculateMPlan(_ callTime: Int) -> Int {
    let times: Int = (callTime / 60) + 1
    return 15 * times
}

solution()
