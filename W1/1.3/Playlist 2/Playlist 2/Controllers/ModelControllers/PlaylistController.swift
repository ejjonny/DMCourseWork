//
//  PlaylistController.swift
//  Playlist 2
//
//  Created by Ethan John on 1/23/19.
//  Copyright © 2019 ya boy E. All rights reserved.
//

import Foundation

class PlaylistController {
    
    // MARK: - Shared Instances / Singleton
    static let shared = PlaylistController()
    
    // MARK: - Source of Truth
    var playlists: [Playlist] = []
    
    init() {
        loadFromPersistentStore()
    }
    
    func createPlaylist(withName name: String) {
        let playlist = Playlist(name: name)
        playlists.append(playlist)
        saveToPersistentStore()
    }
    
    func delete(playlist: Playlist) {
        guard let index = playlists.index(of: playlist) else { return }
        playlists.remove(at: index)
        saveToPersistentStore()
    }
    
    func add(song: Song, toPlaylist playlist: Playlist) {
        playlist.songs.append(song)
        saveToPersistentStore()
    }
    
    func remove(song: Song, fromPlaylist playlist: Playlist) {
        guard let index = playlist.songs.index(of: song) else { return }
        playlist.songs.remove(at: index)
        saveToPersistentStore()
    }
    
    // MARK: - Persistence
    
    // Get the URL where we are saving our data.
    func fileURL() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let documentDirectory = paths[0]
        let filename = "playlists.json"
        let fullURL = documentDirectory.appendingPathComponent(filename)
        
        return fullURL
    }
    
    // Save the data at the URL.
    func saveToPersistentStore() {
        let encoder = JSONEncoder()
        do {
            let data = try encoder.encode(playlists)
            try data.write(to: fileURL())
        } catch let error {
            print(error)
        }
    }
    
    // Fetch the data from the URL.
    func loadFromPersistentStore() {
        let decoder = JSONDecoder()
        do {
            let data = try Data(contentsOf: fileURL())
            let playlists = try decoder.decode([Playlist].self, from: data)
            self.playlists = playlists
        } catch let error {
            print(error)
        }
    }
}
