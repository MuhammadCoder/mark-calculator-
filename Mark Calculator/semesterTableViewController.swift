//
//  TableViewControllerTest.swift
//  Mark Calculator
//
//  Created by Muhammad  on 2017-08-13.
//  Copyright © 2017 Muhammad . All rights reserved.
//

import Foundation
import UIKit
import CoreData
import HGPlaceholders

class semesterTableViewController: UITableViewController{

//    setting up the core data
    var semesters : [Semester] = []
    var placeholderTableView: TableView?
    
    @IBOutlet var testView: UIView!
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
//        placeholderTableView?.
//        placeholderTableView = tableView as? TableView
//        placeholderTableView?.placeholderDelegate = self as! PlaceholderDelegate
//        placeholderTableView?.showNoResultsPlaceholder()
//        tableView.showL
//        tableView.sho
//        placeholderTableView?.showNoResultsPlaceholder()
//         placeholderTableView?.showDefault()
//        placeholderTableView = tableView as? TableView
        tableView.backgroundView = testView
//        tableView.backgroundView?.position
//        tableView.bac
//        placeholderTableView?.placeholderDelegate = self
        
        
        
        self.clearsSelectionOnViewWillAppear = false
        self.navigationItem.leftBarButtonItem = self.editButtonItem
//        self.navigationItem.leftBarButtonItem = self.

    }

    override func viewWillAppear(_ animated: Bool) {

        getItem()
        tableView.reloadData()
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return semesters.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let sem1 = semesters[indexPath.row]
        cell.textLabel?.text = sem1.sem
        
        return cell

    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       
        
        let sem1 = semesters[indexPath.row]
        self.performSegue(withIdentifier: "addCourse", sender: sem1)
//        placeholderTableView?.showNoResultsPlaceholder()
    }
    
    @IBAction func addSemBtn(_ sender: Any) {
    }
    
//    fetching core data
    func getItem () {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        do {
            semesters = try context.fetch(Semester.fetchRequest()) as! [Semester]
            print(semesters)
        } catch {
            print ("opps error while getting semesters")
        }
    }
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
//     Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        let managedContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let semItem = semesters[indexPath.row];
        if editingStyle == .delete {
            managedContext.delete(semItem)
            
            do {
                try managedContext.save()
            }catch {
                print("Error");
            }
            
            do {
                semesters = try managedContext.fetch(Semester.fetchRequest()) as! [Semester]
            } catch {
                print("Error")
            }
            
            tableView.reloadData();
            
            // Delete the row from the data source
//            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }
    
    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */
//    preparing the segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "addCourse" {
            let destination = segue.destination as! CourseTableViewController
            destination.sem = sender as! Semester
        }
        
    }
 
}
