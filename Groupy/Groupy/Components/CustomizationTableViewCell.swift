//
//  CustomizationTableViewCell.swift
//  Groupy
//
//  Created by Gabriel Leite on 11/07/23.
//

import UIKit

class CustomizationTableViewCell: UITableViewCell {

    @IBOutlet weak var valueSwitch: UISwitch!
    @IBOutlet weak var labelDescription: UILabel!
    
    static let cellIdentifier: String = "customizationCell"
    
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
        self.labelDescription.text = myLabel
    }
    
}
