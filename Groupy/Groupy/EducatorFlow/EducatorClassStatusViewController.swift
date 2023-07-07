//
//  EducatorClassStatusViewController.swift
//  Groupy
//
//  Created by Luan Fazolin on 30/06/23.
//

import UIKit

class EducatorClassStatusViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!
    var chosenClass: Class?
    var projects: [Project]?
    var students: [Student]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.register(UINib(nibName: "StutentCellTableViewCell", bundle: nil), forCellReuseIdentifier: StudentCellTableViewCell.cellIdentifier)
        configureTableView()
        configureData()
        configureNavigationBar()
    }
    
    private func configureTableView() {
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
    
    private func configureData() {
        guard let chosenClass = chosenClass else { return }
        projects = chosenClass.projects?.allObjects as? [Project]
        students = chosenClass.students?.allObjects as? [Student]
    }

    private func configureNavigationBar() {
        self.title = chosenClass?.name ?? "My Classes"
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .systemBackground
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = navigationController?.navigationBar.standardAppearance
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(
            title: nil,
            image: UIImage(systemName: "ellipsis.circle"),
            target: self,
            action: nil,
            menu: createMenu())
    }
    
    private func getProjectCell(_ index: Int) -> UITableViewCell {
        guard let project = projects?[index].name else { return UITableViewCell() }
        let cell = UITableViewCell()
        cell.textLabel?.text = "\(index). \(project)"
        return cell
    }
    
    private func getStudentCell(_ indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: StudentCellTableViewCell.cellIdentifier, for: indexPath) as! StudentCellTableViewCell
        cell.setCell(myStudent: students?[indexPath.row])
        return cell
    }
    
    private func getProject(name: String?) -> Project? {
        guard let projects = projects else { return nil }
        for project in projects {
            if project.name?.contains(name ?? "") ?? false {
                return project
            }
        }
        return nil
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let projects = projects, let students = students else { return 0 }
        return (section == 0 ? projects.count : students.count)
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return (section == 0 ? "PROJECTS" : "STUDENTS")
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0 {
            let storyboard = UIStoryboard(name: "EducatorFlow", bundle: nil)
            let viewController = storyboard.instantiateViewController(withIdentifier: "EducatorProjectStatusViewController") as? EducatorProjectStatusViewController
            if let viewController = viewController {
                viewController.viewProject = getProject(name: projects?[indexPath.row].name)
                navigationController?.show(viewController, sender: nil)
            }
            
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            return getProjectCell(indexPath.row)
        } else {
            return getStudentCell(indexPath)
        }
    }
    
    func createMenu() -> UIMenu {
        let educatorStoryboard = UIStoryboard(name: "EducatorFlow", bundle: nil)
        var menuItems: [UIAction] {
            return [
                UIAction(title: "New Project", handler: { _ in
                    let joinClassView = educatorStoryboard.instantiateViewController(withIdentifier: "CreateProjectViewController" )
                    self.navigationController?.present(joinClassView, animated: true)
                }),
                UIAction(title: "Share Code", handler: { _ in
                }),
            ]
        }
        return UIMenu(title: "", image: nil, identifier: nil, options: [], children: menuItems)
    }
}
