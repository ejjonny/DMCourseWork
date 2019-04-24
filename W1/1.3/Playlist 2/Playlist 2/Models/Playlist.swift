//
//  Playlist.swift
//  Playlist 2
//
//  Created by Ethan John on 1/23/19.
//  Copyright © 2019 ya boy E. All rights reserved.
//

import Foundation

class Playlist: Codable {
    var name: String
    var songs: [Song]
    
    init(name: String) {
        self.name = name
        self.songs = []
    }
}

extension Playlist: Equatable {
    static func == (lhs: Playlist, rhs: Playlist) -> Bool {
        return lhs.name == rhs.name && lhs.songs == rhs.songs
    }
}
