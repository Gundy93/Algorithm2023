import Foundation

func solution(_ new_id:String) -> String {
    var newID = new_id.lowercased()
    newID = newID.filter { $0.isCased || $0.isNumber || ["-", "_", "."].contains($0) }
    while newID.contains("..") {
        newID = newID.replacingOccurrences(of: "..", with: ".")
    }
    while newID.first == "." {
        newID = String(newID.dropFirst())
    }
    while newID.last == "." {
        newID.popLast()
    }
    if newID.isEmpty {
        newID = "a"
    }
    if newID.count > 15 {
        newID = String(newID.dropLast(newID.count-15))
        while newID.last == "." {
            newID.popLast()
        }
    }
    while newID.count < 3 {
        newID += String(newID.last!)
    }
    return newID
}
