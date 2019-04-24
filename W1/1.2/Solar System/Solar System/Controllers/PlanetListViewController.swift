//
//  PlanetListViewController.swift
//  Solar System
//
//  Created by Ethan John on 1/22/19.
//  Copyright © 2019 ya boy E. All rights reserved.
//

import UIKit

class PlanetListViewController: UITableViewController {
    
    let planetController = PlanetController()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return planetController.planets.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "dayCell", for: indexPath)
        
        // Configure the cell...
        cell.detailTextLabel?.text = String(planetController.planets[indexPath.row].dayLength)
        cell.textLabel?.text = planetController.planets[indexPath.row].planetName
        cell.imageView?.image = UIImage(named: planetController.planets[indexPath.row].imageName)
        return cell
    }

    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toPlanetDetailVC" {
            if let indexPath = tableView.indexPathForSelectedRow {
                guard let destinationVC = segue.destination as? PlanetDetailViewController else { return }
                destinationVC.planet = planetController.planets[indexPath.row]
            }
        }
    }
}
