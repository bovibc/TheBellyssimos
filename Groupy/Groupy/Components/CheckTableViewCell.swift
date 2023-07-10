//
//  CheckTableViewCell.swift
//  Groupy
//
//  Created by Gabriel Leite on 10/07/23.
//

import UIKit

class CheckTableViewCell: UITableViewCell {

    @IBOutlet weak var name: UILabel!
    static let cellIdentifier = "checkCell"
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setCell(myLabel: String) {
        setCellData(myLabel)
    }
    
    private func setCellData(_ myLabel: String) {
        self.name.text = myLabel
    }
    
}
