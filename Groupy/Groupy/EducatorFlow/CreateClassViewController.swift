//
//  CreateClassViewController.swift
//  Groupy
//
//  Created by Luan Fazolin on 30/06/23.
//

import UIKit

class CreateClassViewController: UIViewController {

    // set core data context
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    var fetchedClasses: [Class]?

    @IBOutlet weak var className: UITextField!
    @IBOutlet weak var classDescription: UITextField!
    
    
    @IBAction func closeModal(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func createClass(_ sender: UIButton) {
        let name = className.text
        let description = classDescription.text

        // space to add endpoint to create a class
        if name != "" && description != ""
        {
            addClass(name ?? "default", description ?? "default")
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.systemGray6

        title = "Create Class"

        

        // Do any additional setup after loading the view.
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
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
