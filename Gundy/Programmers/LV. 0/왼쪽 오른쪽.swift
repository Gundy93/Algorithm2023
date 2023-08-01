func solution(_ str_list:[String]) -> [String] {
    var stack = [String]()
    for word in str_list {
        if word == "l" {
            return stack
        } else if word == "r" {
            return stack.count + 1 < str_list.count ? Array(str_list[stack.count + 1...str_list.count - 1]) : []
        }
        stack.append(word)
    }
    return []
}
