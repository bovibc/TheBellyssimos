//
//  Student+CoreDataProperties.swift
//  Groupy
//
//  Created by Luan Fazolin on 05/07/23.
//
//

import Foundation
import CoreData


extension Student {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Student> {
        return NSFetchRequest<Student>(entityName: "Student")
    }

    @NSManaged public var ethnicity: String?
    @NSManaged public var gender: String?
    @NSManaged public var lgbt: Bool
    @NSManaged public var mbtiPersonality: String?
    @NSManaged public var motivation: String?
    @NSManaged public var skills: NSObject?
    @NSManaged public var skinTone: String?
    @NSManaged public var wsPersonality: String?
    @NSManaged public var classes: NSSet?
    @NSManaged public var groups: NSSet?
    @NSManaged public var workedWith: NSSet?

}

// MARK: Generated accessors for classes
extension Student {

    @objc(addClassesObject:)
    @NSManaged public func addToClasses(_ value: Class)

    @objc(removeClassesObject:)
    @NSManaged public func removeFromClasses(_ value: Class)

    @objc(addClasses:)
    @NSManaged public func addToClasses(_ values: NSSet)

    @objc(removeClasses:)
    @NSManaged public func removeFromClasses(_ values: NSSet)

}

// MARK: Generated accessors for groups
extension Student {

    @objc(addGroupsObject:)
    @NSManaged public func addToGroups(_ value: Group)

    @objc(removeGroupsObject:)
    @NSManaged public func removeFromGroups(_ value: Group)

    @objc(addGroups:)
    @NSManaged public func addToGroups(_ values: NSSet)

    @objc(removeGroups:)
    @NSManaged public func removeFromGroups(_ values: NSSet)

}

// MARK: Generated accessors for workedWith
extension Student {

    @objc(addWorkedWithObject:)
    @NSManaged public func addToWorkedWith(_ value: Student)

    @objc(removeWorkedWithObject:)
    @NSManaged public func removeFromWorkedWith(_ value: Student)

    @objc(addWorkedWith:)
    @NSManaged public func addToWorkedWith(_ values: NSSet)

    @objc(removeWorkedWith:)
    @NSManaged public func removeFromWorkedWith(_ values: NSSet)

}
