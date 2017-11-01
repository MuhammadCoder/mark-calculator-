//
//  testVC.swift
//  Mark Calculator
//
//  Created by Muhammad  on 2017-11-01.
//  Copyright © 2017 Muhammad . All rights reserved.
//

import UIKit

class testVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var textFieldArray : [UITextField] = []
    
    var courseItem = UITextField.init(frame: CGRect.init(x:9, y:15, width: 95, height: 30))
    
    @IBOutlet var tableView: UITableView!
//    var testItem : [String] = ["hey", "yo", "yye"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
//    func numberOfSections(in tableView: UITableView) -> Int {
//        return 1
//    }
//    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return textFieldArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
//        cell.textLabel?.text = testItem[indexPath.row]
        cell.addSubview(courseItem)
        return cell
    }
    
    @IBAction func addBtn(_ sender: Any) {
        courseItem = UITextField.init(frame: CGRect.init(x:Int(9), y:15, width: 95, height: 30))
        courseItem.borderStyle = UITextBorderStyle.roundedRect;
        courseItem.placeholder = "enter"
        courseItem.autocorrectionType = UITextAutocorrectionType.no
        courseItem.keyboardType = UIKeyboardType.default
        courseItem.contentVerticalAlignment = UIControlContentVerticalAlignment.center
        courseItem.delegate = self as? UITextFieldDelegate
        courseItem.isOpaque = true
        textFieldArray.append(courseItem)
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
