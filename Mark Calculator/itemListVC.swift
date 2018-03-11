//
//  itemListVC.swift
//  Mark Calculator
//
//  Created by Muhammad  on 2018-03-11.
//  Copyright © 2018 Muhammad . All rights reserved.
//

import UIKit

class itemListVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
  

    @IBOutlet var tableview: UITableView!
    
    var arry = ["heyy", "elo"]
    override func viewDidLoad() {
        super.viewDidLoad()
        tableview.dataSource = self
        tableview.delegate = self
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arry.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableview.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = arry[indexPath.row]
        return cell
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
