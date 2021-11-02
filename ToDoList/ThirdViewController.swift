//
//  ThirdViewController.swift
//  ToDoList
//
//  Created by Abu FaisaL on 26/03/1443 AH.
//

import UIKit

class ThirdViewController: UIViewController {
    var selectedIndex : Int!
    var list : List!
    
    @IBOutlet weak var editTitle: UITextField!
    
    @IBOutlet weak var editNote: UITextField!
    
    
    @IBAction func update(_ sender: Any) {
        list.items[selectedIndex] = TaskItem(title: editTitle.text!, note: editNote.text!)
        navigationController?.popViewController(animated: true)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        editTitle.text = list.items[selectedIndex].title
        editNote.text = list.items[selectedIndex].note
        // Do any additional setup after loading the view.
    }
    

    

}
