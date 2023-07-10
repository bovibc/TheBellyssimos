//
//  PickerTableViewCell.swift
//  Groupy
//
//  Created by Gabriel Leite on 10/07/23.
//

import UIKit

class PickerTableViewCell: UITableViewCell {

    @IBOutlet weak var pickerDescription: UIPickerView!
    @IBOutlet weak var labelDecription: UILabel!
    
    static let cellIdentifier = "pickerCell"
    var pickerList: [String] = []
    
    override func awakeFromNib() {
        super.awakeFromNib()
        pickerDescription.delegate = self
        pickerDescription.dataSource = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setCell(myLabel: String, myPicker: [String]) {
        setCellData(myLabel, myPicker)
    }
    
    private func setCellData(_ myLabel: String, _ myPicker: [String]) {
        self.labelDecription.text = myLabel
        self.pickerList = myPicker
    }
    
}

extension PickerTableViewCell: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerList.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerList[row]
    }
    
}
