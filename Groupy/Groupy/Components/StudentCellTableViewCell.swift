//
//  StutentCellTableViewCell.swift
//  Groupy
//
//  Created by Gabriel Leite on 03/07/23.
//

import UIKit

class StudentCellTableViewCell: UITableViewCell {
    
    var rowHeight : CGFloat!
    static let cellIdentifier = "cell"

    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var picture: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        
        picture.layer.cornerRadius = picture.frame.size.width / 2
        picture.clipsToBounds = true
    }
    
    func setCell(myStudent: Student?) {
        setCellData(myStudent)
    }
    
    private func setCellData(_ myStudent: Student?) {
        self.name.text = myStudent?.name ?? ""
        self.picture.image = UIImage(systemName: "person")
    }
    
    
}
