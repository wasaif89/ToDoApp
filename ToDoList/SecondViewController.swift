//
//  SecondViewController.swift
//  ToDoList
//
//  Created by Abu FaisaL on 23/03/1443 AH.
//

import UIKit

class SecondViewController: UIViewController {
    var list : List! 

    
    @IBOutlet weak var titleTextField: UITextField!
    
    @IBOutlet weak var noteTextField: UITextField!
    @IBAction func add(_ sender: Any) {
        

            let item = TaskItem(title: titleTextField.text!, note: noteTextField.text!)
            list.items.append(item)

        
    //  UserDefaults.standard.set(list.items, forKey: "list-items")
        navigationController?.popViewController(animated: true)
        
        
 
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        // Do any additional setup after loading the view.
    }
    

}
