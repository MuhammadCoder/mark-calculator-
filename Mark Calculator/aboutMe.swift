//
//  aboutMe.swift
//  Mark Calculator
//
//  Created by Muhammad  on 2017-07-25.
//  Copyright © 2017 Muhammad . All rights reserved.
//

import UIKit

class aboutMe: UIViewController {

    @IBOutlet var developedBy: UILabel!
    
    @IBOutlet var backItem: UIBarButtonItem!
    @IBOutlet var toolBar1: UINavigationBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        SweetAlert().showAle
//        SweetAlert().showAlert("Here's a message!", subTitle: "It's pretty, isn't it?", style: AlertStyle.none)
//        SweetAlert().showAlert("Good job!", subTitle: "You clicked the button!", style: AlertStyle.success)
//        SweetAlert().showAlert("Title", subTitle: "sub", style: AlertStyle.success, buttonTitle: "Click", buttonColor: UIColor.blue)
//        SweetAlert().textInputMode! as? UITextField {
//
//        }
    
        
//        SweetAlert().showAlert("Are you sure?", subTitle: "You file will permanently delete!", style: AlertStyle.warning, buttonTitle:"Cancel") { (isOtherButton) -> Void in
//
//            if isOtherButton == true {
//
//                print("Cancel Button  Pressed")
//            }
//            else {
//                SweetAlert().showAlert("Deleted!", subTitle: "Your imaginary file has been deleted!", style: AlertStyle.success)
//            }
//        }

        // developedBy.fontColor = [UIColor.white];
        
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
