//
//  MockData.swift
//  Groupy
//
//  Created by Luan Fazolin on 04/07/23.
//

import Foundation
import UIKit
import CoreData

class MockData {

    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    var mockedClasses: [Class] = []
    
    var mockedStudents: [Student] = []

    init() {
        // set mocked students
        self.mockedStudents = mockStudents()
        
        // set mocked classes
        //self.mockedClasses = mockClasses()
    }

    var nomes = ["Ana", "Beatriz", "Isabela", "Carol", "Mariana", "Oceana", "Paulo", "Rodrigo", "Thiago", "Matheus", "Ronaldo", "Lucio", "Alberto", "Mariano", "José", "Romariana", "Cefaleia", "Jemiana", "Jamanto"]
    
    var sobrenomes = ["Pereira", "Sobreira", "da Silve", "da Pentagônia", "dos Santos", "Aparecida", "Swift", "Lautner", "Romanoff", "Karenina", "Targaryen", "Bond", "Helioscaustos", "Rocha"]
    
    var ethnicities = ["hispanic", "chinese", "pakistani", "indian"]

    var gender = ["female", "non-binary"]

    var skinTone = ["black", "yellow"]

    var mbtiPersonality = ["ISFJ", "ISFP", "ISTJ", "ISTP", "ESFJ", "ESFP", "ESTJ", "ESTP", "INFJ", "INFP", "INTJ", "INTP", "ENFJ", "ENFP", "ENTJ", "ENTP"]

    var wsPersonality = ["driver", "analytical", "amiable", "expressive"]

    func mockClasses() -> [Class] {

        var mockedClasses: [Class] = []

        // mocka 5 classes
        for classe in 0...4 {

            // mock class
            let newClass = Class(context: self.context)

            // cria novos alunos e adiciona no mockedStudents
            for _ in 0...40 {
                let newStudent = Student(context: self.context)
                
                newStudent.name = nomes[Int.random(in: 0...18)] + " " + sobrenomes[Int.random(in: 0...13)]
                newStudent.firstTime = false
                newStudent.id = Int64(Int.random(in: 1000...9999))
                newStudent.loggedIn = false
                
                if Bool.random()
                {
                    if Bool.random()
                    {
                        newStudent.ethnicity = ethnicities[Int.random(in: 0...3)]
                    }
                    
                    if Bool.random()
                    {
                        newStudent.gender = gender[Int.random(in: 0...1)]
                    }
                    
                    if Bool.random()
                    {
                        newStudent.skinTone = skinTone[Int.random(in: 0...1)]
                    }
                    
                    if Bool.random()
                    {
                        newStudent.mbtiPersonality = mbtiPersonality[Int.random(in: 0...15)]
                    }
                    
                    if Bool.random()
                    {
                        newStudent.wsPersonality = wsPersonality[Int.random(in: 0...3)]
                    }
                }
                
                newClass.addToStudents(newStudent)
            }
            
            let projectNames = ["Hignoso", "Bird Belly", "Hike it!", "Fast and Furious"]
            
            for projectIndex in 0...3 {
                let newProject = Project(context: self.context)

                var studentIndex = 0
                
                let students: [Student]? = newClass.students?.allObjects as? [Student]
                
                let groupNames = ["Grupo Incrível", "Somos nós", "A esperança", "Fosso e fossa", "Renascer", "Just do it!", "Cafézin?", "Desperados", "Mergeia e sofre", "IFCH hoje?"]

                for groupIndex in 0...9 {
                    
                    let newGroup = Group(context: self.context)
                    
                    for _ in 0...3
                    {

                        let student: Student = students![studentIndex]
                        newGroup.addToMembers(student)
                        studentIndex += 1
                    }
                    
                    newGroup.name = groupNames[groupIndex]
                    
                    newProject.addToGroups(newGroup)
                }

                newProject.name = projectNames[projectIndex]
                newProject.info = "This project is called \(projectNames[projectIndex].uppercased())!!!"
                                
                newClass.addToProjects(newProject)
            }
            
            let className = ["Apple Academy", "F128", "Extecamp", "Design", "FAU"]
            
            newClass.id = Int64(Int.random(in: 100...999))
            newClass.name = className[classe]
            newClass.studentCode = Int64(Int.random(in: 1000...9999))
            
            mockedClasses.append(newClass)
            
        }
        
        return mockedClasses
    }
    
    func mockStudents() -> [Student] {
        
        var mockedStudents: [Student] = []
        
        // cria novos alunos e adiciona no mockedStudents
        for _ in 0...40 {
            let newStudent = Student(context: self.context)
            
            newStudent.name = nomes[Int.random(in: 0...18)] + " " + sobrenomes[Int.random(in: 0...13)]
            newStudent.firstTime = false
            newStudent.id = Int64(Int.random(in: 1000...9999))
            newStudent.loggedIn = false
            
            if Bool.random()
            {
                if Bool.random()
                {
                    newStudent.ethnicity = ethnicities[Int.random(in: 0...3)]
                }
                
                if Bool.random()
                {
                    newStudent.gender = gender[Int.random(in: 0...1)]
                }
                
                if Bool.random()
                {
                    newStudent.skinTone = skinTone[Int.random(in: 0...1)]
                }
                
                if Bool.random()
                {
                    newStudent.mbtiPersonality = mbtiPersonality[Int.random(in: 0...15)]
                }
                
                if Bool.random()
                {
                    newStudent.wsPersonality = wsPersonality[Int.random(in: 0...3)]
                }
            }
            
            mockedStudents.append(newStudent)
        }
        
        return mockedStudents
    }
    
    let criterias = [
        Criteria(icon: "person.3",
                 color: UIColor(red: 255/255, green: 159/255, blue: 10/255, alpha: 1.0),
                 name: "Diversity",
                 title: "title1",
                 description: "description1"),
        
        Criteria(icon: "gear",
                 color: UIColor(red: 255/255, green: 69/255, blue: 58/255, alpha: 1.0),
                 name: "Skill",
                 title: "title2",
                 description: "description2"),
        
        Criteria(icon: "person.crop.square",
                 color: UIColor(red: 50/255, green: 173/255, blue: 230/255, alpha: 1.0),
                 name: "Personality",
                 title: "title3",
                 description: "description3"),
        
        Criteria(icon: "person.line.dotted.person",
                 color: UIColor(red: 172/255, green: 82/255, blue: 222/255, alpha: 1.0),
                 name: "Previous interactions",
                 title: "title4",
                 description: "description4"),
        
        Criteria(icon: "target",
                 color: UIColor(red: 48/255, green: 209/255, blue: 88/255, alpha: 1.0),
                 name: "Motivation",
                 title: "title5",
                 description: "description5")
    ]

}

struct Criteria {
    let icon: String
    let color: UIColor
    let name: String
    let title: String
    let description: String
}
