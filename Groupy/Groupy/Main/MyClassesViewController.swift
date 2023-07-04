//
//  ViewController.swift
//  Groupy
//
//  Created by Clissia Bozzer Bovi on 26/06/23.
//

import UIKit

class MyClassesViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setCollectionView()
        self.configureNavigationBar()
    }

    private func configureNavigationBar() {
        self.navigationController?.navigationBar.topItem?.title = "My Classes"
        self.navigationController?.navigationBar.topItem?.rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .add,
            target: self,
            action: nil
        )
    }
    
    private func setCollectionView() {
        collectionView.dataSource = self
        collectionView.delegate = self
        self.collectionView.register(UINib(nibName: "MyClassesCollectionViewCell", bundle: Bundle.main), forCellWithReuseIdentifier: "myClassesCollectionViewCell")
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "myClassesCollectionViewCell", for: indexPath as IndexPath) as! MyClassesCollectionViewCell
        cell.layer.borderColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.3).cgColor
        cell.layer.cornerRadius = 15
        cell.layer.borderWidth = 1
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
}

