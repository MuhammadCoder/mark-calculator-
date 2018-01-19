//
//  MarkVC.swift
//  Mark Calculator
//
//  Created by Muhammad  on 2018-01-19.
//  Copyright © 2018 Muhammad . All rights reserved.
//

import UIKit

class MarkVC: UIViewController {
    
    
    @IBOutlet var testLabel: UILabel!
    
    private var _selectedMark: String!
    
    var selectedMark: String {
        get {
            return _selectedMark
        }
        set {
            _selectedMark = newValue
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        testLabel.text = _selectedMark
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
