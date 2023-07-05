//
//  MyClassesCollectionViewCell.swift
//  Groupy
//
//  Created by Clissia Bozzer Bovi on 04/07/23.
//

import UIKit

class MyClassesCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var cellView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var firstProject: UILabel!
    @IBOutlet weak var secondProject: UILabel!
    @IBOutlet weak var firstProjectDate: UILabel!
    @IBOutlet weak var secondProjectDate: UILabel!
    
    func setCell(myClass: Class) {
        setCellLayout()
        setCellData(myClass)
    }
    
    private func setCellData(_ myClass: Class) {
        self.titleLabel.text = myClass.name ?? ""
    }
    
    private func setCellLayout() {
        self.layer.borderColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.3).cgColor
        self.layer.cornerRadius = 15
        self.layer.borderWidth = 1
    }
}
