//
//  StudentTableViewController.swift
//  Student List
//
//  Created by Ethan John on 1/22/19.
//  Copyright © 2019 ya boy E. All rights reserved.
//

import UIKit

class StudentTableViewController: UITableViewController {

    // MARK: - Table view data source
    
    let studentController = StudentController()

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.studentController.students.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "studentCell", for: indexPath)
        
        let student = self.studentController.students[indexPath.row]
        
        cell.textLabel?.text = student.firstName
        
        return cell
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailVC" {
            guard let indexPath = tableView.indexPathForSelectedRow else { return }
            guard let destinationVC = segue.destination as? StudentDetailViewController else { return }
            let student = self.studentController.students[indexPath.row]
            destinationVC.student = student
        }
    }
}
