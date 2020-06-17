//
//  HomeViewController.swift
//  Homework41
//
//  Created by Kato on 6/16/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import UIKit
import Localize

class HomeViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var georgianButton: UIButton!
    @IBOutlet weak var englishButton: UIButton!
    
    var coffees = [Coffee]()
    
    var coffeeModels = [CoffeeViewModel]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        addCoffees()
        
        tableView.dataSource = self
        tableView.separatorColor = .clear
        
        georgianButton.layer.cornerRadius = 10
        englishButton.layer.cornerRadius = 10
        
    }
    
    func addCoffees() {
        
        let espresso = Coffee(coffeeName: "Espresso".localized, coffeeImage: UIImage(named: "Espresso")!)
        let cappuccino = Coffee(coffeeName: "Cappuccino".localized, coffeeImage: UIImage(named: "Cappuccino")!)
        let macciato = Coffee(coffeeName: "Macciato".localized, coffeeImage: UIImage(named: "macciato")!)
        let mocha = Coffee(coffeeName: "Mocha".localized, coffeeImage: UIImage(named: "Mocha")!)
        let latte = Coffee(coffeeName: "Latte".localized, coffeeImage: UIImage(named: "latte")!)
        
        
        coffees.append(espresso)
        coffees.append(cappuccino)
        coffees.append(macciato)
        coffees.append(mocha)
        coffees.append(latte)
        
        coffeeModels = coffees.map({CoffeeViewModel(coffee: $0)})
        
    }
    

    @IBAction func georgianTapped(_ sender: UIButton) {
        
        let localize = Localize.shared
        localize.update(language: "ge")
        
        self.update()
        
        tableView.reloadData()
        
    }
    
    
    @IBAction func englishTapped(_ sender: UIButton) {
        
        let localize = Localize.shared
        localize.update(language: "en")
        
        self.update()
        
        tableView.reloadData()
    }
    
    func update() {
        for i in 0..<coffeeModels.count {
            coffeeModels[i].name = "\(coffeeModels[i].name)".localized
        }
    }
    
}

extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //return coffees.count
        return coffeeModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "home_cell", for: indexPath) as! HomeCell
        
        cell.coffeeViewModel = coffeeModels[indexPath.row]
        
        return cell
    }
    
}

