//
//  ItemTestVC.swift
//  Mark Calculator
//
//  Created by Muhammad  on 2017-10-11.
//  Copyright © 2017 Muhammad . All rights reserved.
//
import UIKit

class ItemTestVC: UIViewController {
    
    var xCount : (Double) = 0;
    var yCount = 0;
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func addBtn(_ sender: Any) {
        
//        creating 3 textfield everytime the add button is pressed
        if (yCount == 0) {
//            course item textfield
            let courseItemText1 = UITextField.init(frame: CGRect.init(x:9.5, y:195, width: 95, height: 30))
            courseItemText1.borderStyle = UITextBorderStyle.roundedRect;
            courseItemText1.placeholder = "enter"
            courseItemText1.autocorrectionType = UITextAutocorrectionType.no
            courseItemText1.keyboardType = UIKeyboardType.default
            courseItemText1.contentVerticalAlignment = UIControlContentVerticalAlignment.center
            courseItemText1.delegate = self as? UITextFieldDelegate
            courseItemText1.isOpaque = true
            self.view.addSubview(courseItemText1)
//           creating the worth textfield
            let worthText1 = UITextField.init(frame: CGRect.init(x:140, y:195, width: 95, height: 30))
            worthText1.borderStyle = UITextBorderStyle.roundedRect
            worthText1.placeholder = "enter"
            worthText1.autocorrectionType = UITextAutocorrectionType.no
            worthText1.keyboardType = UIKeyboardType.default
            worthText1.contentVerticalAlignment = UIControlContentVerticalAlignment.center
            worthText1.delegate = self as? UITextFieldDelegate
            worthText1.isOpaque = true
            self.view.addSubview(worthText1)
//           creating the mark % textfield
            let markText1 = UITextField.init(frame: CGRect.init(x:270, y:195, width: 95, height: 30))
            markText1.borderStyle = UITextBorderStyle.roundedRect
            markText1.placeholder = "enter"
            markText1.autocorrectionType = UITextAutocorrectionType.no
            markText1.keyboardType = UIKeyboardType.default
            markText1.contentVerticalAlignment = UIControlContentVerticalAlignment.center
            markText1.delegate = self as? UITextFieldDelegate
            markText1.isOpaque = true
            self.view.addSubview(markText1)
        }
        else {
//            creating course textfields
            let courseItemText = UITextField.init(frame: CGRect.init(x:Int(9.5), y:195 + yCount, width: 95, height: 30))
            courseItemText.borderStyle = UITextBorderStyle.roundedRect;
            courseItemText.placeholder = "course item";
            courseItemText.autocorrectionType = UITextAutocorrectionType.no;
            courseItemText.keyboardType = UIKeyboardType.default;
            courseItemText.contentVerticalAlignment = UIControlContentVerticalAlignment.center
            courseItemText.delegate = self as? UITextFieldDelegate;
            courseItemText.isOpaque = true
            self.view.addSubview(courseItemText)
//            creating worth textfield
            let worthText = UITextField.init(frame: CGRect.init(x:140, y:195 + yCount, width: 95, height: 30))
            worthText.borderStyle = UITextBorderStyle.roundedRect;
            worthText.placeholder = "worth"
            worthText.autocorrectionType = UITextAutocorrectionType.no;
            worthText.keyboardType = UIKeyboardType.default
            worthText.contentVerticalAlignment = UIControlContentVerticalAlignment.center
            worthText.delegate = self as? UITextFieldDelegate
            worthText.isOpaque = true
            self.view.addSubview(worthText)
//            creating mark textfield
            let markText = UITextField.init(frame: CGRect.init(x:270, y:195 + yCount, width: 95, height: 30))
            markText.borderStyle = UITextBorderStyle.roundedRect
            markText.placeholder = "mark"
            markText.autocorrectionType = UITextAutocorrectionType.no
            markText.keyboardType = UIKeyboardType.default
            markText.contentVerticalAlignment = UIControlContentVerticalAlignment.center
            markText.delegate = self as? UITextFieldDelegate
            markText.isOpaque = true
            self.view.addSubview(markText)
        }
        yCount = yCount + 45
    }
    

    /*
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
