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

class VC: UIViewController,  UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate{
    
//    setting up core data
    var course: Course!
    var courseItems : [Item] = []

    @IBOutlet var tableView: UITableView!
    @IBOutlet var itemTxt: UITextField!
    @IBOutlet var worthTxt: UITextField!
    @IBOutlet var markText: UITextField!
   
    @IBOutlet var currentAvg: UILabel!
    
//    var courseItem = UILabel.init(frame: CGRect.init(x:9, y:15, width: 50, height: 30))
//    var worthItem = UILabel.init(frame: CGRect.init(x:9, y:15, width: 50, height: 30))
//    var markItem = UILabel.init(frame: CGRect.init(x:9, y:15, width: 50, height: 30))
    
    var textFieldArray : [UILabel] = []
    var arryNum : [Item] = []
    var test : [String] = []
    var value : [String] = [];
//    var currentMark : [Double];
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        tableView.delegate = self
        tableView.dataSource = self

        self.worthTxt.delegate = self

        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
        self.title = course.name
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let allowed = CharacterSet.decimalDigits
        let characters = CharacterSet(charactersIn: string)
        return allowed.isSuperset(of: characters)
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
       
        if ((itemTxt.text == "") || (worthTxt.text == "") || (markText.text == "")){
            let alert = UIAlertController(title:"Alert", message: "Error", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Click", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        else {
          
            item1.courseItem = itemTxt.text
            item1.worthItem = worthTxt.text
            item1.markItem = markText.text
//            let worthNum: Int? = Int(worthTxt.text!)
//            let markNum: Int? = Int(markText.text!)
            
//            let courseMark = markNum! * worthNum!
//            var  currentMark : Double = Double(courseMark) / Double(worthNum!)
            
//            currentAvg.text = String(describing: currentMark)
//            currentMark = courseMark / worthNum
//            print("this is guess", guess)
            
            course.addToIt(item1)
            arryNum.append(item1)
        }
        
        
        
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
        
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        
        tableView.reloadData()
        
    }
    
    // fetching from core data
    func getItem () {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        do {
            let fetchrequest:NSFetchRequest<Item> = Item.fetchRequest()
            let predict = NSPredicate(format: "%K == %@", "k", course)
            fetchrequest.predicate = predict
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
                    tableView.reloadData()
                }
            }
            
            do {
                try context.save()
            } catch {
                print("opps")
            }
        }
    }
    
    @IBAction func deleteBtn(_ sender: Any) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

        let fetchrequest:NSFetchRequest<Item> = Item.fetchRequest()
        let predict = NSPredicate(format: "%K == %@", "k", course)
        fetchrequest.predicate = predict
        
            if let result = try? context.fetch(fetchrequest)
            {
                for object in result{
                    context.delete(object)
                }
            }
            
            do {
                try context.save()
            } catch {
                print("opps")
            }
              
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
//        if segue.identifier == "getMark" {
//            let destintaion = segue.destination as! MarkVC
////            destintaion.selectedMark = "hey"
//            
//        }
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
 
    @IBAction func markBtn(_ sender: Any) {
       performSegue(withIdentifier: "getMark", sender: self)
    }
    
}
