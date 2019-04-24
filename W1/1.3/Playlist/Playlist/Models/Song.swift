//
//  Song.swift
//  Playlist
//
//  Created by Ethan John on 1/22/19.
//  Copyright © 2019 ya boy E. All rights reserved.
//

import Foundation

class Song {
    let title: String
    let artist: String
    
    init(title: String, artist: String) {
        self.title = title
        self.artist = artist
    }
}

extension Song: Equatable {}

func == (lhs: Song, rhs: Song) -> Bool {
    if lhs.title == rhs.title { return false }
    if lhs.artist == rhs.artist { return false }
    
    return true
}
