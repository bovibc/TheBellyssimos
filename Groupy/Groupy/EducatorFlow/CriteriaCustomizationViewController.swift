//
//  CriteriaCustomizationViewController.swift
//  Groupy
//
//  Created by Luan Fazolin on 30/06/23.
//

import UIKit

class CriteriaCustomizationViewController: UIViewController {
    
    @IBOutlet weak var helpButton: UIButton!
    @IBOutlet weak var createButton: UIButton!
    
    private let matchPersonality: [String] = ["MBTI", "Working styles"]
    private let parameters: [String] = ["Different skill set", "Same motivation", "New colleagues"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Group criteiria"
        
        navigationItem.largeTitleDisplayMode = .always
        
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .systemBackground
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = navigationController?.navigationBar.standardAppearance

        view.backgroundColor = UIColor.systemGray6
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
