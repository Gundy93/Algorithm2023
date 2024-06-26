func solution(_ a:[Int]) -> Int {
    guard a.count > 1 else { return 0 }
    
    var counter = [Int: [Int]]()
    
    for index in 0...a.count - 1 {
        counter[a[index], default: []].append(index)
    }
    
    let keys = counter.keys.sorted { counter[$0]!.count > counter[$1]!.count }
    var result = 0
    
    for key in keys {
        let indices = counter[key]!
        
        guard indices.count > result / 2 else { break }
        
        var sequence = Set<Int>()
        
        for index in indices {
            if index-1 >= 0,
               a[index-1] != a[index],
               sequence.contains(index-1) == false {
                sequence.insert(index-1)
                sequence.insert(index)
            } else if index+1 < a.count,
                      a[index+1] != a[index] {
                sequence.insert(index)
                sequence.insert(index+1)
            }
        }
        
        result = max(result, sequence.count)
    }
    
    return result
}
