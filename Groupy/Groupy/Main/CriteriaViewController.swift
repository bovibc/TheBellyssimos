//
//  CriteriaViewController.swift
//  Groupy
//
//  Created by Clissia Bozzer Bovi on 26/06/23.
//

import UIKit

class CriteriaViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    var criterias: [Criteria]? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigationBar()
        
        let nib = UINib(nibName: "CriteriaCollectionViewCell", bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: CriteriaCollectionViewCell.cellIdentifier)
        
        collectionView.delegate = self
        collectionView.dataSource = self
        setCriteriaData()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        configureNavigationBar()
    }
    
    private func configureNavigationBar() {
        self.navigationController?.navigationBar.topItem?.title = "Criteria"
        self.navigationController?.navigationBar.topItem?.rightBarButtonItem = nil
    }
    
    private func setCriteriaData() {
        criterias = MockData().criterias
    }
}

extension CriteriaViewController: UICollectionViewDelegate {
    
    private func collectionView(_ tableView: UICollectionViewCell, didSelectRowAt indexPath: IndexPath) {
    }

}

extension CriteriaViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return criterias?.count ?? 0
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CriteriaCollectionViewCell.cellIdentifier, for: indexPath) as! CriteriaCollectionViewCell
                
        if let criteria = criterias?[indexPath.item] {
            cell.setCellData(criteria)
        }

        return cell
    }

}
