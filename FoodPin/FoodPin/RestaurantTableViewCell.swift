//
//  RestaurantTableViewCell.swift
//  FoodPin
//
//  Created by  wj on 15/10/9.
//  Copyright © 2015年 gzq. All rights reserved.
//

import UIKit

class RestaurantTableViewCell: UITableViewCell {
    @IBOutlet var nameLabel:UILabel!
    @IBOutlet var locatLabel:UILabel!
    @IBOutlet var typeLabel:UILabel!
    @IBOutlet var thumbnailImageView:UIImageView!

    @IBOutlet weak var checkMark: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
