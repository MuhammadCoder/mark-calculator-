//
//  CourseTableViewController.swift
//  Mark Calculator
//
//  Created by Muhammad  on 2017-09-11.
//  Copyright © 2017 Muhammad . All rights reserved.
//

import UIKit
import CoreData

class CourseTableViewController: UITableViewController {
    
    var sem:Semester!
//    var course2: Course!
    var course: [Course] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self

         self.clearsSelectionOnViewWillAppear = false
         self.title = sem.sem
//         self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    override func viewWillAppear(_ animated: Bool) {
        getCourse()
        tableView.reloadData()
    }
 
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        return course.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let course1 = course[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = course1.name
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cour = course[indexPath.row]
        performSegue(withIdentifier: "viewItem", sender: cour)
    }
    
    func getCourse() {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        do {
            let fetchrequest:NSFetchRequest<Course> = Course.fetchRequest()
            
            let predict = NSPredicate(format: "%K == %@", "sem",sem)
            fetchrequest.predicate = predict
            course = try context.fetch(fetchrequest)
            print(course)

        } catch {
            print ("error")
        }
    }

    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        let managedContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let courseItem = course[indexPath.row]
        
        if editingStyle == .delete {
            managedContext.delete(courseItem)
            
            do {
                try managedContext.save()
            }catch {
                print("error")
            }
            
            do {
                course = try managedContext.fetch(Course.fetchRequest()) as! [Course]
            } catch {
                print("error")
            }
            
             tableView.reloadData()
            
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "courseAdd" {
            let destination = segue.destination as! AddCourseViewController
            destination.sem = sem
        }
//        
//       else if segue.identifier == "addItem" {
//            let destination2 = segue.destination as! VC
//            destination2.course = sender as! Course
////            destination2.course = course2
//        }
        else if segue.identifier == "viewItem"{
            let destination3 = segue.destination as! courseVC
            destination3.course = sender as! Course
        }
        
//        destination.sem = sender as! Semester
    }
}
