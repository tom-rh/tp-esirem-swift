//
//  ViewController.swift
//  tp-esirem-swift
//
//  Created by Tom Roth on 07/11/2022.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var titleView: UILabel!
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var todoTableView: UITableView!
    @IBOutlet weak var filterInput: UITextField!
    
    var todoList : TodoList?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        titleView.text = todoList?.name
        
        todoTableView.dataSource = self
        todoTableView.delegate = self
    }
    
    func getTodoList() -> [Todo] {
        if filterInput.text! == "" {
            return todoList!.todoCollection
        } else {
            return (todoList?.todoCollection.filter {
                $0.name.contains(filterInput.text!)
            })!
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (getTodoList().count)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = todoTableView.dequeueReusableCell(withIdentifier: "todoCell", for: indexPath) as! TodoTableViewCell
        let row = indexPath.row
        
        if row%2 == 0 {
            cell.backgroundColor = UIColor.systemGray6
        } else {
            cell.backgroundColor = UIColor.white
        }
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/YY"
        
        cell.nameTodo.text = dateFormatter.string(from: (getTodoList()[row].date)) + " - " + (getTodoList()[row].name)
        
        if (getTodoList()[row].done) {
            cell.buttonStatut.setImage(UIImage(systemName: "checkmark.circle.fill"), for: .normal)
        } else {
            cell.buttonStatut.setImage(UIImage(systemName: "checkmark.circle"), for: .normal)
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let delete = UIContextualAction(style: .destructive, title: "Supprimer", handler: { (action, view, completionHandler) in
            let row = indexPath.row
            self.todoList!.todoCollection.remove(at: row)
            completionHandler(true)
            tableView.reloadData()
        })
        
        let editStatut = UIContextualAction(style: .normal, title: "Changer le statut", handler: { [self] (action, view, completionHandler) in
            let row = indexPath.row
            
            if (getTodoList()[row].done) {
                self.todoList!.todoCollection[row].done = false
            } else {
                self.todoList!.todoCollection[row].done = true
            }
            completionHandler(true)
            tableView.reloadData()
        })
        
        let configuration = UISwipeActionsConfiguration(actions: [delete, editStatut])
        
        return configuration
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? DetailViewController {
            let row = todoTableView.indexPathForSelectedRow!.row
            vc.data = todoList!.todoCollection[row]
        }
    }
    
    @IBAction func save(_ unwindSegue: UIStoryboardSegue) {
        if let vc = unwindSegue.source as? AddViewController {
            if vc.todo != nil {
                todoList?.todoCollection.append(vc.todo!)
                todoTableView.reloadData()
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        todoTableView.reloadData()
    }
    
    @IBAction func editFilter(_ sender: Any) {
        todoTableView.reloadData()
    }
    
    @IBAction func sortByDate(_ sender: Any) {
        todoList?.todoCollection = (todoList?.todoCollection.sorted(by: { s1, s2 in s1.date < s2.date} ))!
        todoTableView.reloadData()
    }
}

