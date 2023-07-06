//
//  ClassTableViewCell.swift
//  Groupy
//
//  Created by Clissia Bozzer Bovi on 05/07/23.
//

import UIKit

enum CellType: String {
    case projects = "PROJECTS"
    case students = "STUDENTS"
}

class ClassStatusTableViewCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    var cellType: CellType = .projects
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
