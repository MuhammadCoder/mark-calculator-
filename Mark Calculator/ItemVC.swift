//
//  ItemVC.swift
//  Mark Calculator
//
//  Created by Muhammad  on 2018-02-20.
//  Copyright © 2018 Muhammad . All rights reserved.
//

import UIKit

class ItemVC: UIViewController {

    var courseItem : [Item] = []
    var course : Course!
    
    @IBOutlet var itemTxt: UITextField!
    
    @IBOutlet var markTxt: UITextField!
    
    @IBOutlet var worthTxt: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.

        //        looking for a tap
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
        
    }
    
//    function called when there is a tap
    func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }

    
    @IBAction func addBtn(_ sender: Any) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        if (itemTxt.text == "")
        {
            let alert = UIAlertController(title: "Alert", message: "Error", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Click", style: UIAlertActionStyle.default, handler:nil))
            self.present(alert, animated: true, completion: nil)
        }
        else {
            
            let itemContent = Item(context: context)
            course.addToIt(itemContent)
            itemContent.courseItem = itemTxt.text
            itemContent.worthItem = worthTxt.text
            itemContent.markItem = markTxt.text
//            course.addToIt(itemContent)
            
            
            (UIApplication.shared.delegate as! AppDelegate).saveContext()
            self.navigationController!.popViewController(animated: true)
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
