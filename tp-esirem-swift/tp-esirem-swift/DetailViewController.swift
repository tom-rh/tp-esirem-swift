//
//  DetailViewController.swift
//  tp-esirem-swift
//
//  Created by Tom Roth on 05/12/2022.
//

import UIKit

class DetailViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let todo = data {
            nameTodo.text = todo.name
            descTodo.text = todo.desc
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "dd/MM/YY"
            dateTodo.text = dateFormatter.string(from: todo.date)
        } else {
            nameTodo.text = "ERROR"
            descTodo.text = "-"
            dateTodo.text = "-"
        }
        
        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var nameTodo: UILabel!
    @IBOutlet weak var descTodo: UILabel!
    @IBOutlet weak var dateTodo: UILabel!
    
    var data: Todo?
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
