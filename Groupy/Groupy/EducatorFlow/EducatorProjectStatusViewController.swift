//
//  EducatorProjectStatusViewController.swift
//  Groupy
//
//  Created by Luan Fazolin on 30/06/23.
//

import UIKit

class EducatorProjectStatusViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var classDescription: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

//        let mocked = MockData()
//
//        let mockedProject: Project = mocked.mockedProject
//
//        for mockedGroup in mockedProject
//        {
//            var mockedGroup: [Group]? = mockedGroup.group?.allObjects as? [Group]
//
//            for mockedStudent in mockedGroup!
//            {
//                print(mockedStudent.name!)
//            }
//        }
//
        
        let nib = UINib(nibName: "StutentCellTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: StutentCellTableViewCell.cellIdentifier)
        
        tableView.delegate = self
        tableView.dataSource = self
        
        
    }
    
}

extension EducatorProjectStatusViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }
    
    // tamanho celula
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140
    }
    
}

extension EducatorProjectStatusViewController: UITableViewDataSource {

    // quantidade de celulas
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let tamanhoGrupo = 3
        return tamanhoGrupo
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: StutentCellTableViewCell.cellIdentifier, for: indexPath)
        
        return cell
        
    }
}
