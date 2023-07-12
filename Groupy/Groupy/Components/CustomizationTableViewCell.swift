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
    
    
    @IBAction func switchValueChanged(_ sender: Any) {
        if labelDescription.text != "New colleagues" {
            showAlert(title: "Feature unavailable", message: "We're sorry, but the only criteria available on this build version is 'New colleagues'.")
            valueSwitch.isOn = false
        }
    }
    
    func showAlert(title: String, message: String) {
            let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            alertController.addAction(okAction)
            
            // Get a reference to the view controller presenting the alert
            guard let viewController = UIApplication.shared.keyWindow?.rootViewController else { return }
            
            viewController.present(alertController, animated: true, completion: nil)
        }
    
    func setCell(myLabel: String) {
        setCellData(myLabel)
    }
    
    private func setCellData(_ myLabel: String) {
        self.labelDescription.text = myLabel
    }
    
}
