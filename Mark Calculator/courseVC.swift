//
//  courseVC.swift
//  Mark Calculator
//
//  Created by Muhammad  on 2018-03-11.
//  Copyright © 2018 Muhammad . All rights reserved.
//

import UIKit
import CoreData

class courseVC: UIViewController {
    
    var course: Course!
    var test : [Item] = []
    
    @IBOutlet var segmented: UISegmentedControl!
    @IBOutlet var container1: UIView!
    
    @IBOutlet var testScreen: UIView!
    @IBOutlet var container2: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if (isEmpty == true){
            print("Yes its empty")
            testScreen.isHidden = false
            container2.isHidden = true
            container1.isHidden = true
        }
        else {
            print("no its not")
            testScreen.isHidden = true
            container1.isHidden = false
            container2.isHidden = true
        }
//        if (course)
//        container1.isHidden = false
//        container2.isHidden = true
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if (isEmpty == true){
            print("Yes its empty")
            testScreen.isHidden = false
            container2.isHidden = true
            container1.isHidden = true
        }
        else {
            print("no its not")
            testScreen.isHidden = true
            container1.isHidden = false
            container2.isHidden = true
        }

    }
    
    
    
    var isEmpty : Bool {
         let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        do{
            let fetchrequest:NSFetchRequest<Item> = Item.fetchRequest()
            let count = try context.count(for: fetchrequest)
//            let count  = try context.count(for: request)
            return count == 0 ? true : false
        }catch{
            return true
        }
        
    }

    @IBAction func Choice(_ sender: Any) {
        switch segmented.selectedSegmentIndex {
        case 0:
            if (isEmpty == true){
                print("Yes its empty")
                testScreen.isHidden = false
                container2.isHidden = true
                container1.isHidden = true
            }
            else {
                print("no its not")
                testScreen.isHidden = true
                container1.isHidden = false
                container2.isHidden = true
            }

//            container1.isHidden = false
//            container2.isHidden = true
//            performSegue(withIdentifier: "test", sender: self)
        case 1:
            if (isEmpty == true){
                print("Yes its empty")
                testScreen.isHidden = false
                container2.isHidden = true
                container1.isHidden = true
            }
            else {
                print("no its not")
                testScreen.isHidden = true
                container1.isHidden = true
                container2.isHidden = false
            }

//            container1.isHidden = true
//            container2.isHidden = false
        default:
            break
        }
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        if segue.identifier == "test1" {
            let destination = segue.destination as! itemListVC
            destination.course = course
        }
        else if segue.identifier == "test3"{
            let destination3 = segue.destination as! ItemVC
            destination3.course =  course
        }
    }
 
}
