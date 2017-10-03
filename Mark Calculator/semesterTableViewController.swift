//
//  TableViewControllerTest.swift
//  Mark Calculator
//
//  Created by Muhammad  on 2017-08-13.
//  Copyright © 2017 Muhammad . All rights reserved.
//

import Foundation
import UIKit

class semesterTableViewController: UITableViewController {

//    setting up the core data
    var sem : [SemTest] = []
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
//         self.clearsSelectionOnViewWillAppear = false

//         self.navigationItem.rightBarButtonItem = self.editButtonItem
    }


    override func viewWillAppear(_ animated: Bool) {

        getItem()
        tableView.reloadData()
    }

   
//    override func numberOfSections(in tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 0
//    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
                return sem.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let sem1 = sem[indexPath.row]
        cell.textLabel?.text = sem1.semester
        
        return cell

    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let sem1 = sem[indexPath.row]
//        switch (indexPath.row) {
//        case 0:
//            performSegue(withIdentifier: "addCourse", sender: sem1)
//            getItem()
//            break
//        case 1:
//            performSegue(withIdentifier: "addCourse", sender: sem1)
//            break
//        default:
//            break
//        }
        performSegue(withIdentifier: "addCourse", sender: sem1)
    }
    
    @IBAction func addSemTestBtn(_ sender: Any) {
//        performSegue(withIdentifier: "addTest", sender: nil)
    }
    
//    fetching core data
    func getItem () {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        do {
            sem = try context.fetch(SemTest.fetchRequest()) as! [SemTest]
            print(sem)
        } catch {
            print ("opps")
        }
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        
////        if let destination = segue.destination as? MySemester {
////            if let lableTest = sender as? String {
////                destination.selectedSong = lableTest
////            }
////        }
//    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
//    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
//        if editingStyle == .delete {
//            // Delete the row from the data source
//            tableView.deleteRows(at: [indexPath], with: .fade)
//        } else if editingStyle == .insert {
//            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
//        }    
//    }
    
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
