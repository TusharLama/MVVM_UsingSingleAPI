//
//  PokemonNameCell.swift
//  MVVM_SingleAPI
//
//  Created by User on 18/03/22.
//

import UIKit

class PokemonNameCell: UITableViewCell {
    @IBOutlet weak var nameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
