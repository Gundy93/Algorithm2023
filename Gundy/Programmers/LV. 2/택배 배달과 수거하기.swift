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
        var serving = cap
        var returning = 0
        while deliveries.isEmpty == false {
            if deliveries.last! > serving {
                deliveries[deliveries.count - 1] -= serving
                break
            } else {
                serving -= deliveries.last!
                deliveries.removeLast()
            }
        }
        while pickups.isEmpty == false {
            if pickups.last! > cap - returning {
                pickups[pickups.count - 1] -= cap - returning
                break
            } else {
                returning += pickups.last!
                pickups.removeLast()
            }
        }
    }
    return Int64(result)
}
