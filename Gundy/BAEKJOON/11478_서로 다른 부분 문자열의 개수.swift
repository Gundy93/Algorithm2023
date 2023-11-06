func countSubstrings(from text: String) -> Int {
    var substrings = Set<String>()
    let characters = text.map({ String($0) })

    func recursion(_ text: String, nextIndex: Int) {
        substrings.insert(text)

        guard nextIndex < characters.count else { return }

        recursion(text + characters[nextIndex], nextIndex: nextIndex + 1)
    }

    for (nextIndex, text) in zip(1...characters.count, characters) {
        recursion(text, nextIndex: nextIndex)
    }

    return substrings.count
}

print(countSubstrings(from: readLine()!))
