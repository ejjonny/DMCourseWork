//
//  NoteTableViewController.swift
//  Notes
//
//  Created by Ethan John on 1/25/19.
//  Copyright © 2019 ya boy E. All rights reserved.
//

import UIKit

class NoteTableViewController: UITableViewController, UISearchBarDelegate {
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.leftBarButtonItem = self.editButtonItem
        searchBar.delegate = self
}
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
//        searchBar.dismiss(animated: false, completion: nil)
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return NoteController.shared.filteredNotes.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "noteCell", for: indexPath)
        
        cell.textLabel?.text = NoteController.shared.filteredNotes[indexPath.row].body
        
        return cell
    }

    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        switch editingStyle{
        case .delete:
            // Delete note at correct index path
            NoteController.shared.delete(note: NoteController.shared.notes[indexPath.row])
            // Delete row in tableView
            tableView.deleteRows(at: [indexPath], with: .fade)
        default:
            return
        }
    }
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        let movedNote = NoteController.shared.notes[fromIndexPath.row]
        NoteController.shared.delete(note: movedNote)
        NoteController.shared.notes.insert(movedNote, at: to.row)
        NoteController.shared.filteredNotes.insert(movedNote, at: to.row)
    }
    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // If a note is selected pass it to the noteDetailVC. If not don't pass anything.
        if segue.identifier == "toNoteDetail" {
            guard let index = tableView.indexPathForSelectedRow else { print("Unable to locate note for selected index"); return }
            guard let destinationVC = segue.destination as? NoteDetailViewController else { print("Unable to cast destinationVC as correct type"); return }
            destinationVC.note = NoteController.shared.filteredNotes[index.row]
        } else {
            return
        }
    }
    
    
    // Update tableView with search results (called when search bar becomes first responder & every time changes are made in the search bar text)
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if let searchText = searchBar.text, !searchText.isEmpty {
            // Go through notes to see which ones match search criteria. Not case sensitive.
            NoteController.shared.filteredNotes = NoteController.shared.notes.filter{ Note in
                if let index = NoteController.shared.notes.index(of: Note) {
                    return NoteController.shared.notes[index].body.lowercased().contains(searchText.lowercased())
                }
                return false
            }
        } else {
            // If the search bar text is empty or the search text is nil filtered list is synchronized with unfiltered list.
            NoteController.shared.filteredNotes = NoteController.shared.notes
        }
        tableView.reloadData()
    }
    
    // Enables edit function when finished using search function.
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        self.navigationItem.leftBarButtonItem?.isEnabled = true
    }
    
    // Disables edit function while using search function.
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        self.navigationItem.leftBarButtonItem?.isEnabled = false
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
}
