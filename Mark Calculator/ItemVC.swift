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
    
    @IBOutlet var itemTxt: UITextField!
    
    @IBOutlet var markTxt: UITextField!
    
    @IBOutlet var worthTxt: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
            itemContent.courseItem = itemTxt.text
            
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
