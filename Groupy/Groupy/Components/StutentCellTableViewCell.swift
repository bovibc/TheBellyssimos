//
//  StutentCellTableViewCell.swift
//  Groupy
//
//  Created by Gabriel Leite on 03/07/23.
//

import UIKit

class StutentCellTableViewCell: UITableViewCell {
    
    var rowHeight : CGFloat!

    @IBOutlet weak var Name: UILabel!
    @IBOutlet weak var picture: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
