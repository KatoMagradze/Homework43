//
//  ViewController.swift
//  Homework43
//
//  Created by Kato on 6/17/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var asiaCollectionView: UICollectionView!
    @IBOutlet weak var europeCollectionView: UICollectionView!
    @IBOutlet weak var africaCollectionView: UICollectionView!
    
    var countries = [Country]()
    let apiService = APIService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view
        
        asiaCollectionView.delegate = self
        asiaCollectionView.dataSource = self
        
        europeCollectionView.delegate = self
        europeCollectionView.dataSource = self
        
        africaCollectionView.delegate = self
        africaCollectionView.dataSource = self

        apiService.fetchCountries { (countries) in
            
            for country in countries {
                //print(country.name)
                self.countries.append(country)
            }
            
            DispatchQueue.main.async {
                self.asiaCollectionView.reloadData()
                self.europeCollectionView.reloadData()
                self.africaCollectionView.reloadData()
            }
            
        }
    }
    
    
    
}
extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return countries.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = asiaCollectionView.dequeueReusableCell(withReuseIdentifier: "asia_cell", for: indexPath) as! AsiaCell
        
        countries[indexPath.row].flag.downloadImage { (image) in
            DispatchQueue.main.async {
                cell.asiaImageView.image = image
            }
        }
        
        cell.asiaLabel.text = countries[indexPath.row].name
        
        return cell
    }
    
}

extension String {
    
    func downloadImage(completion: @escaping (UIImage?) -> ()) {

        guard let url = URL(string: self) else {return}
        URLSession.shared.dataTask(with: url) { (data, res, err) in
            guard let data = data else {return}
            completion(UIImage(data: data))
        }.resume()
    }
    
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let itemWith = collectionView.frame.width / 2
        
        return CGSize(width: itemWith - 20 - 20, height: 150)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: 30, left: 20, bottom: 0, right: 20)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
}


