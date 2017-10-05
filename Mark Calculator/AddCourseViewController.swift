//
//  AddCourseViewController.swift
//  Mark Calculator
//
//  Created by Muhammad  on 2017-09-11.
//  Copyright © 2017 Muhammad . All rights reserved.
//

import UIKit

class AddCourseViewController: UIViewController {

    @IBOutlet var courseTextField: UITextField!
    
    var sem:Semester!
    override func viewDidLoad() {
        super.viewDidLoad()

    
    }

    @IBAction func addBtn(_ sender: Any) {
        
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let courseItem = Course(context: context)
        courseItem.name = courseTextField.text
        
        sem.addToCourse(courseItem)
        
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        navigationController!.popViewController(animated: true)
        
    }

}
