//
//  TodoTableViewCell.swift
//  tp-esirem-swift
//
//  Created by Tom Roth on 29/11/2022.
//

import UIKit

class TodoTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBOutlet weak var nameTodo: UILabel!
    @IBOutlet weak var buttonStatut: UIButton!
}
