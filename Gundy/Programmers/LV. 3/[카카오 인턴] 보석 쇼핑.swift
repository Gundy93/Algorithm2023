func solution(_ gems:[String]) -> [Int] {
    var numberOfGemTypes = Set(gems)
    var start = 0
    var end = 0
    var counter = [String: Int]()
    
    counter[gems[0]] = 1
    
    var result = [1, gems.count]
    
    while end < gems.count - 1,
          start <= end {
        if counter.keys.count == numberOfGemTypes.count {
            if result[1] - result[0] > end - start {
                result = [start + 1, end + 1]
            }
            
            counter[gems[start], default: 0] -= 1
            
            if counter[gems[start]] == 0 {
                counter.removeValue(forKey: gems[start])
            }
            
            start += 1
        } else {
            end += 1
            counter[gems[end], default: 0] += 1
        }
    }
    
    while start <= end,
          counter.keys.count == numberOfGemTypes.count {
        if result[1] - result[0] > end - start {
            result = [start + 1, end + 1]
        }
        
        counter[gems[start], default: 0] -= 1
        
        if counter[gems[start]] == 0 {
            counter.removeValue(forKey: gems[start])
        }
        
        start += 1
    }
    
    return result
}
