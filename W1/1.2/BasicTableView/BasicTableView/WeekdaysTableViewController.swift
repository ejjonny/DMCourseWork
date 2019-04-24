//
//  WeekdaysTableViewController.swift
//  BasicTableView
//
//  Created by Ethan John on 1/21/19.
//  Copyright © 2019 ya boy E. All rights reserved.
//

import UIKit

class WeekdaysTableViewController: UITableViewController {
    
    var weekdays: [String] = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return weekdays.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "dayCell", for: indexPath)
        
        let dayOfWeek = weekdays[indexPath.row]
        
        cell.textLabel?.text = dayOfWeek
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80.0
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier == "toDetailVC" {
            if let destinationViewController = segue.destination as? DayViewController {
                if let indexPath = tableView.indexPathForSelectedRow {
                    destinationViewController.day = weekdays[indexPath.row]
                }
            }
        }
    }

}
