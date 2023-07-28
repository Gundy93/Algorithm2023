func solution(_ order:[String]) -> Int {
    return order.map(transform).reduce(0, +)
}

func transform(_ order: String) -> Int {
    if order.contains("cafelatte") {
        return 5000
    }
    return 4500
}
