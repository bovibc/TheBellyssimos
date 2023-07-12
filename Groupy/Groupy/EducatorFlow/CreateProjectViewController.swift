//
//  CreateProjectViewController.swift
//  Groupy
//
//  Created by Luan Fazolin on 30/06/23.
//

import UIKit

class CreateProjectViewController: UIViewController, UITextFieldDelegate {

    // core data context
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    // variavel que vai receber um array de Users e ser usada no componente
    var fetchedClasses:[Class]?

    var chosenClass: Class?
    
    @IBOutlet weak var projectName: UITextField!
    @IBOutlet weak var projectDescription: UITextView!
    @IBOutlet weak var projectStartDate: UIDatePicker!
    @IBOutlet weak var projectEndDate: UIDatePicker!
    @IBOutlet weak var groupSize: UILabel!
    @IBOutlet weak var stepperValue: UIStepper!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupKeyboard()
        self.fetchClasses()
        navigationController?.navigationBar.prefersLargeTitles = false
        self.title = "Create project"
        self.projectName.delegate = self
        self.view.backgroundColor = UIColor.systemGray6
        // Do any additional setup after loading the view.
        
        let students = chosenClass?.students?.allObjects as! [Student]
        let studentsCount = students.count

        stepperValue.minimumValue = 2
        stepperValue.maximumValue = floor(Double(studentsCount/2))
        stepperValue.stepValue = 1
        stepperValue.value = 4
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.navigationBar.prefersLargeTitles = true
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
    
    
    @IBAction func stepperTapped(_ sender: UIStepper) {
        groupSize.text = String(format: "%.0f", stepperValue.value)
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
            formedGroups = randomGroupFormation(myClass: classToEdit, groupSize: Int(stepperValue.value))
            
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
    
    @IBAction func deactivateStudentsTapped(_ sender: UIButton) {
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
    }
    
    
    private func fetchClasses() {
        do {
            self.fetchedClasses = try context.fetch(Class.fetchRequest())
        }
        catch {
            
        }
    }
    
    func setupKeyboard() {
        let toolbar = UIToolbar()
        let space =  UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let doneButton = UIBarButtonItem(title: "Done", style: .done,
                                         target: self, action: #selector(hideKeyboardAction))
        toolbar.setItems([space,doneButton], animated: true)
        toolbar.sizeToFit()
        
        projectName.inputAccessoryView = toolbar
        projectDescription.inputAccessoryView = toolbar
    }
    
    @objc func hideKeyboardAction() {
        view.endEditing(true)
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        hideKeyboardAction()
        return false
    }
    
}
