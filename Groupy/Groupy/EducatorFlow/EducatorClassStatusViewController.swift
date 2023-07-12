//
//  EducatorClassStatusViewController.swift
//  Groupy
//
//  Created by Luan Fazolin on 30/06/23.
//

import UIKit
import CoreData

class EducatorClassStatusViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    // core data context
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    // variavel que vai receber um array de Users e ser usada no componente
    var fetchedClasses:[Class]?

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var descriptionLabel: UILabel!
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
    
    override func viewWillAppear(_ animated: Bool) {
        fetchClass()
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
        descriptionLabel.text = chosenClass.info
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
        guard let projects = projects else { return UITableViewCell() }
        let cell = UITableViewCell()
        if projects.count == 0 {
            cell.textLabel?.text = "No projects"
        } else {
            guard let project = projects[index].name else { return UITableViewCell() }
            cell.textLabel?.text = "\(index+1). \(project)"
        }
        
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
        if section == 0 {
            return (projects.count == 0 ? 1 : projects.count)
        } else {
            return students.count
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return (section == 0 ? "PROJECTS" : "STUDENTS")
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if projects?.count != 0  {
            if indexPath.section == 0 {
                let storyboard = UIStoryboard(name: "EducatorFlow", bundle: nil)
                let viewController = storyboard.instantiateViewController(withIdentifier: "EducatorProjectStatusViewController") as? EducatorProjectStatusViewController
                if let viewController = viewController {
                    viewController.viewProject = getProject(name: projects?[indexPath.row].name)
                    navigationController?.show(viewController, sender: nil)
                }
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
    
    func loadShareCodeView() {
        
        
        let educatorStoryboard = UIStoryboard(name: "EducatorFlow", bundle: nil)
        let shareCodeView = educatorStoryboard.instantiateViewController(withIdentifier: "ShareCodeViewController")
        //self.navigationController?.present(createClassView, animated: true)
        if let sheet = shareCodeView.sheetPresentationController {
            sheet.detents = [.medium()]
        }
        self.present(shareCodeView, animated: true, completion: nil)
    }
    
    private func fetchClass() {
        do {
            let request = Class.fetchRequest() as NSFetchRequest<Class>
            
            // define o(s) filtro(s) para a request
            let pred = NSPredicate(format: "name CONTAINS '\(chosenClass?.name ?? "class")'")
            request.predicate = pred
            
            // faz a request e adiciona no items apenas o User filtrado
            let classArray = try context.fetch(request)
            
            chosenClass = classArray[0]

            projects = chosenClass?.projects?.allObjects as? [Project]
            students = chosenClass?.students?.allObjects as? [Student]
            
            DispatchQueue.main.async {
               self.tableView.reloadData()
            }
        }
        catch {
            
        }
    }

    func createMenu() -> UIMenu {
        let educatorStoryboard = UIStoryboard(name: "EducatorFlow", bundle: nil)
        var menuItems: [UIAction] {
            return [
                UIAction(title: "New Project", handler: { _ in
                    let createProject = educatorStoryboard.instantiateViewController(withIdentifier: "CreateProjectViewController" ) as? CreateProjectViewController
                    if let createProject = createProject {
                        createProject.chosenClass = self.chosenClass
                        self.navigationController?.show(createProject, sender: nil)
                    }
                }),
                UIAction(title: "Share Code", handler: { _ in
                    self.loadShareCodeView()
                }),
            ]
        }
        return UIMenu(title: "", image: nil, identifier: nil, options: [], children: menuItems)
    }
    
}
