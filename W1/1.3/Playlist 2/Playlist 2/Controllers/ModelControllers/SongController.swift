//
//  SongController.swift
//  Playlist 2
//
//  Created by Ethan John on 1/23/19.
//  Copyright © 2019 ya boy E. All rights reserved.
//

import Foundation

class SongController {
    
    // MARK: - Shared Instances / Singleton
    static let shared = SongController()
    
    func createSongWith(name: String, artist: String, playlist: Playlist) {
        let song = Song(name: name, artist: artist)
        PlaylistController.shared.add(song: song, toPlaylist: playlist)
    }
}
