//
//  TESTVC.swift
//  Mark Calculator
//
//  Created by Muhammad  on 2018-03-26.
//  Copyright © 2018 Muhammad . All rights reserved.
//

import UIKit
import QuickTableViewController

class TESTVC: QuickTableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableContents = [
            Section(title: "Switch", rows: [
                SwitchRow(title: "Setting 1", switchValue: true, action: { _ in }),
                SwitchRow(title: "Setting 2", switchValue: false, action: { _ in }),
                ]),
            
//            Section(title: "Tap Action", rows: [
//                TapActionRow(title: "Tap action", action: { [weak self] in self?.showAlert($0) })
//                ]),
            
//            Section(title: "Navigation", rows: [
//                NavigationRow(title: "CellStyle.default", subtitle: .none, icon: Icon(image: UIImage(named: "globe")!, highlightedImage: UIImage(named: "globe-highlighted"))),
//                NavigationRow(title: "CellStyle", subtitle: .belowTitle(".subtitle"), icon: Icon(image: UIImage(named: "gear")!)),
//                NavigationRow(title: "CellStyle", subtitle: .rightAligned(".value1"), icon: Icon(imageName: "time"), action: nil ),
//                NavigationRow(title: "CellStyle", subtitle: .leftAligned(".value2"))
//                ]),
            
            RadioSection(title: "Radio Buttons", options: [
                OptionRow(title: "Option 1", isSelected: true, action: nil),
                OptionRow(title: "Option 2", isSelected: false, action: nil),
                OptionRow(title: "Option 3", isSelected: false, action: nil)
                ], footer: "See RadioSection for more details.")
        ]
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
