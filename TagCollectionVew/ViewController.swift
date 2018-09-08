//
//  ViewController.swift
//  TagCollectionVew
//
//  Created by Mahdi on 9/8/18.
//  Copyright © 2018 Mahdi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var carsCompanies = ["Nissan","Toyota","Chrysler","Honda","Buick","Chevrolet","Dodge","Mercedes Benz","Volvo","Volkswagen","BMW","Lexus","Mazda","Alfa Romeo","Aston Martin","Audi","Bentley","Bugatti","Ferrari","Fiat","Jeep","Hyundai","Maserati","Mini","Kia","Lamborghini"]
    
    //MARK: - View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nib = UINib(nibName: "TagCollectionViewCell", bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: "TagCell")
    }
}

    //MARK: - CollectionView DataSource

extension ViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return carsCompanies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TagCell", for: indexPath) as? TagCollectionViewCell {
            cell.config(name: carsCompanies[indexPath.row])
            
            return cell
        }
        return UICollectionViewCell()
    }
    
}

    //MARK: - CollectionView Layout

extension ViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 90, height: 45))
        label.text = carsCompanies[indexPath.row]
        label.font = UIFont.systemFont(ofSize: 15)
        label.sizeToFit()
        return CGSize(width: label.frame.width + 40, height: 40)
    }
}

