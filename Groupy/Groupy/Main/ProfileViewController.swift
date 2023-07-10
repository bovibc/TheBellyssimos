//
//  ProfileViewController.swift
//  Groupy
//
//  Created by Luan Fazolin on 30/06/23.
//

import UIKit
import AVFoundation

class ProfileViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var profileName: UILabel!
    @IBOutlet weak var profilePicture: UIImageView!
    @IBOutlet weak var logOutButton: UIButton!
    
    private let sectionNumber: Int = 2
    private let declarations: [String] = ["MBTI", "Working style","Skin tone", "Gender","Enthnicity"]
    private let skills: [String] = ["Swift", "Figma"]
    private let parameters = [MockData().mbtiPersonality,MockData().wsPersonality,MockData().skinTone,MockData().gender,MockData().ethnicities]

    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigationBar()
        tableView.delegate = self
        tableView.dataSource = self
        let nib = UINib(nibName: "PickerTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: PickerTableViewCell.cellIdentifier)
        configureImage()
    }
    
    private func configureImage() {
        var image = UIImage(named: "bandeira")
        image = resizeImage(image: image!, targetSize: CGSize(width: 144, height: 144))
        profilePicture.image = image
        profilePicture.layer.borderColor = UIColor.black.cgColor
        profilePicture.layer.borderWidth = 1
        profilePicture.layer.masksToBounds = false
        profilePicture.layer.cornerRadius = profilePicture.frame.size.width / 2
        profilePicture.clipsToBounds = true
    }
    
    override func viewDidAppear(_ animated: Bool) {
        configureNavigationBar()
    }
    
    private func configureNavigationBar() {
        self.navigationController?.navigationBar.topItem?.title = "Profile"
        self.navigationController?.navigationBar.topItem?.rightBarButtonItem = nil
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .systemBackground
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = navigationController?.navigationBar.standardAppearance

        view.backgroundColor = UIColor.systemGray6
    }
    
    private func resizeImage(image: UIImage, targetSize: CGSize) -> UIImage? {
        let size = image.size
        let widthRatio = targetSize.width / size.width
        let heightRatio = targetSize.height / size.height
        // Figure out what our orientation is, and use that to form the rectangle
        var newSize: CGSize
        if(widthRatio > heightRatio) {
          newSize = CGSize(width: targetSize.width, height: targetSize.height)
        } else {
          newSize = CGSize(width: targetSize.width, height: targetSize.height)
        }
        // This is the rect that we've calculated out and this is what is actually used below
        let rect = CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height)
        // Actually do the resizing to the rect using the ImageContext stuff
        UIGraphicsBeginImageContextWithOptions(newSize, false, 1.0)
        image.draw(in: rect)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage
    }

}

extension ProfileViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }
    
    
}

extension ProfileViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

    // quantidade de celulas
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (section == 0 ? declarations.count : skills.count)
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: PickerTableViewCell.cellIdentifier, for: indexPath) as! PickerTableViewCell
        
        cell.setCell(myLabel: declarations[indexPath.row], myPicker: parameters[indexPath.row])
        
//        if indexPath.section == 1 {
//            let cell = tableView.dequeueReusableCell(withIdentifier: "profileCell", for: indexPath)
//        }
        
        //Top Left Right Corners
        let maskPathTop = UIBezierPath(roundedRect: cell.bounds, byRoundingCorners: [.topLeft, .topRight], cornerRadii: CGSize(width: 5.0, height: 5.0))
        let shapeLayerTop = CAShapeLayer()
        shapeLayerTop.frame = cell.bounds
        shapeLayerTop.path = maskPathTop.cgPath
        
        //Bottom Left Right Corners
        let maskPathBottom = UIBezierPath(roundedRect: cell.bounds, byRoundingCorners: [.bottomLeft, .bottomRight], cornerRadii: CGSize(width: 5.0, height: 5.0))
        let shapeLayerBottom = CAShapeLayer()
        shapeLayerBottom.frame = cell.bounds
        shapeLayerBottom.path = maskPathBottom.cgPath
        
        //All Corners
        let maskPathAll = UIBezierPath(roundedRect: cell.bounds, byRoundingCorners: [.topLeft, .topRight, .bottomRight, .bottomLeft], cornerRadii: CGSize(width: 5.0, height: 5.0))
        let shapeLayerAll = CAShapeLayer()
        shapeLayerAll.frame = cell.bounds
        shapeLayerAll.path = maskPathAll.cgPath
        
        if (indexPath.row == 0 && indexPath.row == tableView.numberOfRows(inSection: indexPath.section)-1)
        {
            cell.layer.mask = shapeLayerAll
        }
        else if (indexPath.row == 0)
        {
            cell.layer.mask = shapeLayerTop
        }
        else if (indexPath.row == tableView.numberOfRows(inSection: indexPath.section)-1)
        {
            cell.layer.mask = shapeLayerBottom
        }

        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return (section == 0 ? "SELF-DECLARATION" : "SKILLS")
    }
}
