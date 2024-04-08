func solution(_ m:String, _ musicinfos:[String]) -> String {
    var music = m
    
    music = music.replacingOccurrences(of: "C#", with: "c")
    music = music.replacingOccurrences(of: "D#", with: "d")
    music = music.replacingOccurrences(of: "F#", with: "f")
    music = music.replacingOccurrences(of: "G#", with: "g")
    music = music.replacingOccurrences(of: "A#", with: "a")
    music = music.replacingOccurrences(of: "B#", with: "b")
    
    let musics: [(Int, String, String)] = musicinfos.map {
        let information = $0.split(separator: ",").map(String.init)
        let start = information[0].split(separator: ":").map { Int($0)! }
        let end = information[1].split(separator: ":").map { Int($0)! }
        let time = (end[0] - start[0]) * 60 + (end[1] - start[1])
        let name = information[2]
        var code = information[3]
        
        code = code.replacingOccurrences(of: "C#", with: "c")
        code = code.replacingOccurrences(of: "D#", with: "d")
        code = code.replacingOccurrences(of: "F#", with: "f")
        code = code.replacingOccurrences(of: "G#", with: "g")
        code = code.replacingOccurrences(of: "A#", with: "a")
        code = code.replacingOccurrences(of: "B#", with: "b")
        
        let codes = String(repeating: code, count: (time/code.count)+1)
        
        return (time, name, String(codes.dropLast(codes.count-time)))
    }
    .filter { $0.2.contains(music) }
    
    return musics.min { $0.0 > $1.0 }?.1 ?? "(None)"
}
