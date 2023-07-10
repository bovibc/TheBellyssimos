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
        resetData()
        setCellData(myClass)
    }
    
    private func setCellData(_ myClass: Class) {
        let projects = myClass.projects?.allObjects as? [Project]
        self.titleLabel.text = myClass.name ?? ""

        if projects!.count >= 2 {
            if let first = projects?[0], let name = first.name {
                self.firstProject.text = name
                if let startDate = first.startDate, let dueDate = first.dueDate {
                    self.firstProjectDate.text = "(\(startDate) - \(dueDate))"
                }
            }
            
            if let second = projects?[1], let name = second.name {
                self.secondProject.text = name
                if let startDate = second.startDate, let dueDate = second.dueDate {
                    self.secondProjectDate.text = "(\(startDate) - \(dueDate))"
                }
            }
        }
        else {
            self.firstProject.text = ""
            self.firstProjectDate.text = ""
            self.secondProject.text = ""
            self.secondProjectDate.text = ""
        }

    }
    
    private func resetData() {
        titleLabel.text = ""
        firstProject.text = ""
        secondProject.text = ""
        firstProjectDate.text = ""
        secondProjectDate.text = ""
    }
    
    private func setCellLayout() {
        self.layer.borderColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.3).cgColor
        self.layer.cornerRadius = 15
        self.layer.borderWidth = 1
    }
}
