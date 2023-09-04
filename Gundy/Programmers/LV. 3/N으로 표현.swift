func solution(_ N:Int, _ number:Int) -> Int {
    var result = 9
    func recursion(_ now: Int, _ count: Int) {
        guard now != number else {
            result = min(count, result)
            return
        }
        guard count < result else { return }
        for index in stride(from: 1, through: 8 - count, by: 1) {
            let multiple = Int(String(repeating: Character(String(N)), count: index))!
            recursion(now + multiple, count + index)
            recursion(now - multiple, count + index)
            recursion(now * multiple, count + index)
            recursion(now / multiple, count + index)
        }
    }
    recursion(0, 0)
    return result == 9 ? -1 : result
}
