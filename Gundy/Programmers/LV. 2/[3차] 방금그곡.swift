func solution(_ m:String, _ musicinfos:[String]) -> String {
    var melody = [String]()
    for note in m.map(String.init) {
        if note == "#" {
            melody[melody.count - 1] = melody[melody.count - 1].lowercased()
        } else {
            melody.append(note)
        }
    }
    let filteredMelody = melody.joined()
    var result = [(String, Int)]()
    for musicInfo in musicinfos {
        let infos = musicInfo.split(separator: ",").map(String.init)
        let music = infos[3].map(String.init)
        let startTime = infos[0].split(separator: ":").compactMap { Int($0) }
        let endTime = infos[1].split(separator: ":").compactMap { Int($0) }
        let playedTime = 60 * (endTime[0] - startTime[0]) + endTime[1] - startTime[1]
        var playedMusic = [String]()
        var index = 0
        while playedMusic.count < playedTime {
            let note = music[index % music.count]
            if note == "#" {
                playedMusic[playedMusic.count - 1] = playedMusic[playedMusic.count - 1].lowercased()
            } else {
                playedMusic.append(note)
            }
            index += 1
        }
        if music[index % music.count] == "#" {
            playedMusic[playedMusic.count - 1] = playedMusic[playedMusic.count - 1].lowercased()
        }
        guard playedMusic.joined().contains(filteredMelody) else { continue }
        result.append((infos[2], playedTime))
    }
    return result.isEmpty ? "(None)" : result.sorted { $0.1 > $1.1 }[0].0
}
