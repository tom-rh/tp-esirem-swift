//
//  AddViewController.swift
//  tp-esirem-swift
//
//  Created by Tom Roth on 06/12/2022.
//

import UIKit

class AddViewController: UIViewController {

    @IBOutlet weak var nameTodoInput: UITextField!
    @IBOutlet weak var descTodoInput: UITextField!
    @IBOutlet weak var dateTodoInput: UIDatePicker!
    
    var todo : Todo?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        todo = Todo(name: "", desc: "")
        // Do any additional setup after loading the view.
    }
    
    @IBAction func updateName(_ sender: Any) {
        todo?.name = nameTodoInput.text!
    }
    
    @IBAction func updateDesc(_ sender: Any) {
        todo?.desc = descTodoInput.text!
    }
    
    @IBAction func updateDate(_ sender: Any) {
        todo?.date = dateTodoInput.date
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
