//
//  UniversityTableViewCell.swift
//  Evyree
//
//  Created by William Chen on 2022/12/4.
//

import UIKit

class UniversityTableViewCell: UITableViewCell {

    @IBOutlet weak var schoolNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
