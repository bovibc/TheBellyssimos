//
//  CreateClassViewController.swift
//  Groupy
//
//  Created by Luan Fazolin on 30/06/23.
//

import UIKit

class CreateClassViewController: UIViewController, UITextFieldDelegate {

    // set core data context
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    var fetchedClasses: [Class]?

    @IBOutlet weak var descriptionField: UITextView!
    @IBOutlet weak var className: UITextField!
    
    
    @IBAction func closeModal(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func createClass(_ sender: UIButton) {
        let name = className.text
        let description = descriptionField.text
        
        if name == "" {
            let placeholderText = "Missing class name"
            let placeholderColor = UIColor.red

            let attributedPlaceholder = NSAttributedString(
                string: placeholderText,
                attributes: [NSAttributedString.Key.foregroundColor: placeholderColor]
            )
            
            className.attributedPlaceholder = attributedPlaceholder
        }

        // space to add endpoint to create a class
        if name != "" && description != ""
        {
            addClass(name ?? "default", description ?? "default")
            loadShareCodeView()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupKeyboard()
        self.view.backgroundColor = UIColor.systemGray6
        self.title = "Create Class"
        className.delegate = self
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
    
    func addClass(_ className: String,_ classDescription: String) {
        
        // instancia o objeto a ser adicionado no Core Data
        let newClass = Class(context: self.context)
        
        // mocka alunos
        let mocked = MockData()
        let mockedStudents: [Student] = mocked.mockedStudents

        // define os atributos da classe a ser criada
        newClass.name = className
        newClass.info = classDescription
        newClass.educatorCode = Int64(Int.random(in: 10000...99999))
        newClass.id = Int64(Int.random(in: 10000...99999))
        newClass.studentCode = Int64(Int.random(in: 10000...99999))
        
        for student in mockedStudents {
            newClass.addToStudents(student)
        }
        
        // salva o objeto no Core Data
        do {
            try self.context.save()
        }
        catch {
            
        }
        
        // faz um refetch dos dados sendo exibidos para atualizar
        self.fetchClasses()
    }
    
    private func fetchClasses() {
        do {
            self.fetchedClasses = try context.fetch(Class.fetchRequest())
            // caso tenha uma table view, eh so descomentar as linhas abaixo para
            // renderiza-la novamente apos fazer o fetch de Users
            // DispatchQueue.main.async {
            //   self.tableView.reloadData()
            // }
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
        
        className.inputAccessoryView = toolbar
        descriptionField.inputAccessoryView = toolbar
    }
    
    @objc func hideKeyboardAction() {
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        hideKeyboardAction()
        return false
    }
}
