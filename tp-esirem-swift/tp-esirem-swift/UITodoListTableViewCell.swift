//
//  UITodoListTableViewCell.swift
//  tp-esirem-swift
//
//  Created by Tom Roth on 09/01/2023.
//

import UIKit

class UITodoListTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBOutlet weak var nameTodoList: UILabel!
}
