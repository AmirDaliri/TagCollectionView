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
    
    
    var screenSize: CGRect!
    var screenWidth: CGFloat!
    var screenHeight: CGFloat!
    
    //MARK: - View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nib = UINib(nibName: "TagCollectionViewCell", bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: "TagCell")
        setupLayout()
    }
    
    // MARK: - setup Custom Layout
    
    func setupLayout() {
        screenSize = UIScreen.main.bounds
        screenWidth = screenSize.width
        screenHeight = screenSize.height
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 20, left: 0, bottom: 10, right: 0)
        layout.itemSize = CGSize(width: screenWidth/3, height: screenWidth/3)
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        collectionView!.collectionViewLayout = layout
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

