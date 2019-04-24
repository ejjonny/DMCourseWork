//
//  DayListTableViewController.swift
//  DaysOfWeek
//
//  Created by Ethan John on 1/22/19.
//  Copyright © 2019 ya boy E. All rights reserved.
//

import UIKit

class DayListTableViewController: UITableViewController {
    
    // MARK: ViewControllerLifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DayController.daysOfTheWeek.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "dayCell", for: indexPath)
        let day = DayController.daysOfTheWeek[indexPath.row]
        
        cell.textLabel?.text = day.name
        
        return cell
    }
    
    // MARK: - Navigation
    
    // IIDOO: Identifier, Index, Destination, Object to send, Object to recieve
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailVC" {
            if let indexPath = tableView.indexPathForSelectedRow {
                guard let destinationVC = segue.destination as? DayDetailVC else { return }
                destinationVC.dayReciever = DayController.daysOfTheWeek[indexPath.row]
            }
        }
    }
}
