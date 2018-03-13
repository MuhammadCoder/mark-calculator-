//
//  courseVC.swift
//  Mark Calculator
//
//  Created by Muhammad  on 2018-03-11.
//  Copyright © 2018 Muhammad . All rights reserved.
//

import UIKit

class courseVC: UIViewController {
    
    var course: Course!
    
    @IBOutlet var segmented: UISegmentedControl!
    @IBOutlet var container1: UIView!
    
    @IBOutlet var container2: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        container1.isHidden = false
        container2.isHidden = true
        // Do any additional setup after loading the view.
    }

    @IBAction func Choice(_ sender: Any) {
        switch segmented.selectedSegmentIndex {
        case 0:
            container1.isHidden = false
            container2.isHidden = true
//            performSegue(withIdentifier: "test", sender: self)
        case 1:
            container1.isHidden = true
            container2.isHidden = false
        default:
            break
        }
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        if segue.identifier == "test1" {
            let destination = segue.destination as! itemListVC
            destination.course = course
        }
    }
 

}
