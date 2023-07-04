//
//  Project+CoreDataProperties.swift
//  Groupy
//
//  Created by Luan Fazolin on 04/07/23.
//
//

import Foundation
import CoreData


extension Project {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Project> {
        return NSFetchRequest<Project>(entityName: "Project")
    }

    @NSManaged public var criteria: String?
    @NSManaged public var dueDate: Date?
    @NSManaged public var id: Int64
    @NSManaged public var info: String?
    @NSManaged public var name: String?
    @NSManaged public var startDate: Date?
    @NSManaged public var groups: NSSet?

}

// MARK: Generated accessors for groups
extension Project {

    @objc(addGroupsObject:)
    @NSManaged public func addToGroups(_ value: Group)

    @objc(removeGroupsObject:)
    @NSManaged public func removeFromGroups(_ value: Group)

    @objc(addGroups:)
    @NSManaged public func addToGroups(_ values: NSSet)

    @objc(removeGroups:)
    @NSManaged public func removeFromGroups(_ values: NSSet)

}

extension Project : Identifiable {

}
