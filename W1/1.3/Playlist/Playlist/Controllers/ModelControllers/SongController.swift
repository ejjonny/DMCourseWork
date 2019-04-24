//
//  SongController.swift
//  Playlist
//
//  Created by Ethan John on 1/22/19.
//  Copyright © 2019 ya boy E. All rights reserved.
//

import Foundation

class SongController {
    static func createNewSong(songName: String, artistName: String, playlist: Playlist) {
        let song = Song(title: songName, artist: artistName)
        PlaylistController.shared.add(song: song, toPlaylist: playlist)
    }
}
