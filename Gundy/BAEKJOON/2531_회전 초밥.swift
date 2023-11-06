func solution() {
    let input = readLine()!.split(separator: " ").compactMap({ Int($0) })
    let numberOfDishes = input[0]
    let limit = input[2]
    let coupon = input[3]
    var counter = Array(repeating: 0, count: input[1] + 1)
    var dishes = [Int]()

    for _ in 1...numberOfDishes {
        dishes.append(Int(readLine()!)!)
    }

    dishes += dishes

    var left = 0
    var right = 0
    var result = 1
    var numberOfKinds = 1
    counter[dishes[0]] = 1

    if limit == 1,
       coupon != dishes[0] {
        result = 2
    }

    while right < numberOfDishes * 2 - 1,
          left < numberOfDishes {
        right += 1
        counter[dishes[right % numberOfDishes]] += 1
        if counter[dishes[right % numberOfDishes]] == 1 {
            numberOfKinds += 1
        }

        var count = right - left + 1

        if count > limit {
            counter[dishes[left]] -= 1
            if counter[dishes[left]] == 0 {
                numberOfKinds -= 1
            }
            left += 1
            count -= 1
        }

        if numberOfKinds >= result {
            var currentResult = numberOfKinds
            if count == limit,
               counter[coupon] == 0 {
                currentResult += 1
            }
            result = currentResult
        }
    }

    print(result)
}

solution()
