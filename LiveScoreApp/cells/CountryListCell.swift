//
//  CountryListCell.swift
//  LiveScoreApp
//
//  Created by Vasif Mehdizade on 26.07.22.
//

import UIKit

class CountryListCell: UITableViewCell {
    
    
    @IBOutlet weak var countryLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    func configureCell(item: CountryModel) {
        countryLabel.text = item.name
    }

}
