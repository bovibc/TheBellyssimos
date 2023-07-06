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
        self.navigationController?.navigationBar.topItem?.title = "Criteria"
        
        let nib = UINib(nibName: "CriteriaCollectionViewCell", bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: CriteriaCollectionViewCell.cellIdentifier)
        
        collectionView.delegate = self
        collectionView.dataSource = self
        setCriteriaData()
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
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        guard let customCell = cell as? CriteriaCollectionViewCell else { return }
        
        customCell.frame = CGRect(x: 0, y: 0, width: 165, height: 102)
    }

    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CriteriaCollectionViewCell.cellIdentifier, for: indexPath) as! CriteriaCollectionViewCell
                
        if let criteria = criterias?[indexPath.item] {
            cell.setCellData(criteria)
        }
        //var size = CGSize(width: self.view.frame.width/10, height: self.view.frame.width/10)
        
       // cell.sizeToFit()
        
        return cell
    }

}
