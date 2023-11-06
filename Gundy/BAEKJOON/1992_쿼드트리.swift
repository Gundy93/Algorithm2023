var image = [[String]]()

for _ in 1...Int(readLine()!)! {
    image.append(readLine()!.map({ String($0) }))
}

print(recursion(origin: (0, 0), size: image.count))

func recursion(origin point: (x: Int, y: Int), size: Int) -> String {
    guard size > 1 else { return image[point.x][point.y] }

    let xPoints = [point.x, point.x, point.x + size / 2, point.x + size / 2]
    let yPoints = [point.y, point.y + size / 2, point.y, point.y + size / 2]
    let result = zip(xPoints, yPoints).map({ recursion(origin: ($0, $1), size: size / 2) })

    if result[0].count == 1,
       result.filter({ result[0] == $0 }).count == 4 {
        return result[0]
    } else {
        return "(" + result.joined() + ")"
    }
}
