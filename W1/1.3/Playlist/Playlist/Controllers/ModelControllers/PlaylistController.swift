//
//  PlaylistController.swift
//  Playlist
//
//  Created by Ethan John on 1/22/19.
//  Copyright © 2019 ya boy E. All rights reserved.
//

import Foundation

class PlaylistController {
    
    static let shared = PlaylistController()
    
    var playlists = [Playlist]()
    
    func createPlaylist(name: String) {
        let playlist = Playlist(name: name)
        playlists.append(playlist)
    }
    
    func update(playlist: Playlist) {
        
    }
    
    func delete(playlist: Playlist) {
        if let index = playlists.index(of: playlist) {
            self.playlists.remove(at: index)
        }
    }
    
    func add(song: Song, toPlaylist playlist: Playlist) {
        playlist.songs.append(song)
    }
    
    func remove(song: Song, fromPlaylist playlist: Playlist) {
        if let index = playlist.songs.index(of: song) {
            playlist.songs.remove(at: index)
        }
    }
}
