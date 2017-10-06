//
//  AddTestViewController.swift
//  Mark Calculator
//
//  Created by Muhammad  on 2017-09-10.
//  Copyright © 2017 Muhammad . All rights reserved.
//

import UIKit

class addSemViewController: UIViewController {

    @IBOutlet var textLabel: UILabel!
    
    
    @IBOutlet var addTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func addTest(_ sender: Any) {
        
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        if (addTextField.text == "")
        {
            let alert = UIAlertController(title: "Alert", message: "Error", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Click", style: UIAlertActionStyle.default, handler:nil))
            self.present(alert, animated: true, completion: nil)
        }
            
        else {
            let item = Semester(context: context)
            item.sem = addTextField.text
            
            (UIApplication.shared.delegate as! AppDelegate).saveContext()
            self.navigationController!.popViewController(animated: true)
        }
    }

}
