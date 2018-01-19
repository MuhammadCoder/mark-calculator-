//
//  VC.swift
//  Mark Calculator
//
//  Created by Muhammad  on 2017-11-07.
//  Copyright © 2017 Muhammad . All rights reserved.
//

import UIKit
import CoreData

class yourClass1: UITableViewCell {
    
   
    @IBOutlet var itemUILabel: UILabel!
    
    @IBOutlet var worthUILabel: UILabel!
    @IBOutlet var markUILabel: UILabel!
}

class VC: UIViewController,  UITableViewDelegate, UITableViewDataSource{
    
//    setting up core data
    var course: Course!
    var courseItems : [Item] = []

    @IBOutlet var tableView: UITableView!

    @IBOutlet var itemTxt: UITextField!
    @IBOutlet var worthTxt: UITextField!
    @IBOutlet var markText: UITextField!
   
  
    var courseItem = UILabel.init(frame: CGRect.init(x:9, y:15, width: 50, height: 30))
    var worthItem = UILabel.init(frame: CGRect.init(x:9, y:15, width: 50, height: 30))
    var markItem = UILabel.init(frame: CGRect.init(x:9, y:15, width: 50, height: 30))
    
  
    var textFieldArray : [UILabel] = []
    
    var test : [String] = []
    var value : [String] = [];
    var markNum : [Int] = [];
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        tableView.delegate = self
        tableView.dataSource = self

        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
         view.addGestureRecognizer(tap)
        
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
       return courseItems.count
    }
    
    func prepareForReuse() {
        // your cleanup code

        markText.text = ""
        worthTxt.text = ""
        itemTxt.text = ""
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        getItem()
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item2 = courseItems[indexPath.row]
        let cell =  tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! yourClass1
        
//        adding core data text to the label
        cell.itemUILabel.text = item2.courseItem
        cell.worthUILabel.text = item2.worthItem
        cell.markUILabel.text = item2.markItem
//        cell.addSubview(courseItem)
//        cell.addSubview(markItem)
//        cell.addSubview(worthItem)
        
        return cell
    }
    
    @IBAction func addBtn(_ sender: Any) {
        
//        setting up to save to core data
        
        let context = (UIApplication.shared.delegate as!AppDelegate).persistentContainer.viewContext
        let item1 = Item(context: context)
        item1.courseItem = itemTxt.text
        item1.worthItem = worthTxt.text
        item1.markItem = markText.text
   
        course.addToIt(item1)
        
//        item1.courseItem = UILabel.init(frame: CGRect.init(x:9, y:15, width: 60, height: 30))
        
//        item1.courseItem /
//        item1.markItem = markText.text
//        (UIApplication.shared.delegate as! AppDelegate).saveContext()
//        self.navigationController!.popViewController(animated: true)
        
//        courseItem = UILabel.init(frame: CGRect.init(x:9, y:15, width: 60, height: 30))
//        worthItem = UILabel.init(frame: CGRect.init(x:140, y:15, width: 50, height: 30))
//        markItem = UILabel.init(frame: CGRect.init(x:270, y:15, width: 50, height: 30))
        
        
//        test.append(itemTxt.text!)
//        textFieldArray.append(courseItem)
//        textFieldArray.append(worthItem)
//        textFieldArray.append(markItem)
//        courseItem.text = item1.courseItem
//        worthItem.text = worthTxt.text
//        markItem.text = markText.text
        
         tableView.reloadData()
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        
//        tableView.reloadData()
        
    }
    
    //    fetching core data
    func getItem () {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        do {
            let fetchrequest:NSFetchRequest<Item> = Item.fetchRequest()
            let predict = NSPredicate(format: "%K == %@", "k", course)
            fetchrequest.predicate = predict
//            courseItems = try context.fetch(Item.fetchRequest()) as! [Item]
            courseItems = try context.fetch(fetchrequest)
            print(courseItems)
        

        } catch {
            print ("opps error while getting the items")
        }
    }
    
    func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath)
    {

        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        let fetchrequest:NSFetchRequest<Item> = Item.fetchRequest()
        let predict = NSPredicate(format: "%K == %@", "k", course)
        fetchrequest.predicate = predict
        
        let itemSelect = courseItems[indexPath.row];
        
        if editingStyle == UITableViewCellEditingStyle.delete {
            
            if let result = try? context.fetch(fetchrequest)
            {
                for _ in result{
                    context.delete(itemSelect)
                }
            }
            
            do {
                try context.save()
            } catch {
                print("opps")
            }
            
            tableView.reloadData()
        }
    }
    
    @IBAction func deleteBtn(_ sender: Any) {
//         let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
//        
//        let fetchrequest:NSFetchRequest<Item> = Item.fetchRequest()
//        let predict = NSPredicate(format: "%K == %@", "k", course)
//        fetchrequest.predicate = predict
//        //            courseItems = try context.fetch(Item.fetchRequest()) as! [Item]
////        courseItems = try context.fetch(fetchrequest)
//        
//        if let result = try? context.fetch(fetchrequest)
//        {
//            for object in result{
//               context.delete(object)
//            }
//            
//        }
//        
//        do {
//            try context.save()
//        } catch {
//            print("opps")
//        }
        
//        let managedContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
//
////         let itemSelect2 = courseItems[indexPath.row];
//
////        managedContext.delete(courseItems)
//
//        do {
//            try managedContext.save()
//        }catch {
//            print("Error");
//        }
//
//        do {
//            courseItems = try managedContext.fetch(Item.fetchRequest()) as! [Item]
//        } catch {
//            print("Error")
//        }
//
        tableView.reloadData()
        
//        if textFieldArray.last != nil
//        {
////            let fieldToRemove = textFieldArray.removeLast()
////            fieldToRemove.removeFromSuperview()
//            tableView.reloadData()
//        }
    }
    
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
 

}
