//
//  SecondViewController.swift
//  ToDoList
//
//  Created by Abu FaisaL on 23/03/1443 AH.
//

import UIKit

class SecondViewController: UIViewController {

    
    @IBOutlet weak var itemTextField: UITextField!
    
    @IBAction func add(_ sender: Any) {
        
        let itemObject = UserDefaults.standard.object(forKey: "items")
        var items : [String]
        
        if let item = itemObject as? [String] {
            items = item
            items.append(itemTextField.text!)
        }else {
            items = [itemTextField.text!]
        }
        UserDefaults.standard.set(items, forKey: "items")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        // Do any additional setup after loading the view.
    }
    

}
