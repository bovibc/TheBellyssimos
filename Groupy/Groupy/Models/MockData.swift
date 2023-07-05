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

    init() {
        // set mocked classes
        self.mockedClasses = mockClasses()
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
            
            let className = ["Apple Academy", "F128", "Extecamp", "Design", "FAU"]
            
            newClass.id = Int64(Int.random(in: 100...999))
            newClass.name = className[classe]
            newClass.studentCode = Int64(Int.random(in: 1000...9999))
            
            mockedClasses.append(newClass)
            
        }
        
        return mockedClasses
    }
}
