//
//  TodoListViewController.swift
//  tp-esirem-swift
//
//  Created by Tom Roth on 09/01/2023.
//

import UIKit

class TodoListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var inputNameTodoList: UITextField!
    @IBOutlet weak var addButtonTodoList: UIButton!
    @IBOutlet weak var todoListTableView: UITableView!
    
    var data : [TodoList] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        todoListTableView.dataSource = self
        todoListTableView.delegate = self
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func addTodoList(_ sender: Any) {
        let todoList = TodoList(name: inputNameTodoList.text!)
        data.append(todoList)
        todoListTableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = todoListTableView.dequeueReusableCell(withIdentifier: "todoListCell", for: indexPath) as! UITodoListTableViewCell
        let row = indexPath.row
        
        cell.nameTodoList.text = data[row].name
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? ViewController {
            let row = todoListTableView.indexPathForSelectedRow!.row
            vc.todoList = data[row]
        }
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let configuration = UISwipeActionsConfiguration(actions: [UIContextualAction(style: .destructive, title: "Supprimer", handler: { (action, view, completionHandler) in
            let row = indexPath.row
            self.data.remove(at: row)
            completionHandler(true)
            tableView.reloadData()
        })])
        return configuration
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        todoListTableView.reloadData()
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
