func solution(_ n:Int, _ build_frame:[[Int]]) -> [[Int]] {
    var frames = [[Int]: Set<Int>]()
    func validate(_ x: Int, _ y: Int, _ frame: Int) -> Bool {
        if frame == 0 {
            return y == 0 || frames[[x - 1, y], default: []].contains(1) || frames[[x, y], default: []].contains(1) || frames[[x, y - 1], default: []].contains(0)
        } else {
            return (frames[[x - 1, y], default: []].contains(1) && frames[[x + 1, y], default: []].contains(1)) || frames[[x, y - 1], default: []].contains(0) || frames[[x + 1, y - 1], default: []].contains(0)
        }
    }
    for order in build_frame {
        let x = order[0]
        let y = order[1]
        let frame = order[2]
        let command = order[3]
        switch command {
        case 1:
            if validate(x, y, frame) {
                frames[[x, y], default: []].insert(frame)
            }
        default:
            frames[[x, y], default: []].remove(frame)
            var isValid = true
            for dx in 0...2 {
                for dy in 0...2 {
                    guard frames[[x + dx - 1, y + dy - 1], default: []].allSatisfy({ validate(x + dx - 1, y + dy - 1, $0) }) else {
                        isValid = false
                        break
                    }
                }
            }
            guard isValid else {
                frames[[x, y], default: []].insert(frame)
                continue
            }
        }
    }
    var result = [[Int]]()
    for x in 0...n {
        for y in 0...n {
            if frames[[x, y], default: []].contains(0) {
                result.append([x, y, 0])
            }
            if frames[[x, y], default: []].contains(1) {
                result.append([x, y, 1])
            }
        }
    }
    return result
}
