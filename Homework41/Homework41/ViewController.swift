//
//  ViewController.swift
//  Homework41
//
//  Created by Kato on 6/16/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var contentView: UIView!
    
    @IBOutlet var buttons: [UIButton]!
    
    var homeViewController: UIViewController!
    var locationViewController: UIViewController!
    var coffeeViewController: UIViewController!
    var profileViewController: UIViewController!
    
    var viewControllers: [UIViewController]!
    var selectedIndex: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        contentView.layer.cornerRadius = 46
        
        //let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        let otherStoryboard = UIStoryboard(name: "Other", bundle: nil)
        
        homeViewController = otherStoryboard.instantiateViewController(withIdentifier: "home_vc")
        locationViewController = otherStoryboard.instantiateViewController(withIdentifier: "location_vc")
        coffeeViewController = otherStoryboard.instantiateViewController(withIdentifier: "coffee_vc")
        profileViewController = otherStoryboard.instantiateViewController(withIdentifier: "profile_vc")
        
        viewControllers = [homeViewController, locationViewController, coffeeViewController, profileViewController]
        
        buttons[selectedIndex].isSelected = true
        didPressTab(buttons[selectedIndex])
        
    }
    
    
    @IBAction func didPressTab(_ sender: UIButton) {
        
        let previousIndex = selectedIndex
        selectedIndex = sender.tag
        
        buttons[previousIndex].isSelected = false
        let previousVC = viewControllers[previousIndex]
        
        previousVC.willMove(toParent: nil)
        previousVC.view.removeFromSuperview()
        previousVC.removeFromParent()
        
        sender.isSelected = true
        let vc = viewControllers[selectedIndex]
        addChild(vc)
        vc.view.frame = contentView.bounds
        contentView.addSubview(vc.view)
        
        vc.didMove(toParent: self)
        
    }
    

}

