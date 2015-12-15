//
//  ListTableViewCell.swift
//  福利社swift
//
//  Created by admin on 15/9/21.
//  Copyright © 2015年 admin. All rights reserved.
//

import UIKit

class ListTableViewCell: UITableViewCell {

    @IBOutlet weak var imag: UIImageView!
    
    @IBOutlet weak var lab: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.imag.frame = CGRectMake(0, 0, UIScreen.mainScreen().bounds.size.width, 50)
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
