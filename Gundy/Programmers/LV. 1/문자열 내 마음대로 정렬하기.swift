func solution(_ strings:[String], _ n:Int) -> [String] {
    let strings = strings.sorted().map { $0.map(String.init) }
    
    return strings.sorted { $0[n] < $1[n] }.map { $0.joined() }
}
