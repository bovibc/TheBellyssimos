//
//  ColleaguesAltorithm.swift
//  Groupy
//
//  Created by Gabriel Leite on 12/07/23.
//

import Foundation
import UIKit
import CoreData

func newColleaguesGroupFormation (myClass : Class, groupSize: Int) -> [Group]? {
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    var students: [Student]? = myClass.students?.allObjects as? [Student]
    var groupList : [Group]? = []
    var counter: Int = 1
    
    while let currentStudent = students?.min(by: {$0.workedWith!.count < $1.workedWith!.count}) {
        var newGroup: Group = Group(context: context)
        newGroup.addToMembers(currentStudent)
        students?.removeAll(where: {$0 == currentStudent})
        
        var stack: [Student] = [currentStudent]
        
        while let student = stack.popLast() {
            for neighbor in student.workedWith! {
                if ((students?.contains(where: {$0 == neighbor as! Student})) != nil) {
                    newGroup.addToMembers(neighbor as! Student)
                    students?.removeAll(where: {$0 == neighbor as! Student})
                    stack.append(neighbor as! Student)
                }
            }
        }
        
        newGroup.name = "Grupo \(counter)"
        counter += 1
        groupList?.append(newGroup)
        
    }

    return groupList
}
