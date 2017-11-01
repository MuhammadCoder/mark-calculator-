//
//  testTableVCTableViewController.swift
//  Mark Calculator
//
//  Created by Muhammad  on 2017-10-31.
//  Copyright © 2017 Muhammad . All rights reserved.
//

import UIKit

class testTableVCTableViewController: UITableViewController {
    
    var textTable : [String] = ["hey"]
    var cCount = 0
    var courseArray : [UITextField] = []
    var testCount : (Int) = 0
    
    var courseItemText1 = UITextField.init(frame: CGRect.init(x:9.5, y:195, width: 95, height: 30))
    var worthText1 = UITextField.init(frame: CGRect.init(x:140, y:195, width: 95, height: 30))
    var markText1 = UITextField.init(frame: CGRect.init(x:270, y:195, width: 95, height: 30))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        tableView.delegate = self
        tableView.dataSource = self

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return courseArray.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
//         cell.textLabel?.text =
        cell.addSubview(courseItemText1)
        cell.addSubview(worthText1)
        cell.addSubview(markText1)
//        let tf = UITextField(frame: CGRect(x: 20, y: 100, width: 300, height: 20))
//        tf.placeholder = "Enter text here"
//        tf.font = UIFont.systemFont(ofSize: 15)
//        cell.addSubview(tf)
//        cell.textLabel?.t = courseArray[indexPath.row]
        
        return cell
    }
    
    @IBAction func btnTest(_ sender: Any) {
        courseItemText1 = UITextField.init(frame: CGRect.init(x:Int(9), y:15, width: 95, height: 30))
        courseItemText1.borderStyle = UITextBorderStyle.roundedRect;
        courseItemText1.placeholder = "enter"
        courseItemText1.autocorrectionType = UITextAutocorrectionType.no
        courseItemText1.keyboardType = UIKeyboardType.default
//        courseItemText1.contentVerticalAlignment = UIControlContentVerticalAlignment.center
//        courseItemText1.delegate = self as? UITextFieldDelegate
        courseItemText1.isOpaque = true
        courseArray.append(courseItemText1)
//        self.view.addSubview(courseItemText1)
        
        
        worthText1 = UITextField.init(frame: CGRect.init(x:Int(140), y:15, width: 95 , height: 28))
        worthText1.borderStyle = UITextBorderStyle.roundedRect
        worthText1.placeholder = "worth"
        worthText1.autocorrectionType = UITextAutocorrectionType.no
        worthText1.keyboardType = UIKeyboardType.default
        worthText1.contentVerticalAlignment = UIControlContentVerticalAlignment.center
        worthText1.delegate = self as? UITextFieldDelegate
        worthText1.isOpaque = true
//        worthArray.append(worthText1)
        
        markText1 = UITextField.init(frame: CGRect.init(x:250, y:15, width: 95, height: 28))
        markText1.borderStyle = UITextBorderStyle.roundedRect
        markText1.placeholder = "mark"
        markText1.autocorrectionType = UITextAutocorrectionType.no
        markText1.keyboardType = UIKeyboardType.default
        markText1.contentVerticalAlignment = UIControlContentVerticalAlignment.center
        markText1.delegate = self as? UITextFieldDelegate
        markText1.isOpaque = true
//        markArray.append(markText1);
//        self.view.addSubview(markText1)
     
        testCount = testCount + 1
        cCount = cCount + 45
        tableView.reloadData()
//        textTable.append("hey1")
        

    }
    //    func createTextfiel() -> UITableViewCell {
//        let cell:UITableViewCell = self.extraGustsTable.d
//        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
//
////        cell?.textLabel?.text = "some text"
//
//        let tf = UITextField(frame: CGRect(x: 20, y: 100, width: 300, height: 20))
//        tf.placeholder = "Enter text here"
//        tf.font = UIFont.systemFont(ofSize: 15)
//
//        //cell.contentView.addSubview(tf)
//        cell?.addSubview(tf)
//
//        return cell!
//    }
 

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

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
