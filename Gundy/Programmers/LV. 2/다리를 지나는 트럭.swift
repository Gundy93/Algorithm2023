import Foundation

func solution(_ bridge_length:Int, _ weight:Int, _ truck_weights:[Int]) -> Int {
    var queue = [(Int, Int)]()
    var index = 0
    var partialSum = 0
    var time = 0
    
    for truck in truck_weights {
        while partialSum + truck > weight {
            partialSum -= queue[index].0
            time = max(time, queue[index].1 + bridge_length)
            index += 1
        }
        
        partialSum += truck
        queue.append((truck, time))
        time += 1
    }
    
    return queue.last!.1 + bridge_length + 1
}
