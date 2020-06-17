//
//  HomeCellTableViewCell.swift
//  Homework41
//
//  Created by Kato on 6/16/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import UIKit

class HomeCell: UITableViewCell {
    
    @IBOutlet weak var coffeeImage: UIImageView!
    @IBOutlet weak var coffeeNameLabel: UILabel!
    
    var coffeeViewModel: CoffeeViewModel! {
        didSet {
            
            coffeeImage.image = coffeeViewModel.image
            coffeeNameLabel.text = coffeeViewModel.name
            
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
