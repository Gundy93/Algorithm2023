func solution(_ cap:Int, _ n:Int, _ deliveries:[Int], _ pickups:[Int]) -> Int64 {
    var result = 0
    var deliveries = deliveries
    var pickups = pickups
    
    while deliveries.last == 0 {
        deliveries.removeLast()
    }
    
    while pickups.last == 0 {
        pickups.removeLast()
    }
    
    while deliveries.isEmpty == false || pickups.isEmpty == false {
        result += max(deliveries.count, pickups.count) * 2
        
        var delivery = cap
        var pickup = cap
        while let last = deliveries.last {
            if last > delivery {
                deliveries[deliveries.count - 1] -= delivery
                break
            } else {
                delivery -= last
                deliveries.removeLast()
            }
        }
        while let last = pickups.last {
            if last > pickup {
                pickups[pickups.count - 1] -= pickup
                break
            } else {
                pickup -= last
                pickups.removeLast()
            }
        }
    }
    return Int64(result)
}
