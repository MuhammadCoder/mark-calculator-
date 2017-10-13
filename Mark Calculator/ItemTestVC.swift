//
//  ItemTestVC.swift
//  Mark Calculator
//
//  Created by Muhammad  on 2017-10-11.
//  Copyright © 2017 Muhammad . All rights reserved.
//

import UIKit

class ItemTestVC: UIViewController {

//    @IBOutlet var testText: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func addBtn(_ sender: Any) {
        
//        making a new textfield
        let myField = UITextField.init(frame: CGRect.init(x:100, y:200, width: 100, height: 40))
        myField.borderStyle = UITextBorderStyle.roundedRect;
        myField.placeholder = "enter";
        myField.autocorrectionType = UITextAutocorrectionType.no;
        myField.keyboardType = UIKeyboardType.default;
        myField.contentVerticalAlignment = UIControlContentVerticalAlignment.center
        myField.delegate = self as? UITextFieldDelegate;
        myField.isOpaque = true
        myField.text = "hey"
        print(myField)
        self.view.addSubview(myField)
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
