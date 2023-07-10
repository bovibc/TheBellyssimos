//
//  CreateProjectViewController.swift
//  Groupy
//
//  Created by Luan Fazolin on 30/06/23.
//

import UIKit

class CreateProjectViewController: UIViewController {

    // core data context
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    // variavel que vai receber um array de Users e ser usada no componente
    var fetchedClasses:[Class]?

    var chosenClass: Class?
    
    @IBOutlet weak var projectName: UITextField!
    @IBOutlet weak var projectDescription: UITextView!
    @IBOutlet weak var projectStartDate: UIDatePicker!
    @IBOutlet weak var projectEndDate: UIDatePicker!
    
    private func configureData() {
        guard let chosenClass = chosenClass else { return }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.fetchClasses()
        configureData()
        navigationController?.navigationBar.prefersLargeTitles = false
        self.title = "Create project"

        self.view.backgroundColor = UIColor.systemGray6
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func criteriaPressed(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "EducatorFlow", bundle: nil)
        let criteriaCustomization = storyboard.instantiateViewController(withIdentifier: "CriteriaCustomizationViewController" )
        self.navigationController?.show(criteriaCustomization, sender: true)
    }

    @IBAction func randomlyPressed(_ sender: UIButton) {
        // Create the action buttons for the alert.
        let defaultAction = UIAlertAction(title: "Form groups",
                             style: .default) { (action) in
            self.addProjectToClass("random")
            self.navigationController?.popViewController(animated: true)
        }
        let cancelAction = UIAlertAction(title: "Cancel",
                             style: .cancel) { (action) in
         // Respond to user selection of the action.
        }

        // Create and configure the alert controller.
        let alert = UIAlertController(title: "Form groups randomly",
              message: "You are about to form groups randomly for this project, without a specific criterion selected.",
              preferredStyle: .alert)
        alert.addAction(defaultAction)
        alert.addAction(cancelAction)
             
        self.present(alert, animated: true) {
           // The alert was presented
        }
    }
    
    func addProjectToClass(_ criteria: String) {
        
        // instancia o objeto a ser adicionado no Core Data
        let newProject = Project(context: self.context)
        
        // define a referencia para qual classe editar
        var classIndex = 0
        
        // busca classe
        for eachClass in fetchedClasses! {
            if eachClass.name == chosenClass?.name {
                break
            }
            else {
                classIndex += 1
            }
        }
        
        // define referencia para qual classe editar
        let classToEdit = self.fetchedClasses![classIndex]
        
        // resgata o que foi inserido nos campos
        let newProjectName = projectName.text
        let newProjectInfo = projectDescription.text
        //let newProjectStartDateFormatter = DateFormatter()
        //let newProjectEndDateFormatter = DateFormatter()
        //newProjectStartDateFormatter.dateFormat = "dd/MM/YY"
        //newProjectEndDateFormatter.dateFormat = "dd/MM/YY"
        //let newProjectStartDate = newProjectStartDateFormatter.string(from: projectStartDate.date)
        //let newProjectEndDate = newProjectEndDateFormatter.string(from: projectEndDate.date)
        let newProjectStartDate = projectStartDate.date
        let newProjectEndDate = projectEndDate.date
        
        // define os outros campos faltantes
        let newProjectId = Int64(Int.random(in: 10000...99999))

        // atribui campos
        newProject.id = newProjectId
        newProject.name = newProjectName
        newProject.info = newProjectInfo
        newProject.startDate = newProjectStartDate
        newProject.dueDate = newProjectEndDate

        var formedGroups: [Group]?

        if criteria == "random" {
            formedGroups = randomGroupFormation(myClass: classToEdit, groupSize: 5)
            
            for eachGroup in formedGroups! {
                newProject.addToGroups(eachGroup)
            }
        }

        // adiciona o projeto na classe
        classToEdit.addToProjects(newProject)
        
        // salva projeto criado e edicao da classe no core data
        do {
            try self.context.save()
        }
        catch {
            
        }
    }
    
    private func fetchClasses() {
        do {
            self.fetchedClasses = try context.fetch(Class.fetchRequest())
        }
        catch {
            
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
