//
//  SongsTableViewController.swift
//  Playlist
//
//  Created by Ethan John on 1/22/19.
//  Copyright © 2019 ya boy E. All rights reserved.
//

import UIKit

class SongsTableViewController: UITableViewController {
    @IBOutlet weak var songTitleTextField: UITextField!
    @IBOutlet weak var artistTextField: UITextField!
    
    var playlist: Playlist?

    override func viewDidLoad() {
        super.viewDidLoad()
        title = playlist?.name
    }
    
    @IBAction func addSongButtonTapped(_ sender: Any) {
        if let songName = songTitleTextField.text, let artistName = artistTextField.text, let playlist = playlist {
            SongController.createNewSong(songName: songName, artistName: artistName, playlist: playlist)
            tableView.reloadData()
        }
    }
    
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return playlist?.songs.count ?? 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SongCell", for: indexPath)
        
        if let song = playlist?.songs[indexPath.row] {
            cell.textLabel?.text = song.title
            cell.detailTextLabel?.text = song.artist
            
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            if let playlist = playlist {
                let song = playlist.songs[indexPath.row]
                PlaylistController.shared.remove(song: song, fromPlaylist: playlist)
                tableView.deleteRows(at: [indexPath], with: .left)
            }
        }
    }
}
