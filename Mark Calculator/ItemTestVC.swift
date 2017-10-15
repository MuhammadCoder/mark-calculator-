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
    
    var courseItemText1 = UITextField.init(frame: CGRect.init(x:9.5, y:195, width: 95, height: 30));
    var  courseItemText = UITextField.init(frame: CGRect.init(x:Int(9.5), y:195 , width: 95, height: 30))
    var worthText1 = UITextField.init(frame: CGRect.init(x:140, y:195, width: 95, height: 30))
    var markText1 = UITextField.init(frame: CGRect.init(x:270, y:195, width: 95, height: 30))
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func addBtn(_ sender: Any) {
        
//        creating 3 textfield everytime the add button is pressed
//            course item textfield
        courseItemText1 = UITextField.init(frame: CGRect.init(x:Int(9.5), y:195 + yCount, width: 95, height: 30))
        courseItemText1.borderStyle = UITextBorderStyle.roundedRect;
        courseItemText1.placeholder = "enter"
        courseItemText1.autocorrectionType = UITextAutocorrectionType.no
        courseItemText1.keyboardType = UIKeyboardType.default
        courseItemText1.contentVerticalAlignment = UIControlContentVerticalAlignment.center
        courseItemText1.delegate = self as? UITextFieldDelegate
        courseItemText1.isOpaque = true
        self.view.addSubview(courseItemText1)
//          creating the worth textfield
        
        worthText1 = UITextField.init(frame: CGRect.init(x:140, y:195 + yCount, width: 95, height: 30))
        worthText1.borderStyle = UITextBorderStyle.roundedRect
        worthText1.placeholder = "enter"
        worthText1.autocorrectionType = UITextAutocorrectionType.no
        worthText1.keyboardType = UIKeyboardType.default
        worthText1.contentVerticalAlignment = UIControlContentVerticalAlignment.center
        worthText1.delegate = self as? UITextFieldDelegate
        worthText1.isOpaque = true
        self.view.addSubview(worthText1)
        
//           creating the mark % textfield
        markText1 = UITextField.init(frame: CGRect.init(x:270, y:195 + yCount, width: 95, height: 30))
        markText1.borderStyle = UITextBorderStyle.roundedRect
        markText1.placeholder = "enter"
        markText1.autocorrectionType = UITextAutocorrectionType.no
        markText1.keyboardType = UIKeyboardType.default
        markText1.contentVerticalAlignment = UIControlContentVerticalAlignment.center
        markText1.delegate = self as? UITextFieldDelegate
        markText1.isOpaque = true
        self.view.addSubview(markText1)
        
        yCount = yCount + 45
    }
    
//    deleting the textfield
    @IBAction func deleteBtn(_ sender: Any) {
        courseItemText1.removeFromSuperview()
        worthText1.removeFromSuperview()
        markText1.removeFromSuperview()
    }
    
    /*
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
