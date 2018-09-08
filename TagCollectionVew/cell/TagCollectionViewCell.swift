
//
//  TagCollectionViewCell.swift
//  TagCollectionVew
//
//  Created by Mahdi on 9/8/18.
//  Copyright © 2018 Mahdi. All rights reserved.
//

import UIKit

class TagCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var label : UILabel!

    func config(name : String) {
        
        label.text = name
        
        label.layer.borderWidth = 2
        label.layer.borderColor = UIColor.white.cgColor
        label.font = UIFont.systemFont(ofSize: 16)
        label.layer.cornerRadius = 20
        label.layer.masksToBounds = true
    }

}
