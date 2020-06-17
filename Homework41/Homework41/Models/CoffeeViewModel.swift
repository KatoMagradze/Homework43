//
//  CoffeeViewModel.swift
//  Homework41
//
//  Created by Kato on 6/16/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import Foundation
import UIKit

struct CoffeeViewModel {
    
    var name: String
    var image: UIImage
    
    init(coffee: Coffee) {
        name = coffee.coffeeName
        image = coffee.coffeeImage
    }
    
}
