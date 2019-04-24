//
//  PlaylistTableViewController.swift
//  Playlist 2
//
//  Created by Ethan John on 1/23/19.
//  Copyright © 2019 ya boy E. All rights reserved.
//

import UIKit

class PlaylistTableViewController: UITableViewController {
    
    var statusBarStyle: UIStatusBarStyle = .lightContent

    @IBOutlet weak var playlistTextField: UITextField!
        
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func addPlaylistButtonTapped(_ sender: Any) {
        guard let playlistName = playlistTextField.text, !playlistName.isEmpty else { return }
        PlaylistController.shared.createPlaylist(withName: playlistName)
        playlistTextField.text = ""
        tableView.reloadData()
    }
    

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return PlaylistController.shared.playlists.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "playlistCell", for: indexPath)
        
        
        let playlist = PlaylistController.shared.playlists[indexPath.row]
        
        // Configure title text with playlist name.
        cell.textLabel?.text = playlist.name
        
        // Configure detail text with either 'song' or 'songs'.
        
        if playlist.songs.count > 1 || playlist.songs.count == 0 {
            cell.detailTextLabel?.text = "\(playlist.songs.count) songs"
        } else {
            cell.detailTextLabel?.text = "\(playlist.songs.count) song"
        }

        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        switch editingStyle {
        case .delete:
            let playlist = PlaylistController.shared.playlists[indexPath.row]
            PlaylistController.shared.delete(playlist: playlist)
            tableView.deleteRows(at: [indexPath], with: .bottom)
        default:
            return
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toPlaylistDetailSegue"  {
            guard let index = tableView.indexPathForSelectedRow else { return }
            guard let destinationVC = segue.destination as? SongListTableViewController else { return }
            let playlistToSend = PlaylistController.shared.playlists[index.row]
            destinationVC.playlist = playlistToSend
        }
    }
}
