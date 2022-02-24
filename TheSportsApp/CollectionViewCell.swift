//
//  CollectionViewCell.swift
//  TheSportsApp
//
//  Created by Mohamed Maged on 22/02/2022.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var sportImage: UIImageView!
    
    @IBOutlet weak var sportName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
