//
//  CriteriaDetailsViewController.swift
//  Groupy
//
//  Created by Luan Fazolin on 30/06/23.
//

import UIKit


class CriteriaDetailsViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var detailsLabel: UILabel!
    
    var criteriaType: CriteriaType = .Diversity
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = false
        let criteriaData = CriteriaData(criteriaType: criteriaType).getCriteriaData()
        self.titleLabel.text = criteriaData.title
        self.imageView.image = criteriaData.image
        self.detailsLabel.text = criteriaData.text
    }

    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.navigationBar.prefersLargeTitles = true
    }
}
