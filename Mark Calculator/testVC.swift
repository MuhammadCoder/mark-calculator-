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
    var worthText = UITextField.init(frame: CGRect.init(x:140, y:15, width: 95, height: 30))
    var markText = UITextField.init(frame: CGRect.init(x:250, y:15, width: 95, height: 30))
    
    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return textFieldArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
//        adding textfields created to the cell
        cell.addSubview(courseItem)
        cell.addSubview(worthText)
        cell.addSubview(markText)
        
        return cell
    }
    
    @IBAction func addBtn(_ sender: Any) {
        
//        creating new textfields
//        textfield for item
        courseItem = UITextField.init(frame: CGRect.init(x:Int(9), y:15, width: 95, height: 30))
        courseItem.borderStyle = UITextBorderStyle.roundedRect;
        courseItem.placeholder = "enter"
        courseItem.autocorrectionType = UITextAutocorrectionType.no
        courseItem.keyboardType = UIKeyboardType.default
        courseItem.contentVerticalAlignment = UIControlContentVerticalAlignment.center
        courseItem.delegate = self as? UITextFieldDelegate
        courseItem.isOpaque = true
        textFieldArray.append(courseItem)
//        textfield for worth
        worthText = UITextField.init(frame: CGRect.init(x:Int(140), y:15, width: 95 , height: 28))
        worthText.borderStyle = UITextBorderStyle.roundedRect
        worthText.placeholder = "worth"
        worthText.autocorrectionType = UITextAutocorrectionType.no
        worthText.keyboardType = UIKeyboardType.default
        worthText.contentVerticalAlignment = UIControlContentVerticalAlignment.center
        worthText.delegate = self as? UITextFieldDelegate
        worthText.isOpaque = true
//        textfield for mark
        markText = UITextField.init(frame: CGRect.init(x:250, y:15, width: 95, height: 28))
        markText.borderStyle = UITextBorderStyle.roundedRect
        markText.placeholder = "mark"
        markText.autocorrectionType = UITextAutocorrectionType.no
        markText.keyboardType = UIKeyboardType.default
        markText.contentVerticalAlignment = UIControlContentVerticalAlignment.center
        markText.delegate = self as? UITextFieldDelegate
        markText.isOpaque = true

        tableView.reloadData()
    }
    
    @IBAction func deleteBtn(_ sender: Any) {
    
        if textFieldArray.last != nil
        {
            let fieldToRemove = textFieldArray.removeLast()
            fieldToRemove.removeFromSuperview()
             tableView.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCellEditingStyle.delete {
            textFieldArray.remove(at: indexPath.row)
            tableView.reloadData()
        }
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
