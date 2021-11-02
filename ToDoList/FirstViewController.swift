//
//  FirstViewController.swift
//  ToDoList
//
//  Created by Abu FaisaL on 23/03/1443 AH.
//

import UIKit

class FirstViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    @IBOutlet weak var table: UITableView!
    
    var list : List = List()
    var userSelectedCell : Int!
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let Cell = UITableViewCell(style: .subtitle , reuseIdentifier: "cell")
        Cell.textLabel?.text = list.items[indexPath.row].title
        Cell.detailTextLabel?.text = list.items[indexPath.row].note
        return Cell
    }
    override func viewWillAppear(_ animated: Bool) {
//        let itemObject = UserDefaults.standard.object(forKey: "list-items")
//        print(itemObject)
//        
//        if let item = itemObject as? [TaskItem] { //st
//            list.items = item
//        }
//        
        table.reloadData()
    }
    @IBAction func deleteAll(_ sender: Any) {
        list.items.removeAll()
        table.reloadData()
        UserDefaults.standard.set(list.items, forKey: "list-items")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//tableview
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCell.EditingStyle.delete {
            list.items.remove(at: indexPath.row)
    }

        table.reloadData()
        //UserDefaults.standard.set(list.items, forKey: "list-items")
    }
    
    
   // func moveItem(from: IndexSet, to: Int){
   //     items.move.(fromOffsets: from, toOffset: to)
   //}
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("User selected: \(indexPath.row)")
        userSelectedCell = indexPath.row
        performSegue(withIdentifier: "editSegue", sender: self)
    }
   

   // func edit(changes: , indexPath.row: Int){
   //     items[indexPath.row] = changes
   //     table.reloadData()
  // }
   
    
    // func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
       // if editingStyle == UITableViewCell.EditingStyle.update {
          //  items.[indexPath.row]
   // }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "addSegue") {
            let secVC = segue.destination as! SecondViewController
            secVC.list = list
            
        } else if(segue.identifier == "editSegue") {
            let thirdVC2 = segue.destination as! ThirdViewController
            thirdVC2.list = list
            thirdVC2.selectedIndex = userSelectedCell
}
    }

}
