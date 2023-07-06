//
//  Class+CoreDataProperties.swift
//  Groupy
//
//  Created by Luan Fazolin on 05/07/23.
//
//

import Foundation
import CoreData


extension Class {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Class> {
        return NSFetchRequest<Class>(entityName: "Class")
    }

    @NSManaged public var educatorCode: Int64
    @NSManaged public var id: Int64
    @NSManaged public var info: String?
    @NSManaged public var name: String?
    @NSManaged public var studentCode: Int64
    @NSManaged public var owners: NSSet?
    @NSManaged public var projects: NSSet?
    @NSManaged public var students: NSSet?

}

// MARK: Generated accessors for owners
extension Class {

    @objc(addOwnersObject:)
    @NSManaged public func addToOwners(_ value: Educator)

    @objc(removeOwnersObject:)
    @NSManaged public func removeFromOwners(_ value: Educator)

    @objc(addOwners:)
    @NSManaged public func addToOwners(_ values: NSSet)

    @objc(removeOwners:)
    @NSManaged public func removeFromOwners(_ values: NSSet)

}

// MARK: Generated accessors for projects
extension Class {

    @objc(addProjectsObject:)
    @NSManaged public func addToProjects(_ value: Project)

    @objc(removeProjectsObject:)
    @NSManaged public func removeFromProjects(_ value: Project)

    @objc(addProjects:)
    @NSManaged public func addToProjects(_ values: NSSet)

    @objc(removeProjects:)
    @NSManaged public func removeFromProjects(_ values: NSSet)

}

// MARK: Generated accessors for students
extension Class {

    @objc(addStudentsObject:)
    @NSManaged public func addToStudents(_ value: Student)

    @objc(removeStudentsObject:)
    @NSManaged public func removeFromStudents(_ value: Student)

    @objc(addStudents:)
    @NSManaged public func addToStudents(_ values: NSSet)

    @objc(removeStudents:)
    @NSManaged public func removeFromStudents(_ values: NSSet)

}

extension Class : Identifiable {

}
