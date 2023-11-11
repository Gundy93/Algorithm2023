let croatian = Set(["c=", "c-", "dz=", "d-", "lj", "nj", "s=", "z="])
var text = readLine()!.map(String.init)
var stack = [String]()

text.forEach { word in
    switch (stack.last, word) {
    case ("c", "="):
        stack[stack.count - 1] = "c="
    case ("c", "-"):
        stack[stack.count - 1] = "c-"
    case ("z", "="):
        guard stack.count > 1,
              stack[stack.count - 2] == "d" else {
            stack[stack.count - 1] = "z="
            return
        }
        stack.removeLast()
        stack[stack.count - 1] = "dz="
    case ("d", "-"):
        stack[stack.count - 1] = "d-"
    case ("l", "j"):
        stack[stack.count - 1] = "lj"
    case ("n", "j"):
        stack[stack.count - 1] = "nj"
    case ("s", "="):
        stack[stack.count - 1] = "s="
    default:
        stack.append(word)
    }
}

print(stack.count)
