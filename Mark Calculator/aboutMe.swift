//
//  aboutMe.swift
//  Mark Calculator
//
//  Created by Muhammad  on 2017-07-25.
//  Copyright © 2017 Muhammad . All rights reserved.
//

import UIKit
import DynamicColor
import SwiftIcons



class aboutMe: UIViewController {

    @IBOutlet var developedBy: UILabel!
    
    @IBOutlet var backItem: UIBarButtonItem!
    @IBOutlet var toolBar1: UINavigationBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = DynamicColor(hex: 0xfafafa);
        developedBy.textColor = DynamicColor(hex: 0x3498db);
//        toolBar1.backgroundColor = DynamicColor(hex: 0x0d7cff);
        backItem.setIcon(icon: .fontAwesome(.angleLeft), iconSize: 30);
        
        //        developedBy.fontColor = [UIColor.white];
        
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
