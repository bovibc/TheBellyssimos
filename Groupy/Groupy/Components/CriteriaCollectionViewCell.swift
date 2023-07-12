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
    
    @IBOutlet weak var background: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.cornerRadius = 15
        icon.clipsToBounds = true
    }

    func setCellData(_ criteria: Criteria) {
        self.background.backgroundColor = .white
        
        let imageIcon = UIImage(systemName: criteria.icon)?.withTintColor(criteria.color, renderingMode: .alwaysOriginal)
        icon.image = imageIcon
        self.title.text = criteria.name
    }
}
