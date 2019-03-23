//
//  MessegeTableViewCell.swift
//  Find a Doctor
//
//  Created by CalibrageMac02 on 22/03/19.
//  Copyright © 2019 Calibrage Info System Pvt Limitd. All rights reserved.
//

import UIKit

class MessegeTableViewCell: UITableViewCell {
    
    @IBOutlet weak var titleLbl: UILabel!
    
    @IBOutlet weak var subTitileLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
