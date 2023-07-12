//
//  CriteriaCustomizationViewController.swift
//  Groupy
//
//  Created by Luan Fazolin on 30/06/23.
//

import UIKit

class CriteriaCustomizationViewController: UIViewController {
    
    @IBOutlet weak var helpButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var createButton: UIButton!
    
    private let parameters: [String] = ["MBTI", "Working styles","Different skill set", "Same motivation", "New colleagues"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configNavBar()
        
        let nib = UINib(nibName: "CustomizationTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: CustomizationTableViewCell.cellIdentifier)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.allowsSelection = false
        
    }
    
    
    @IBAction func customizeTapped(_ sender: UIButton) {
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
    

    private func configNavBar() {
        self.title = "Group criteria"
        
        navigationItem.largeTitleDisplayMode = .always
        
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .systemBackground
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = navigationController?.navigationBar.standardAppearance

        view.backgroundColor = UIColor.systemGray6
    }
}

extension CriteriaCustomizationViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 44
    }
    
}

extension CriteriaCustomizationViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CustomizationTableViewCell.cellIdentifier, for: indexPath) as! CustomizationTableViewCell
        
        cell.setCell(myLabel: parameters[indexPath.row])
                
        return cell
    }
    
}
