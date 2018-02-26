//
//  ViewController.swift
//  Mark Calculator
//
//  Created by Muhammad  on 2017-07-25.
//  Copyright © 2017 Muhammad . All rights reserved.
//

import UIKit

class ViewController: UIViewController {

//    @IBOutlet var switchBtn: UISwitch!
    @IBOutlet var aboutMeBtn: UIButton!

    @IBOutlet var semBtn: UIButton!
    
//    @IBOutlet var titleBorder: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        // making the buttons round
        aboutMeBtn.layer.cornerRadius = 6;
        //quicCalBtn.layer.cornerRadius = 6;
        semBtn.layer.cornerRadius = 6;
        
        ///titleBorder.layer.cornerRadius = 10;
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

