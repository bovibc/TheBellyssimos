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
    
    private var projects: [Project]?
    
    func setCell(myClass: Class) {
        setCellLayout()
        resetData()
        setCellData(myClass)
    }
    
    private func setCellData(_ myClass: Class) {
        projects = myClass.projects?.allObjects as? [Project]
        self.titleLabel.text = myClass.name ?? ""
        self.setProjects()

    }
    
    private func setProjects() {
        validateFirstProject()
        validateSecondProject()
    }
    
    private func validateFirstProject() {
        if let projects = projects {
            if projects.count == 0 {
                self.firstProject.text = "There are no projects in this class yet!"
                self.firstProjectDate.text = ""
            } else if projects.count >= 1 {
                if let name = projects[0].name {
                    self.firstProject.text = name
                    if let startDate = projects[0].startDate, let dueDate = projects[0].dueDate {
                        
                        self.firstProjectDate.text = "\(formatDate(date: startDate)) - \(formatDate(date: dueDate))"
                    }
                }
            }
        }
    }
    
    private func validateSecondProject() {
        guard let projects = projects else { return }
        
        if projects.count >= 2 {
            if let name = projects[1].name {
                self.secondProject.text = name
                if let startDate = projects[1].startDate, let dueDate = projects[1].dueDate {
                    self.secondProjectDate.text = "\(formatDate(date: startDate)) - \(formatDate(date: dueDate))"
                }
            }
        } else {
            self.secondProject.text = ""
            self.secondProjectDate.text = ""
        }
    }
    
    private func formatDate(date: Date) -> String {
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM dd" 
        formatter.timeZone = TimeZone(abbreviation: "IST")
        return formatter.string(from: date)
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
