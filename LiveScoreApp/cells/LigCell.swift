//
//  LigCell.swift
//  LiveScoreApp
//
//  Created by Vasif Mehdizade on 28.07.22.
//

import UIKit

class LigCell: UITableViewCell {

    @IBOutlet weak var ligLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCell(item: LeagueModel) {
        ligLabel.text = item.name
    }

}
