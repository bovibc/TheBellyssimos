//
//  ViewController.swift
//  Groupy
//
//  Created by Clissia Bozzer Bovi on 26/06/23.
//

import UIKit
import CoreData

class MyClassesViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var collectionView: UICollectionView!
    var completeData: [Class] = []
    var filteredData: [Class] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setCollectionView()
        self.configureNavigationBar()
        self.setClasses()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.configureNavigationBar()
    }
    
    private func setClasses() {
        let mocked = MockData()
        completeData = mocked.mockedClasses
        filteredData = completeData
    }

    private func configureNavigationBar() {
        self.navigationController?.navigationBar.topItem?.title = "My Classes"
        self.navigationController?.navigationBar.topItem?.rightBarButtonItem = UIBarButtonItem(
                systemItem: .add,
                primaryAction: nil,
                menu: createMenu()
            )
    }
    
    private func setCollectionView() {
        collectionView.dataSource = self
        collectionView.delegate = self
        self.collectionView.register(UINib(nibName: "MyClassesCollectionViewCell", bundle: Bundle.main), forCellWithReuseIdentifier: "myClassesCollectionViewCell")
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "myClassesCollectionViewCell", for: indexPath as IndexPath) as! MyClassesCollectionViewCell
        cell.setCell(myClass: filteredData[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return filteredData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "EducatorFlow", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "classStatusViewController") as? EducatorClassStatusViewController
        if let viewController = viewController {
            let cell = filteredData[indexPath.row]
            //viewController.chosenClass = getClassByName(name: cell.name)
            navigationController?.show(viewController, sender: nil)
        }
    }
    
    func createMenu() -> UIMenu {
        let educatorStoryboard = UIStoryboard(name: "EducatorFlow", bundle: nil)
        var menuItems: [UIAction] {
            return [
                UIAction(title: "Join class", handler: { _ in
                    let joinClassView = educatorStoryboard.instantiateViewController(withIdentifier: "EducatorJoinClass" )
                    self.navigationController?.present(joinClassView, animated: true)
                }),
                UIAction(title: "Create class", handler: { _ in
                    let createClassView = educatorStoryboard.instantiateViewController(withIdentifier: "CreateClass")
                    self.navigationController?.present(createClassView, animated: true)
                }),
            ]
        }
        return UIMenu(title: "", image: nil, identifier: nil, options: [], children: menuItems)
    }
}

extension MyClassesViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filteredData = []
        if searchText == ""  {
            filteredData = completeData
        }
        
        for classes in completeData {
            if let name = classes.name {
                if name.lowercased().contains(searchText.lowercased()) {
                    filteredData.append(classes)
                }
            }
        }
        
        collectionView.reloadData()
    }
}

