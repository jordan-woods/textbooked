//
//  CustomTableViewCell.swift
//  textbooked
//
//  Created by Jordan Woods on 3/17/18.
//  Copyright © 2018 Jordan Woods. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    @IBOutlet weak var textbookImage: UIImageView!
    @IBOutlet weak var textbookTitle: UILabel!
    @IBOutlet weak var textbookAuthor: UILabel!
    @IBOutlet weak var textbookCondition: UILabel!
    @IBOutlet weak var sellerName: UILabel!
    @IBOutlet weak var sellPrice: UILabel!
    @IBOutlet weak var purchasedStatus: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
