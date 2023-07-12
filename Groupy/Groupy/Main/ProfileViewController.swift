//
//  ProfileViewController.swift
//  Groupy
//
//  Created by Luan Fazolin on 30/06/23.
//

import UIKit
import AVFoundation

class ProfileViewController: UIViewController, UITabBarControllerDelegate {

    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    @IBOutlet weak var profileName: UILabel!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var profilePicture: UIImageView!
    @IBOutlet weak var logOutButton: UIButton!
    @IBOutlet weak var deleteButton: UIButton!
    
    var educators: [Educator]? = []
    private let textTable: [String] = ["Change password", "Change e-mail"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchEducators()
        configureNavigationBar()
        tableView.delegate = self
        tableView.dataSource = self
        
        // Talvez tirar
        tableView.allowsSelection = false
        
        configureImage()
        if educators?.count == 0 {
            let loginStoryboard = UIStoryboard(name: "LoginFlow", bundle: nil)
            let loginViewController = loginStoryboard.instantiateViewController(withIdentifier: "LoginViewController")
            self.present(loginViewController, animated: true, completion: {
                if let tabBarController = self.tabBarController {
                    // Get a reference to the desired view controller you want to redirect to
                    let viewControllerToRedirect = tabBarController.viewControllers?[0]
                    // Set the desired view controller as the selected view controller
                    tabBarController.selectedViewController = viewControllerToRedirect
                }
            })
        }
        else {
            let loggedEducator = educators?[0]
            
            profileName.text = loggedEducator?.name
        }

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
        fetchEducators()
        configureNavigationBar()

        if educators?.count == 0 {
            let loginStoryboard = UIStoryboard(name: "LoginFlow", bundle: nil)
            let loginViewController = loginStoryboard.instantiateViewController(withIdentifier: "LoginViewController")
            self.present(loginViewController, animated: true, completion: {
                if let tabBarController = self.tabBarController {
                    // Get a reference to the desired view controller you want to redirect to
                    let viewControllerToRedirect = tabBarController.viewControllers?[0]
                    // Set the desired view controller as the selected view controller
                    tabBarController.selectedViewController = viewControllerToRedirect
                }
            })
        }
        else {
            let loggedEducator = educators?[0]
            
            profileName.text = loggedEducator?.name
        }
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
    
    
    @IBAction func logoutTapped(_ sender: UIButton) {
        let defaultAction = UIAlertAction(title: "OK",
                             style: .default) { (action) in
        }

        // Create and configure the alert controller.
        let alert = UIAlertController(title: "Feature unavailable",
              message: "We're sorry, but this feature in not up for test on this build version.",
              preferredStyle: .alert)
        alert.addAction(defaultAction)
             
        self.present(alert, animated: true) {
           // The alert was presented
        }
    }
    
    
    @IBAction func deleteTapped(_ sender: UIButton) {
        let defaultAction = UIAlertAction(title: "OK",
                             style: .default) { (action) in
        }

        // Create and configure the alert controller.
        let alert = UIAlertController(title: "Feature unavailable",
              message: "We're sorry, but this feature in not up for test on this build version.",
              preferredStyle: .alert)
        alert.addAction(defaultAction)
             
        self.present(alert, animated: true) {
           // The alert was presented
        }
    }
    
    func fetchEducators() {
        do {
            // importante: declarar self.items se tudo isso estiver dentro de uma classe
            educators = try context.fetch(Educator.fetchRequest())
            
            // caso tenha uma table view, eh so descomentar as linhas abaixo para
            // renderiza-la novamente apos fazer o fetch de Users
            // DispatchQueue.main.async {
            //   self.tableView.reloadData()
            // }
        }
        catch {
            
        }
    }

}

extension ProfileViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 44
    }
    
}

extension ProfileViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 32
    }
    
    // quantidade de celulas
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return textTable.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "profileCell", for: indexPath) as! ProfileTableViewCell
        cell.labelDescription.text = textTable[indexPath.row]
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
            return "SETTINGS"
        }
    
}
