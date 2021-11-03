//
//  FirstViewController.swift
//  ToDoList


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
       
        table.reloadData()
    }
    @IBAction func deleteAll(_ sender: Any) {
        list.items.removeAll()
        table.reloadData()
        UserDefaults.standard.set(list.items, forKey: "list-items")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCell.EditingStyle.delete {
            list.items.remove(at: indexPath.row)
    }

        table.reloadData()
        //UserDefaults.standard.set(list.items, forKey: "list-items")
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("User selected: \(indexPath.row)")
        userSelectedCell = indexPath.row
        performSegue(withIdentifier: "editSegue", sender: self)
        
    }
   

  
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "addSegue") {
            let secVC = segue.destination as! SecondViewController
            secVC.list = list
            
        } else if(segue.identifier == "editSegue") {
            let thirdVC = segue.destination as! ThirdViewController
            thirdVC.list = list
            thirdVC.selectedIndex = userSelectedCell
}
    }

}
