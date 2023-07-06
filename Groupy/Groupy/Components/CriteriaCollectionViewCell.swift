//
//  CriteriaCollectionViewCell.swift
//  Groupy
//
//  Created by Carol Quiterio on 05/07/23.
//

import UIKit

class CriteriaCollectionViewCell: UICollectionViewCell {

    static let cellIdentifier = "colectionCell"

    @IBOutlet weak var icon: UIImageView!
    
    @IBOutlet weak var title: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.cornerRadius = 15
        icon.clipsToBounds = true
    }

    func setCellData(_ criteria: Criteria) {
        self.backgroundColor = criteria.color
        
        let imageIcon = UIImage(systemName: criteria.icon)?.withTintColor(.white, renderingMode: .alwaysOriginal)
        icon.image = imageIcon
        self.title.text = criteria.name
    }
}
