//
//  SongListTableViewController.swift
//  Playlist 2
//
//  Created by Ethan John on 1/23/19.
//  Copyright © 2019 ya boy E. All rights reserved.
//

import UIKit

class SongListTableViewController: UITableViewController {

    @IBOutlet weak var songNameField: UITextField!
    @IBOutlet weak var songArtistField: UITextField!
    
    
    // MARK: - Landing Pad
    var playlist: Playlist?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = playlist?.name ?? "No Name"
    }
    
    @IBAction func addSongButtonTapped(_ sender: UIBarButtonItem) {
        guard let name = songNameField.text,
            !name.isEmpty,
            let artist = songArtistField.text,
            !artist.isEmpty,
            let playlist = playlist else { return }
        SongController.shared.createSongWith(name: name, artist: artist, playlist: playlist)
        songNameField.text = ""
        songArtistField.text = ""
        self.tableView.reloadData()
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return playlist?.songs.count ?? 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "songCell", for: indexPath)
        let song = playlist?.songs[indexPath.row]
        cell.textLabel?.text = song?.name
        cell.detailTextLabel?.text = song?.artist
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        switch editingStyle {
        case .delete:
            guard let playlistToUpdate = playlist else { return }
            let song = playlistToUpdate.songs[indexPath.row]
            PlaylistController.shared.remove(song: song, fromPlaylist: playlistToUpdate)
            tableView.deleteRows(at: [indexPath], with: .bottom)
        default:
            return
        }
    }
}
