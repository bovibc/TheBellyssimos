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
    
    var mockedProject: Project? = nil
    var mockedGroups: [Group]? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.setMockedProject()
        let nib = UINib(nibName: "StutentCellTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: StudentCellTableViewCell.cellIdentifier)
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
    
    private func setMockedProject() {
        let classData: Class = MockData().mockedClasses[0]
        
        let mockedProjects: [Project]? = classData.projects?.allObjects as? [Project]
        
        mockedProject = mockedProjects?[0]
        
        mockedGroups = mockedProject?.groups?.allObjects as? [Group]

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
        return mockedGroups?.count ?? 0
    }

    // quantidade de celulas
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mockedGroups?[section].members?.count ?? 0
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: StudentCellTableViewCell.cellIdentifier, for: indexPath) as! StudentCellTableViewCell
        
        let grupo = mockedGroups?[indexPath.section]
        let estudantes = grupo?.members?.allObjects as? [Student]
        let estudante = estudantes?[indexPath.row]
        
        print(2)
        print(estudante?.name ?? "a")
        
        cell.setCell(myStudent: estudante!)
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return mockedGroups?[section].name
    }
}
