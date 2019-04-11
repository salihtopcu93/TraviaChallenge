//
//  WinnersTableViewCell.swift
//  Trivia Challange
//
//  Created by salih topcu on 11.04.2019.
//  Copyright © 2019 salih topcu. All rights reserved.
//

import UIKit

class WinnersTableViewCell: UITableViewCell {
    
    @IBOutlet weak var winnerNamesLabel: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setView (result: WinnersNames) {
        winnerNamesLabel.text = result.name
    }

}
