//
//  RandomGroupFormation.swift
//  Groupy
//
//  Created by Gabriel Leite on 06/07/23.
//

import Foundation
import UIKit
import CoreData

func randomGroupFormation (myClass : Class, groupSize: Int) -> [Group]? {
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    var students: [Student]? = myClass.students?.allObjects as? [Student]
    students?.shuffle()
    
    var groupList : [Group]? = []
    var bigCounter: Int = 0
    let studentNumber: Int = students?.count ?? -1
    
    while studentNumber != -1 {
        let newGroup: Group = Group(context: context)
        var smallCounter: Int = 0
        while smallCounter < groupSize {
            let student: Student = students![bigCounter]
            newGroup.addToMembers(student)
            smallCounter += 1
            bigCounter += 1
            
            if smallCounter == groupSize {
                newGroup.name = "Grupo \(bigCounter / groupSize )"
                groupList?.append(newGroup)
            }
            
            if bigCounter == studentNumber - 1 {
                newGroup.name = "Grupo \(bigCounter / groupSize + 1)"
                groupList?.append(newGroup)
                return groupList
            }
        }
        
    }
    return groupList
}


