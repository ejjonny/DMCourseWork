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
    
    func fileURL() -> URL {
        
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask) // Gets an array of user file paths / URLs (Specific to your app. This is  your app's own folder)
        
        let documentDirectory = paths[0] // Use the first URL from the returned array.
        
        let playlistLocation = "playlist.json" // Set up file name.
        
        let url = documentDirectory.appendingPathComponent(playlistLocation) // Construct full URL with file name.
        print(url.absoluteString)
        
        return url // Returning complete URL.
    }
    
    func saveToPersistentStore() {
        
        let jsonEncoder = JSONEncoder() // Make a JSON encoder instance
        do {
            let playlistsAsData = try jsonEncoder.encode(PlaylistController.shared.playlists) // Try to encode and deal with errors.
            try playlistsAsData.write(to: fileURL())
        } catch let error {
            print("Error saving to persistent store: \(error.localizedDescription)")
        }
    }
    
    func loadFromPersistentStore() {
        
        let jsonDecoder = JSONDecoder() // Make a JSON decoder instance.
        
        do {
            let data = try Data(contentsOf: fileURL()) // Get data from app's file URL.
            
            let decodedPlaylists = try jsonDecoder.decode([Playlist].self, from: data) // Decode the data into usable Playlist objects.
            
            self.playlists = decodedPlaylists // Assign playlists object with loaded data.
        } catch let error {
            print("Error loading from persistent store: \(error.localizedDescription)") // Address error loading.
        }
    }
}
