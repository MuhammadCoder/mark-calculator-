//
//  ItemTBCell.swift
//  Mark Calculator
//
//  Created by Muhammad  on 2018-02-20.
//  Copyright © 2018 Muhammad . All rights reserved.
//

import UIKit

class ItemTBCell: UITableViewCell {

   
    @IBOutlet var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func customTest(text: String){
        self.titleLabel.text = text
        self.titleLabel.textColor = UIColor.white
        self.contentView.backgroundColor = UIColor.darkGray
    }
}
