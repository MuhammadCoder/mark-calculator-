//
//  GradeVC.swift
//  Mark Calculator
//
//  Created by Muhammad  on 2018-02-20.
//  Copyright © 2018 Muhammad . All rights reserved.
//

import UIKit

class GradeVC: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    struct Testobj {
        var sectionName : String!
        var sectionObj : [Item] = []
    }
   
    @IBOutlet var tableView: UITableView!
    
    
    var arrayObject = [Testobj]()
    var test : [Item] = []

    var selectedSegment = 1

    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        //setting up the table
        tableView.delegate = self
        tableView.dataSource = self
        
//        let nib = UINib(nibName: "ItemTBCell", bundle:nil)
//        tableView.register(nib, forCellReuseIdentifier: "customCell")
        tableView.backgroundColor = UIColor.darkGray
        
        arrayObject = [
            Testobj(sectionName: "Quizzes", sectionObj:[]),
//            Testobj(sectionName:"Assignments", sectionObj: ["A1","A2"]),
//            Testobj(sectionName:"Midterm", sectionObj: ["M1","M2"]),
//            Testobj(sectionName:"Labs", sectionObj: ["L1","L2"]),
            Testobj(sectionName:"Other", sectionObj: [])]
        
        // Do any additional setup after loading the view.
//        tableview.
    }
    override func viewWillAppear(_ animated: Bool) {
        getItem()
        tableView.reloadData()
    }
    
//    func numberOfSections(in tableView: UITableView) -> Int {
//        return arrayObject.count
//    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return arrayObject[section].sectionObj.count
        return test.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cell =  tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
         let cell2 =  tableView.dequeueReusableCell(withIdentifier: "Cell2", for: indexPath)
//        let cell = tableView.dequeueReusableCell(withIdentifier: "customCell") as! ItemTBCell
        let item1 = test[indexPath.row]
        cell.textLabel?.text = item1.courseItem
        cell2.textLabel?.text = "second"
        
        if selectedSegment == 1 {
             return cell
        }
        else {
            
            return cell2
        }
//        cell.textLabel?.text = item1.courseItem
//        cell.customTest(text: item1.courseItem!)
//        cell.customTest(text: item1.courseItem!)
//        let item11 = arrayObject[indexPath.section].sectionObj[indexPath.row]
//        if (arrayObject[0].sectionName == ) {
//            print("YEWERWE")
//        }
//        cell.textLabel?.text = item11.courseItem
        
//        return cell
    }
//    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
////        tableView
////        return arrayObject[section].sectionName
//    }
    
    func getItem () {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        do {
//            arrayObject.append(Testobj.init(sectionName: "hey", sectionObj.append("hey") ))
//            Testobj[]
//            let test =
//            Testobj.init().sectionObj.append("hey")
            
             test = try context.fetch(Item.fetchRequest()) as! [Item]
            
//            arrayObject.append(yo)
//            Testobj[sectionObj]
//            arrayObject[0].sectionObj = test
//            arrayObject[1].sectionObj = test
//            arrayObject.append(Testobj)
       
//            arrayObject.append(Testobj.init(sectionName: "hey", sectionObj: test))
//            let item2 = test.count
         
        } catch {
            print("error")
        }
//            print(semesters)
       
    }
    
  
    @IBAction func switchSegAction(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            selectedSegment = 1
        }
        else {
            selectedSegment = 2
        }
        tableView.reloadData()
    }
    
  
   
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
