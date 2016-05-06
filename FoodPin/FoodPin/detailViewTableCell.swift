//
//  detailViewTableCell.swift
//  FoodPin
//
//  Created by  wj on 15/10/13.
//  Copyright © 2015年 gzq. All rights reserved.
//

import UIKit

class detailViewTableCell: UITableViewCell {

    @IBOutlet weak var fieldLabel: UILabel!
    @IBOutlet weak var valueLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
