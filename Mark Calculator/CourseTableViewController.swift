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

    @IBOutlet var test3: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        test3.position =
//        test3.y = 500
//        test3.x = 200
//        test3.position = CGPoint(x:150, y: 150)
//
        if (isEmpty == true){
            print("yes its empty")
//            test3.position = CGPoint(x:150, y: 150)
            
            tableView.separatorStyle = .none
            tableView.backgroundView = test3
//            tableView.backgroundView?.position = CGPoint(x:-150, y: 150)
        }
        else {
            print("no its empty")
//            tableView.separatorStyle = .default
            tableView.backgroundView = nil
            tableView.separatorStyle = .singleLine
            
//            test3.isHidden = true
        }
//        self.navigationItem.leftBarButtonItem = self.editButtonItem
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.add, target:self, action: #selector(CourseTableViewController.addCourse))
        self.navigationController?.navigationBar.isTranslucent = false
//        self.navigationController?.navigationBar.tintColor = UIColor.white;
//         self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.add, target:self, action: #selector(semesterTableViewController.addSem))
        
        
//        tableView.addSubview(test3)
        
        tableView.delegate = self
        tableView.dataSource = self
        
        
//         self.clearsSelectionOnViewWillAppear = false
        
         self.title = sem.sem
      
//         self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    func addCourse() {
//        create an alert
        let alertController = UIAlertController(title: "New Course", message:"Enter a new course", preferredStyle: .alert)
        let confirmAction = UIAlertAction(title:"Confirm", style:UIAlertActionStyle.default, handler: ({
            (handler) in
            if let field = alertController.textFields![0] as? UITextField {
                if field.text == "" {
                    SweetAlert().showAlert("Error", subTitle: "left empty", style: AlertStyle.error)
                }
                else {
                    self.saveCourse(course: field.text!)
                    
                    SweetAlert().showAlert("Added", subTitle: "added new semester", style: AlertStyle.success)
                    //                    print("hy")
//                    self.viewWillAppear(false)
//                    self.tableView.reloadData()
                    self.viewWillAppear(false)
                }
            }
        }))
        
        let cancelAction = UIAlertAction(title:"cancel", style: UIAlertActionStyle.cancel, handler: nil)
        alertController.addTextField(configurationHandler: ({
            (textfield) in
            textfield.placeholder = "semester"
        }))
        alertController.addAction(confirmAction)
        alertController.addAction(cancelAction)
        self.present(alertController, animated: true, completion: nil)
        
    }
    
    func saveCourse(course: String) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let courseItem = Course(context: context)
        courseItem.name = course
//        courseItem.name = courseTextField.text
        
        sem.addToCourse(courseItem)
        
        
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
//        navigationController!.popViewController(animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if (isEmpty == true){
            print("yes its empty")
            //            tableView.addSubview(test3)
            //                        tableView.isHidden = true
            tableView.separatorStyle = .none
            tableView.backgroundView = test3
//             tableView.backgroundView?.position = CGPoint(x:-150, y: 150)
        }
        else {
            print("no its empty")
            //            tableView.separatorStyle = .default
            tableView.backgroundView = nil
            tableView.separatorStyle = .singleLine
            getCourse()
            tableView.reloadData()
        }
        self.navigationController?.navigationBar.isTranslucent = false
        tableView.reloadData()
        
        
//        getCourse()
//        tableView.reloadData()
    }
    
//    /    function to check if the item core data is empty
    var isEmpty : Bool {
        
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        do{
            let fetchrequest:NSFetchRequest<Course> = Course.fetchRequest()
            let predict = NSPredicate(format: "%K == %@", "sem", sem)
            fetchrequest.predicate = predict
            let count = try context.count(for: fetchrequest)
            return count == 0 ? true : false
        }catch{
            return true
        }
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
                    let fetchrequest:NSFetchRequest<Course> = Course.fetchRequest()
                    let predict = NSPredicate(format: "%K == %@", "sem", sem)
                    fetchrequest.predicate = predict
                    course = try managedContext.fetch(fetchrequest)
                } catch {
                    print("error")
                }
//            }
            
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
        
//        if segue.identifier == "courseAdd" {
//            let destination = segue.destination as! AddCourseViewController
//            destination.sem = sem
//        }
//        
//       else if segue.identifier == "addItem" {
//            let destination2 = segue.destination as! VC
//            destination2.course = sender as! Course
////            destination2.course = course2
//        }
        if segue.identifier == "viewItem"{
            let destination3 = segue.destination as! courseVC
            destination3.course = sender as! Course
        }
        
//        destination.sem = sender as! Semester
    }
}
