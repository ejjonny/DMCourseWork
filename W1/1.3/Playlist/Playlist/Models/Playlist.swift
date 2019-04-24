//
//  Playlist.swift
//  Playlist
//
//  Created by Ethan John on 1/22/19.
//  Copyright © 2019 ya boy E. All rights reserved.
//

import Foundation

class Playlist {
    var name: String
    var songs = [Song]()
    
    init(name: String){
        self.name = name
    }
}

extension Playlist: Equatable {}

func ==(lhs: Playlist, rhs: Playlist) -> Bool {
    if lhs.name == rhs.name { return false}
    if lhs.songs == rhs.songs { return false }
    
    return true
}
