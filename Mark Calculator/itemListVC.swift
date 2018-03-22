//
//  itemListVC.swift
//  Mark Calculator
//
//  Created by Muhammad  on 2018-03-11.
//  Copyright © 2018 Muhammad . All rights reserved.
//

import UIKit
import CoreData

//class that has the labels on the table
class yourclass2: UITableViewCell {
    
    @IBOutlet var item: UILabel!
    
    @IBOutlet var worth: UILabel!
    @IBOutlet var mark: UILabel!
    
    
}

class itemListVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
  

    @IBOutlet var tableview: UITableView!

    var test : [Item] = []
    var course: Course!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableview.dataSource = self
        tableview.delegate = self
        
    
    }
    
    override func viewWillAppear(_ animated: Bool) {
        getItem()
        tableview.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return test.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableview.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! yourclass2
        let item1 = test[indexPath.row]
        cell.item.text = item1.courseItem
        cell.worth.text = item1.worthItem
        cell.mark.text = item1.markItem
//        cell.textLabel?.text = item1.courseItem
    
        return cell
    }
    
    func getItem () {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        do {
            let fetchrequest:NSFetchRequest<Item> = Item.fetchRequest()
            let predict = NSPredicate(format: "%K == %@", "k", course)
            fetchrequest.predicate = predict
            test = try context.fetch(fetchrequest)
//            test = try context.fetch(Item.fetchRequest()) as! [Item]
            
        } catch {
            print("error")
        }
                
   
        
//        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
//        do {
//            let fetchrequest:NSFetchRequest<Item> = Item.fetchRequest()
//            let predict = NSPredicate(format: "%K == %@", "k", course)
//            fetchrequest.predicate = predict
//            //            courseItems = try context.fetch(Item.fetchRequest()) as! [Item]
//            courseItems = try context.fetch(fetchrequest)
//            print(courseItems)
//
//        } catch {
//            print ("opps error while getting the items")
//        }
//
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        let managedContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let courseItem = test[indexPath.row];
        if editingStyle == .delete {
            managedContext.delete(courseItem)
            
            do {
                try managedContext.save()
            }catch {
                print("Error");
            }
            
            do {
                let fetchrequest:NSFetchRequest<Item> = Item.fetchRequest()
                let predict = NSPredicate(format: "%K == %@", "k", course)
                fetchrequest.predicate = predict
                test = try managedContext.fetch(fetchrequest)
            } catch {
                print("Error")
            }
            
            tableView.reloadData();
            
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }
    
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller
      
        
    }
}
