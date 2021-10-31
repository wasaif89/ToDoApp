//
//  FirstViewController.swift
//  ToDoList
//
//  Created by Abu FaisaL on 23/03/1443 AH.
//

import UIKit

class FirstViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    @IBOutlet weak var table: UITableView!
    
    var items : [String] = []
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let Cell = UITableViewCell(style:.default, reuseIdentifier: "cell")
        Cell.textLabel?.text = items[indexPath.row]
        return Cell
    }
    override func viewWillAppear(_ animated: Bool) {
        let itemObject = UserDefaults.standard.object(forKey: "items")
        
        
        if let item = itemObject as? [String] {
            items = item
            
        }
        table.reloadData()
    }
    @IBAction func deleteAll(_ sender: Any) {
        items.removeAll()
        table.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        // Do any additional setup after loading the view.
    }
   
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCell.EditingStyle.delete {
            items.remove(at: indexPath.row)
    }
    
        
        table.reloadData()
        UserDefaults.standard.set(items, forKey: "items")
    }

}
