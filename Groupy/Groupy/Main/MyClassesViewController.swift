//
//  ViewController.swift
//  Groupy
//
//  Created by Clissia Bozzer Bovi on 26/06/23.
//

import UIKit
import CoreData

class MyClassesViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    // core data context
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    // variavel que vai receber um array de Users e ser usada no componente
    var fetchedClasses:[Class]?
    var educators:[Educator]?
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var collectionView: UICollectionView!
    var completeData: [Class] = []
    var filteredData: [Class] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchEducators()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.fetchClasses()
        fetchEducators()
        self.setupKeyboard()
        self.setColors()
        self.configureNavigationBar()
        self.setClasses()
        self.setCollectionView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.configureNavigationBar()
        fetchEducators()
    }
    
    private func setColors() {
        self.view.backgroundColor = .systemGray6
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .systemBackground
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = navigationController?.navigationBar.standardAppearance
    }
    
    private func fetchClasses() {
        do {
            self.fetchedClasses = try context.fetch(Class.fetchRequest())
            // caso tenha uma table view, eh so descomentar as linhas abaixo para
            // renderiza-la novamente apos fazer o fetch de Users
            DispatchQueue.main.async {
               self.collectionView.reloadData()
            }
        }
        catch {
            
        }
    }
    
    private func setClasses() {
        //let mocked = MockData()
        //completeData = mocked.mockedClasses
        //filteredData = completeData
        if let classes = fetchedClasses {
            completeData = classes
        }
        else {
            completeData = []
        }
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

    private func getClassByName(name: String?) -> Class? {
        for classes in filteredData {
            if classes.name == name {
                return classes
            }
        }
        return nil
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
            viewController.chosenClass = getClassByName(name: cell.name)
            navigationController?.show(viewController, sender: nil)
        }
    }
    
    func createMenu() -> UIMenu {
        let educatorStoryboard = UIStoryboard(name: "EducatorFlow", bundle: nil)
        var menuItems: [UIAction] {
            return [
                UIAction(title: "Join class", handler: { _ in
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
                }),
                UIAction(title: "Create class", handler: { _ in
                    //let createClassView = educatorStoryboard.instantiateViewController(withIdentifier: "CreateClass")
                    //self.navigationController?.present(createClassView, animated: true)
                    self.fetchEducators()
                    if self.educators?.count == 0 {
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
                        self.loadCreateClass()
                    }
                }),
            ]
        }
        return UIMenu(title: "", image: nil, identifier: nil, options: [], children: menuItems)
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

    
    func loadCreateClass()
    {
        let educatorStoryboard = UIStoryboard(name: "EducatorFlow", bundle: nil)
        let createClassView = educatorStoryboard.instantiateViewController(withIdentifier: "CreateClass")
        //self.navigationController?.present(createClassView, animated: true)
        let newVC = createClassView
        
        newVC.transitioningDelegate = self
        
        present(newVC, animated: true, completion: nil)
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
    
    func setupKeyboard() {
        let toolbar = UIToolbar()
        let space =  UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let doneButton = UIBarButtonItem(title: "Done", style: .done,
                                         target: self, action: #selector(hideKeyboardAction))
        toolbar.setItems([space,doneButton], animated: true)
        toolbar.sizeToFit()
        
        searchBar.delegate = self
        searchBar.inputAccessoryView = toolbar
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        hideKeyboardAction()
    }
    
    @objc func hideKeyboardAction() {
        view.endEditing(true)
    }
}

extension MyClassesViewController: UIViewControllerTransitioningDelegate
{
    // UIViewControllerTransitioningDelegate delegate function auto invoked during modal transitions
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning?
    {
        fetchClasses()
        setClasses()
        collectionView.reloadData()
        
        /// Returning nil as per guidelines
        return nil
    }
}

