//
//  EducatorProjectStatusViewController.swift
//  Groupy
//
//  Created by Luan Fazolin on 30/06/23.
//

import UIKit

class EducatorProjectStatusViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var projectDescription: UILabel!
    
    var viewProject: Project? = nil
    var viewGroups: [Group]? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.setProject()
        self.title = viewProject?.name
        let nib = UINib(nibName: "StutentCellTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: StudentCellTableViewCell.cellIdentifier)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.allowsSelection = false
        
        navigationController?.navigationBar.barTintColor = UIColor.green
//        view.backgroundColor = UIColor.systemGray6
    }
    
    
    private func setProject() {
        
        let classData: Class = MockData().mockedClasses[0]
        
        let mockedProjects: [Project]? = classData.projects?.allObjects as? [Project]
        
        viewProject = mockedProjects?[0]
        
        projectDescription.text = viewProject?.info
        
        viewGroups = viewProject?.groups?.allObjects as? [Group]

    }
    
}

extension EducatorProjectStatusViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }
    
    // tamanho celula
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 140
//    }
    
}

extension EducatorProjectStatusViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewGroups?.count ?? 0
    }

    // quantidade de celulas
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewGroups?[section].members?.count ?? 0
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: StudentCellTableViewCell.cellIdentifier, for: indexPath) as! StudentCellTableViewCell
        
        let grupo = viewGroups?[indexPath.section]
        var estudantes = grupo?.members?.allObjects as? [Student]
        estudantes = estudantes?.sorted {($0.name?.prefix(1))! < ($1.name?.prefix(1))!}
        let estudante = estudantes?[indexPath.row]
        
        cell.setCell(myStudent: estudante!)
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return viewGroups?[section].name
    }
}
