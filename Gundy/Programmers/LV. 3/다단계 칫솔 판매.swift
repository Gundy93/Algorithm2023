func solution(_ enroll:[String], _ referral:[String], _ seller:[String], _ amount:[Int]) -> [Int] {
    var parents = [String: String]()
    var money = [String: Int]()
    for (name, parent) in zip(enroll, referral) {
        parents[name] = parent
    }
    func recursion(_ name: String, _ price: Int) {
        guard let parent = parents[name] else {
            money[name, default: 0] += price
            return
        }
        let tip = price / 10
        money[name, default: 0] += price - tip
        if tip > 0 {
            recursion(parent, tip)
        }
    }
    for (name, quntity) in zip(seller, amount) {
        recursion(name, quntity * 100)
    }
    return enroll.map { money[$0, default: 0] }
}
